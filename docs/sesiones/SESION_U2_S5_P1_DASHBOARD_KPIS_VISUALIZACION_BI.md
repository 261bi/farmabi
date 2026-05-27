# Sesión U2 S5 P1: Ventas actuales vs año previo mismo periodo

## 1. Título

Comparativo de ventas actuales contra ventas del año pasado para el mismo periodo en Power BI.

## 2. Objetivo

Realizar un comparativo de ventas actuales con las ventas del año pasado para el mismo periodo usando inteligencia de tiempo y control de contexto en Power BI.

La práctica se construye como en el flujo real de clase:

```text
matriz de control -> segmentador -> medidas -> gráfico -> tarjetas -> KPI -> análisis diario
```

Al finalizar, el informe debe permitir:

- comparar ventas actuales vs año anterior
- analizar comportamiento por año
- analizar comportamiento por mes
- analizar comportamiento por día
- identificar crecimiento o disminución de ventas
- diferenciar una comparación de mismo periodo de una referencia anual completa

## 3. Relación con el laboratorio original

Esta práctica toma como referencia el paso 24 de `PBI03-Practica 04-Modelado de datos.docx`.

En el laboratorio original se usa:

```text
DTIEMPO[Date]
[Ventas]
Datos_Curso_DAX_Completo.xlsx
```

En el modelo BI de farmacia se adapta a:

```text
dim_fecha[fecha]
[Ventas Netas]
farmabi_dw.marts.fact_ventas
```

Si se trabaja directamente con el archivo Excel del laboratorio, reemplaza `dim_fecha[fecha]` por `DTIEMPO[Date]` y `[Ventas Netas]` por `[Ventas]`.

## 4. Requisitos previos

Antes de iniciar, valida que:

- `dim_fecha` esté relacionada con `fact_ventas`
- `dim_fecha[fecha]` sea de tipo fecha
- `dim_fecha` esté marcada como tabla de fechas en Power BI
- exista la medida `[Ventas Netas]`
- existan `año`, `mes_desc`, `mes_numero` y `dia`
- `dim_fecha[mes_desc]` esté ordenado por `dim_fecha[mes_numero]`

Relación esperada:

```text
dim_fecha[fecha_key] 1 ---- * fact_ventas[fecha_key]
```

## 5. Preparar la página de trabajo

Crea una página nueva para esta práctica.

Nombre sugerido:

```text
S5 P1 - Año previo
```

Distribución sugerida:

```text
Izquierda  -> segmentador de año y matriz de control
Centro    -> gráfico de líneas comparativo
Derecha   -> tarjetas y KPI
Inferior  -> visual diario, si se trabaja el detalle por día
```

## 6. Matriz de control

Primero crea una matriz para comprobar los datos por año y mes antes de crear el gráfico comparativo.

Visual:

```text
Matriz
```

Campos:

| Campo | Ubicacion |
|---|---|
| `dim_fecha[mes_desc]` | Filas |
| `dim_fecha[año]` | Columnas |
| `[Ventas Netas]` | Valores |

Lectura esperada:

- cada columna muestra un año
- cada fila muestra un mes
- los totales permiten validar rapidamente si las medidas posteriores cuadran

Esta matriz no es el visual final principal. Es un control para saber si los calculos comparativos tienen sentido.

## 7. Segmentador de año

Agrega un segmentador:

| Campo | Ubicacion |
|---|---|
| `dim_fecha[año]` | Campo |

Configúralo como lista.

Para la práctica, selecciona un solo año. Ejemplo:

```text
2026
```

Regla:

```text
La comparación de año previo debe evaluarse con un solo año seleccionado.
```

Si seleccionas dos años, `[Ventas Netas]` suma ambos años y la lectura deja de ser clara para el objetivo de esta práctica.

## 8. Medida base

Usa la medida principal de ventas del modelo:

```DAX
Ventas Netas =
SUM(fact_ventas[venta_neta])
```

## 9. Medida: ventas año previo mismo periodo

Agrega la siguiente medida en la tabla `_Medidas`.

```DAX
Ventas Anio Previo Mismo Periodo =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __meses_actuales =
    VALUES(dim_fecha[mes_numero])
VAR __dias_actuales =
    VALUES(dim_fecha[dia])
VAR __usar_dia =
    ISINSCOPE(dim_fecha[dia])
RETURN
    IF(
        ISBLANK(__anio_actual),
        BLANK(),
        IF(
            __usar_dia,
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_actual - 1,
                TREATAS(__meses_actuales, dim_fecha[mes_numero]),
                TREATAS(__dias_actuales, dim_fecha[dia])
            ),
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_actual - 1,
                TREATAS(__meses_actuales, dim_fecha[mes_numero])
            )
        )
    )
```

Esta medida compara el periodo visible contra el mismo periodo del año anterior.

Ejemplos:

```text
2026 seleccionado        -> enero-mayo 2026 vs enero-mayo 2025
marzo 2026 en el visual  -> marzo 2026 vs marzo 2025
día 10 de marzo 2026     -> día 10 de marzo 2026 vs día 10 de marzo 2025
```

Se usa `REMOVEFILTERS(dim_fecha)` porque el segmentador mantiene el año actual. Si no se remueve ese filtro, Power BI intenta calcular algo como:

```text
fecha del año previo y año actual al mismo tiempo
```

El resultado seria blanco.

## 10. Medidas de variación

Medida de variación absoluta:

```DAX
Variacion Ventas vs Anio Previo =
[Ventas Netas] - [Ventas Anio Previo Mismo Periodo]
```

Medida de variación porcentual:

```DAX
% Variacion Ventas vs Anio Previo =
DIVIDE(
    [Variacion Ventas vs Anio Previo],
    [Ventas Anio Previo Mismo Periodo]
)
```

Formato de `[% Variacion Ventas vs Anio Previo]`:

- tipo: porcentaje
- decimales: 2

Estas medidas se usan para tarjetas, tablas, matrices, tooltips y lectura ejecutiva. No son medidas auxiliares de eje.

## 11. Medida: año previo completo

Esta medida sirve como referencia anual completa.

```DAX
Ventas Anio Previo Completo =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_actual =
    SELECTEDVALUE(dim_fecha[mes_numero])
VAR __en_mes =
    ISINSCOPE(dim_fecha[mes_desc])
        || ISINSCOPE(dim_fecha[mes_numero])
RETURN
    IF(
        ISBLANK(__anio_actual),
        BLANK(),
        IF(
            __en_mes,
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_actual - 1,
                dim_fecha[mes_numero] = __mes_actual
            ),
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_actual - 1
            )
        )
    )
```

Uso recomendado:

```text
Ventas Año Previo Mismo Periodo -> KPI y tarjeta de comparación justa
Ventas Año Previo Completo      -> referencia anual completa
```

Ejemplo con 2026 seleccionado:

```text
Ventas Netas                         -> enero-mayo 2026
Ventas Año Previo Mismo Periodo     -> enero-mayo 2025
Ventas Año Previo Completo          -> enero-diciembre 2025
```

## 12. Tabla desconectada para el eje mensual

El gráfico del taller Excel puede mostrar el año previo hasta diciembre porque el eje tiene todos los meses disponibles.

En nuestro DW, si el eje usa `dim_fecha[mes_desc]` y el año actual tiene ventas solo hasta mayo, Power BI corta el eje en mayo. Activar `Mostrar elementos sin datos` no resuelve este caso porque el filtro del año actual sigue dejando visible solo el dominio enero-mayo.

Solución para clase: crear una tabla desconectada de meses.

```DAX
Meses Eje =
DISTINCT(
    SELECTCOLUMNS(
        dim_fecha,
        "mes_numero", dim_fecha[mes_numero],
        "mes_desc", dim_fecha[mes_desc]
    )
)
```

Luego ordena:

```text
Meses Eje[mes_desc] por Meses Eje[mes_numero]
```

No relaciones `Meses Eje` con `dim_fecha`. Su función es controlar el eje del gráfico.

## 13. Medidas auxiliares para el gráfico con Meses Eje

Estas medidas se usan solo para el gráfico que necesita mostrar enero-diciembre.

```DAX
Ventas Netas Eje Mes =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_eje =
    SELECTEDVALUE('Meses Eje'[mes_numero])
RETURN
    CALCULATE(
        [Ventas Netas],
        REMOVEFILTERS(dim_fecha),
        dim_fecha[año] = __anio_actual,
        dim_fecha[mes_numero] = __mes_eje
    )
```

```DAX
Ventas Anio Previo Completo Eje Mes =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_eje =
    SELECTEDVALUE('Meses Eje'[mes_numero])
RETURN
    CALCULATE(
        [Ventas Netas],
        REMOVEFILTERS(dim_fecha),
        dim_fecha[año] = __anio_actual - 1,
        dim_fecha[mes_numero] = __mes_eje
    )
```

Regla:

```text
Las medidas Eje Mes son auxiliares de visual.
No reemplazan a las medidas oficiales de análisis.
```

## 14. Tarjetas de control

Crea tarjetas o una tabla simple de control con:

| Medida | Uso |
|---|---|
| `[Ventas Netas]` | ventas del periodo actual |
| `[Ventas Anio Previo Mismo Periodo]` | comparación justa mismo periodo |
| `[Ventas Anio Previo Completo]` | referencia anual completa |

Ejemplo con 2026 seleccionado:

```text
Ventas Netas                     -> 41,820.75
Ventas Año Previo Mismo Periodo -> 50,994.50
Ventas Año Previo Completo      -> 122,075.00
```

Si esos importes coinciden con la matriz de control, la lógica está correcta.

## 15. Gráfico de líneas mensual

Ahora crea el gráfico principal.

Visual:

```text
Gráfico de líneas
```

Campos:

| Campo | Ubicacion |
|---|---|
| `Meses Eje[mes_desc]` | Eje X |
| `[Ventas Netas Eje Mes]` | Eje Y |
| `[Ventas Anio Previo Completo Eje Mes]` | Eje Y |

Formato recomendado:

- ordenar el eje por `Meses Eje[mes_numero]`
- título fijo: `Ventas actuales vs año previo`
- subtitulo dinámico con la medida del paso 16
- mantener la leyenda visible

Resultado esperado:

- la linea del año actual se muestra hasta el ultimo mes con ventas
- la linea del año previo puede mostrarse hasta diciembre
- el eje mensual no depende del año filtrado

## 16. Medida: título dinámico

Crear una medida para que el subtitulo del gráfico cambie según el ultimo periodo con ventas en el contexto seleccionado.

```DAX
Titulo Ventas Actual vs Anio Previo =
VAR __ultf =
    LASTNONBLANK(dim_fecha[fecha], [Ventas Netas])
VAR __anioact =
    FORMAT(__ultf, "yyyy")
VAR __anioprev =
    FORMAT(
        DATE(YEAR(__ultf) - 1, 1, 1),
        "yyyy"
    )
RETURN
    __anioact & " VS " & __anioprev
```

Aplicar la medida en el subtitulo del gráfico:

1. Selecciona el gráfico.
2. Ve a `Formato visual`.
3. Entra a `General`.
4. Activa `Subtitulo`.
5. En `Texto`, selecciona el boton `fx`.
6. Configura:

```text
Formato por: Valor de campo
Basado en el campo: [Título Ventas Actual vs Año Previo]
```

7. Confirma con `Aceptar`.

Recomendación:

```text
Título del gráfico    -> nombre fijo del análisis
Subtitulo del gráfico -> periodo dinámico, por ejemplo 2026 VS 2025
```

## 17. Convertir el gráfico copiado a KPI anual

Esta parte replica el flujo del taller: crear un gráfico, copiarlo y cambiar el compilador visual a KPI.

Cómo el subtitulo dinámico ya fue configurado en el gráfico de líneas, al copiar y pegar el visual el KPI hereda esa configuracion.

Pasos:

1. Selecciona el gráfico de líneas mensual.
2. Copia y pega el visual.
3. En `Visualizaciones`, cambia el compilador visual a `KPI`.
4. Es normal que el KPI aparezca inicialmente como `(En blanco)`, porque viene copiado con las medidas auxiliares del gráfico.
5. Reemplaza los campos por las medidas oficiales:

| Campo | Ubicacion |
|---|---|
| `[Ventas Netas]` | Indicador |
| `Meses Eje[mes_desc]` | Eje de tendencia |
| `[Ventas Anio Previo Mismo Periodo]` | Objetivo |

6. Verifica que el KPI muestre el valor de ventas, el objetivo y el porcentaje de variación.

Antes del cambio, el KPI puede quedar asi:

```text
Valor    -> [Ventas Netas Eje Mes]
Destino  -> [Ventas Año Previo Completo Eje Mes]
```

Despues del cambio, debe quedar asi:

```text
Valor             -> [Ventas Netas]
Eje de tendencia  -> Meses Eje[mes_desc]
Destino           -> [Ventas Año Previo Mismo Periodo]
```

Lectura del KPI anual:

```text
valor central -> total del año/periodo seleccionado
fondo         -> queda sin tendencia real; no se fuerza comportamiento mensual
objetivo      -> ventas del mismo periodo del año previo
```

Decisión de diseno:

```text
Para el KPI anual se prioriza que el valor central y el objetivo sean correctos.
El comportamiento mensual queda en el gráfico de líneas, no en el fondo del KPI.
```

Si despues de reemplazar los campos el KPI ya muestra correctamente el valor, no es necesario agregar el filtro `no esta en blanco`.

### 17.1 Ajustar el eje de tendencia del KPI

Despues de cambiar el visual a KPI, revisa el campo `Eje de tendencia`.

En el taller original con Excel se usaba:

```text
DTIEMPO[Date] -> Mes
```

En nuestro modelo BI de farmacia, para el KPI anual usa el eje mensual desconectado:

```text
Meses Eje[mes_desc]
```

Resultado esperado:

```text
Indicador       -> [Ventas Netas]
Eje tendencia   -> Meses Eje[mes_desc]
Objetivo        -> [Ventas Año Previo Mismo Periodo]
```

Si al copiar el gráfico el eje de tendencia queda con varios niveles, por ejemplo:

```text
año
trimestre
mes_desc
día
```

quita los niveles que sobran y deja solo:

```text
Meses Eje[mes_desc]
```

No uses la jerarquía automática de `dim_fecha[fecha]` para este KPI.

No uses `dim_fecha[mes_desc]` en este KPI anual si el objetivo es conservar el valor anual del KPI. Con `dim_fecha[mes_desc]`, el fondo se ve mejor, pero el valor central puede pasar a representar el ultimo mes del eje. Para este caso dejamos el fondo sin tendencia real y conservamos el comparativo anual correcto.

### 17.2 Si el KPI sigue en blanco

Este ajuste solo se aplica si el KPI sigue mostrando `(En blanco)` despues de reemplazar las medidas auxiliares por las medidas oficiales.

1. Abre el panel `Filtros`.
2. En `Filtros de este objeto visual`, ubica la medida `[Ventas Netas]`.
3. Cambia la condición de filtro a:

```text
no está en blanco
```

4. Selecciona `Aplicar filtro`.
5. Verifica que el KPI ya muestre el valor de ventas y el objetivo.

Si despues de aplicar el filtro el KPI sigue en blanco, revisa:

- que exista un solo año seleccionado
- que `[Ventas Netas]` tenga datos para ese año
- que el eje de tendencia sea `Meses Eje[mes_desc]`
- que el objetivo sea `[Ventas Anio Previo Mismo Periodo]`

### 17.3 KPI mensual con fondo de comportamiento

Si se quiere ver el fondo con la progresión mensual, crea un segundo KPI.

Este KPI no reemplaza al KPI anual. Sirve para leer el ultimo mes visible contra el mismo mes del año previo.

Configura:

| Campo | Ubicacion |
|---|---|
| `[Ventas Netas]` | Indicador |
| `dim_fecha[mes_desc]` o `Calendario[mes_desc]` | Eje de tendencia |
| `[Ventas Anio Previo Mismo Periodo]` | Objetivo |

Lectura:

```text
valor central -> ultimo mes visible del año seleccionado
fondo         -> comportamiento mensual del año seleccionado
objetivo      -> mismo mes del año previo
```

Ejemplo con 2026 seleccionado:

```text
KPI anual
Valor:    41,820.75
Objetivo: 50,994.50

KPI mensual con fondo
Valor:    mayo 2026 = 5,468.25
Objetivo: mayo 2025 = 8,959.50
```

Conclusion:

```text
KPI anual                 -> Meses Eje[mes_desc], valor anual correcto, fondo sin tendencia real
KPI mensual con fondo     -> dim_fecha[mes_desc], valor del ultimo mes, fondo mensual visible
Gráfico de líneas mensual -> Meses Eje[mes_desc], enero-diciembre y referencia completa
```

### 17.4 Formato de los KPI

En `Formato visual`, revisa:

- título fijo del visual: `Ventas actuales vs año previo`
- subtitulo dinámico: `[Titulo Ventas Actual vs Anio Previo]`
- etiqueta de objetivo visible
- unidades de visualización según criterio del docente, por ejemplo `Miles`
- colores sobrios para no competir con la lectura del número

Nota:

```text
El KPI anual comunica el desempeno acumulado contra el mismo periodo del año previo.
El KPI mensual con fondo comunica el ultimo mes visible contra el mismo mes del año previo.
El gráfico de líneas muestra la forma mensual y la referencia anual completa.
```

## 18. Comparativo por días

Para analizar por días, crea otro KPI copiando el KPI mensual.

No reemplaces el KPI mensual, porque al cambiar el eje a día se pierde la lectura por mes.

Configura el segundo KPI asi:

| Campo | Ubicacion |
|---|---|
| `[Ventas Netas]` | Indicador |
| `dim_fecha[dia]` | Eje de tendencia |
| `[Ventas Anio Previo Mismo Periodo]` | Objetivo |
| `dim_fecha[mes_desc]` | Filtro o segmentador |

Agrega un filtro de mes para concentrar la lectura diaria.

Usa `dim_fecha[fecha]` solo si necesitas mostrar la fecha completa como texto o detalle exacto. Para el KPI diario y la jerarquía `Calendario`, usa `dim_fecha[dia]`; no arrastres la jerarquía automática de `fecha`.

## 19. Medida: título dinámico por días

```DAX
Titulo Ventas Actual vs Anio Previo x Dias =
VAR __ultf =
    LASTNONBLANK(dim_fecha[fecha], [Ventas Netas])
VAR __anioact =
    FORMAT(__ultf, "dd-mmmm-yyyy")
VAR __anioprev =
    FORMAT(
        DATE(
            YEAR(__ultf) - 1,
            MONTH(__ultf),
            DAY(__ultf)
        ),
        "dd-mmmm-yyyy"
    )
RETURN
    __anioact & " VS " & __anioprev
```

Usa está medida como subtitulo condicional del KPI diario.

## 20. Preguntas de análisis

Responde con base en los visuales:

- Las ventas actuales superan a las del año anterior?
- En que meses hubo mayor crecimiento?
- En que meses disminuyeron las ventas?
- Qué diferencia hay entre mismo periodo y año previo completo?
- Qué días muestran diferencias más marcadas?
- Qué productos explican la diferencia?
- Qué categorias crecieron más frente al año anterior?
- Qué vendedores o clientes aportaron más al crecimiento?

## 21. Validación SQL

La validación depende del año seleccionado en Power BI. Ajusta los años según los datos disponibles.

Ejemplo para comparar 2026 contra 2025:

```sql
SELECT
    df.mes_numero,
    df.mes_desc,
    SUM(CASE WHEN df.anio = 2026 THEN fv.venta_neta ELSE 0 END) AS ventas_actuales,
    SUM(CASE WHEN df.anio = 2025 THEN fv.venta_neta ELSE 0 END) AS ventas_anio_previo,
    SUM(CASE WHEN df.anio = 2026 THEN fv.venta_neta ELSE 0 END)
        - SUM(CASE WHEN df.anio = 2025 THEN fv.venta_neta ELSE 0 END) AS variacion_ventas
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
GROUP BY
    df.mes_numero,
    df.mes_desc
ORDER BY
    df.mes_numero;
```

Para validar por día, agrega `df.fecha` al `SELECT`, al `GROUP BY` y al `ORDER BY`.

Para validar año previo completo:

```sql
SELECT
    SUM(fv.venta_neta) AS ventas_anio_previo_completo
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
WHERE df.anio = 2025;
```

## 22. Actividad final: organizar medidas en carpetas

Para mantener el modelo semántico ordenado, organiza las medidas dentro de la tabla `_Medidas`.

Ruta en Power BI:

```text
Vista Modelo -> seleccionar medida -> Propiedades -> Carpeta para mostrar
```

Si no aparece el panel de propiedades:

```text
Ver -> Paneles -> Propiedades
```

Carpetas sugeridas:

```text
01 Basicas
02 Tiempo - Año previo
03 Tiempo - Mes anterior
04 Auxiliares
```

Distribución recomendada:

```text
01 Basicas
- Descuentos
- Pedidos
- Ticket Promedio
- Unidades Vendidas
- Ventas Netas
- Ventas Netas Acumuladas
```

```text
02 Tiempo - Año previo
- Ventas Año Previo Mismo Periodo
- Ventas Año Previo Completo
- Variación Ventas vs Año Previo
- % Variación Ventas vs Año Previo
- Título Ventas Actual vs Año Previo
- Título Ventas Actual vs Año Previo x Días
```

```text
03 Tiempo - Mes anterior
- Venta Mes Anterior
- Variación Ventas vs Mes Anterior
- % Variación Ventas vs Mes Anterior
```

```text
04 Auxiliares
- Ventas Netas Eje Mes
- Ventas Año Previo Completo Eje Mes
```

Regla:

```text
Las medidas auxiliares sirven para resolver un visual especifico.
No deben mezclarse con las medidas oficiales de análisis.
```

## 23. Resultado esperado

El informe debe permitir:

- comparar ventas actuales vs año anterior en mismo periodo
- mostrar una referencia anual completa del año previo
- explicar por que se usa `Meses Eje`
- analizar comportamiento por año
- analizar comportamiento por mes
- analizar comportamiento por día
- identificar crecimiento o disminución de ventas
- organizar medidas por carpetas funcionales

## 24. Checklist

- existe matriz de control por mes y año
- existe segmentador de año
- existe medida `[Ventas Anio Previo Mismo Periodo]`
- existe medida `[Ventas Anio Previo Completo]`
- existe tabla `Meses Eje`
- existen medidas auxiliares `[Ventas Netas Eje Mes]` y `[Ventas Anio Previo Completo Eje Mes]`
- existe gráfico de líneas mensual con `Meses Eje[mes_desc]`
- existe tarjeta de ventas actuales, mismo periodo y año previo completo
- existe KPI anual con `Meses Eje[mes_desc]` y valores acumulados correctos
- existe KPI mensual con `dim_fecha[mes_desc]` o `Calendario[mes_desc]` y fondo de comportamiento
- existe KPI diario independiente
- el subtitulo dinámico cambia según el periodo
- los filtros de año y mes funcionan
- el resultado fue validado contra SQL
- las medidas quedaron organizadas en carpetas dentro de `_Medidas`

## 25. Evidencias a entregar

- captura de la matriz de control
- captura del segmentador de año
- captura de la tabla `Meses Eje`
- captura del gráfico mensual con eje enero-diciembre
- captura de tarjetas de control
- captura del KPI anual
- captura del KPI mensual con fondo de comportamiento
- captura del KPI diario
- captura con filtro de mes aplicado para el análisis diario
- captura de las carpetas de medidas en `_Medidas`
- captura de validación SQL

Nombre sugerido:

```text
FarmaciaPBI_U2_S5_P1_Ventas_Actual_vs_Anio_Previo.pbix
```

## 26. Cierre

Con esta práctica, la sesión 05 inicia con un comparativo real de negocio: no solo cuánto se vendió, sino si la venta mejora o cae frente al mismo periodo del año anterior.

Tambien queda una decisión importante de modelado visual:

```text
las medidas calculan valores,
pero el eje define que categorias puede dibujar el visual.
```

