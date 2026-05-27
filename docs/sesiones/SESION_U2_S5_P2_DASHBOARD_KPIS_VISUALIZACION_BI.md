# Sesión U2 S5 P2: Ventas del mes actual vs mes anterior

## 1. Título

Comparativo de ventas del mes actual contra el mes anterior en Power BI.

## 2. Objetivo

Realizar un comparativo entre las ventas del mes seleccionado y las ventas del mes anterior.

La práctica sigue el mismo criterio construido en la P1:

```text
matriz de control -> segmentadores -> medidas -> tarjetas -> gráfico -> KPI -> validación
```

Al finalizar, el informe debe permitir:

- comparar ventas del mes seleccionado vs mes anterior
- identificar crecimiento mensual
- identificar disminución mensual
- analizar comportamiento por día dentro del mes
- manejar correctamente el cambio de enero a diciembre del año anterior

## 3. Relación con la práctica anterior

Esta práctica continúa desde:

- [SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md](SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md)

En la P1 se compararon ventas actuales contra el mismo periodo del año previo. En la P2 se cambia la pregunta:

```text
Cómo va el mes seleccionado frente al mes anterior?
```

## 4. Relación con el laboratorio original

Esta práctica toma como referencia el paso 25 de `PBI03-Practica 04-Modelado de datos.docx`.

En el laboratorio original se usa:

```text
DTIEMPO[Date]
[Ventas]
```

En el modelo BI de farmacia se adapta a:

```text
dim_fecha[fecha]
[Ventas Netas]
```

Si se trabaja directamente con el archivo Excel del laboratorio, reemplaza `dim_fecha[fecha]` por `DTIEMPO[Date]` y `[Ventas Netas]` por `[Ventas]`.

## 5. Requisitos previos

Antes de iniciar, valida que:

- `dim_fecha` esté marcada como tabla de fechas
- `dim_fecha[fecha]` sea una columna de tipo fecha
- exista la medida `[Ventas Netas]`
- existan `año`, `mes_desc`, `mes_numero` y `dia`
- `dim_fecha[mes_desc]` esté ordenado por `dim_fecha[mes_numero]`
- las medidas de P1 ya estén organizadas en carpetas

## 6. Preparar la página de trabajo

Puedes continuar en la misma página de la P1 o crear una página nueva.

Nombre sugerido:

```text
S5 P2 - Mes anterior
```

Distribución sugerida:

```text
Izquierda  -> segmentadores de año y mes + matriz de control
Centro    -> gráfico diario mes actual vs mes anterior
Derecha   -> tarjetas y KPI
```

## 7. Segmentadores de año y mes

Agrega o reutiliza dos segmentadores:

| Campo | Uso |
|---|---|
| `dim_fecha[año]` | seleccionar un solo año |
| `dim_fecha[mes_desc]` | seleccionar un solo mes |

Regla:

```text
La comparación mes actual vs mes anterior debe trabajarse con un solo año y un solo mes seleccionados.
```

Ejemplos:

```text
agosto 2022 -> compara contra julio 2022
enero 2026  -> compara contra diciembre 2025
```

## 8. Matriz de control por mes y día

Crea una matriz para validar los datos antes de construir el gráfico.

Visual:

```text
Matriz
```

Campos:

| Campo | Ubicación |
|---|---|
| `dim_fecha[mes_desc]` | Filas |
| `dim_fecha[dia]` | Filas debajo de mes |
| `dim_fecha[año]` | Columnas |
| `[Ventas Netas]` | Valores |

Lectura esperada:

- el mes seleccionado muestra sus días
- el total del mes coincide con la tarjeta de `[Ventas Netas]`
- el mes anterior se puede ubicar en la matriz para validar la medida `[Venta Mes Anterior]`

## 9. Medida: venta mes anterior

Agrega la siguiente medida en la tabla `_Medidas`.

```DAX
Venta Mes Anterior =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_actual =
    SELECTEDVALUE(dim_fecha[mes_numero])
VAR __anio_previo =
    IF(__mes_actual = 1, __anio_actual - 1, __anio_actual)
VAR __mes_previo =
    IF(__mes_actual = 1, 12, __mes_actual - 1)
VAR __dias_actuales =
    VALUES(dim_fecha[dia])
VAR __usar_dia =
    ISINSCOPE(dim_fecha[dia])
RETURN
    IF(
        ISBLANK(__anio_actual) || ISBLANK(__mes_actual),
        BLANK(),
        IF(
            __usar_dia,
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_previo,
                dim_fecha[mes_numero] = __mes_previo,
                TREATAS(__dias_actuales, dim_fecha[dia])
            ),
            CALCULATE(
                [Ventas Netas],
                REMOVEFILTERS(dim_fecha),
                dim_fecha[año] = __anio_previo,
                dim_fecha[mes_numero] = __mes_previo
            )
        )
    )
```

Esta medida compara:

```text
mes seleccionado completo -> mes anterior completo
día del mes seleccionado  -> mismo número de día del mes anterior
```

El cambio de enero a diciembre del año anterior se controla con:

```DAX
IF(__mes_actual = 1, __anio_actual - 1, __anio_actual)
IF(__mes_actual = 1, 12, __mes_actual - 1)
```

## 10. Medidas de variación

Medida de variación absoluta:

```DAX
Variacion Ventas vs Mes Anterior =
[Ventas Netas] - [Venta Mes Anterior]
```

Medida de variación porcentual:

```DAX
% Variacion Ventas vs Mes Anterior =
DIVIDE(
    [Variacion Ventas vs Mes Anterior],
    [Venta Mes Anterior]
)
```

Formato de `[% Variacion Ventas vs Mes Anterior]`:

- tipo: porcentaje
- decimales: 2

## 11. Medida: título dinámico mensual

```DAX
Titulo Ventas Mes Actual vs Mes Anterior =
VAR __ultf =
    LASTNONBLANK(dim_fecha[fecha], [Ventas Netas])
VAR __mesact =
    FORMAT(__ultf, "mmmm yyyy")
VAR __mesprev =
    FORMAT(EDATE(__ultf, -1), "mmmm yyyy")
RETURN
    __mesact & " VS " & __mesprev
```

Aplicar la medida en el subtítulo del gráfico o KPI:

1. Selecciona el visual.
2. Ve a `Formato visual`.
3. Entra a `General`.
4. Activa `Subtítulo`.
5. En `Texto`, selecciona el botón `fx`.
6. Configura:

```text
Formato por: Valor de campo
Basado en el campo: [Titulo Ventas Mes Actual vs Mes Anterior]
```

7. Confirma con `Aceptar`.

## 12. Tarjetas de control

Agrega tarjetas o una tabla simple de control con:

| Medida | Uso |
|---|---|
| `[Ventas Netas]` | ventas del mes seleccionado |
| `[Venta Mes Anterior]` | ventas del mes anterior |
| `[Variacion Ventas vs Mes Anterior]` | diferencia absoluta |
| `[% Variacion Ventas vs Mes Anterior]` | diferencia porcentual |

Validación esperada:

```text
agosto 2022 seleccionado
[Ventas Netas]        -> ventas de agosto 2022
[Venta Mes Anterior]  -> ventas de julio 2022
```

## 13. Meta anual y odómetro

Antes del gráfico diario, agrega el odómetro de seguimiento ejecutivo. En esta página sí hay espacio y ayuda a conectar la comparación mensual con una meta comercial.

### 13.1 Medida: meta anual

Regla de negocio:

```text
La meta es aumentar las ventas en 20% frente al mismo periodo del año previo.
```

Por eso, la meta se calcula multiplicando las ventas del año previo mismo periodo por `1.20`.

```DAX
Ventas Meta Anual =
[Ventas Anio Previo Mismo Periodo] * 1.20
```

Lectura:

```text
si el año seleccionado es 2026 y el mes seleccionado es mayo,
la meta toma enero-mayo 2025 y le agrega 20%.
```

### 13.2 Medidas de cumplimiento

Variación contra meta:

```DAX
Variacion Ventas vs Meta Anual =
[Ventas Netas] - [Ventas Meta Anual]
```

Porcentaje de cumplimiento:

```DAX
% Cumplimiento Meta Anual =
DIVIDE(
    [Ventas Netas],
    [Ventas Meta Anual]
)
```

Formato:

- `[Ventas Meta Anual]`: moneda
- `[Variacion Ventas vs Meta Anual]`: moneda
- `[% Cumplimiento Meta Anual]`: porcentaje con 2 decimales

### 13.3 Visual: odómetro

Agrega un visual de odómetro.

Campos:

| Campo | Ubicación |
|---|---|
| `[Ventas Netas]` | Valor |
| vacío o 0 | Valor mínimo |
| `[Ventas Meta Anual]` | Valor máximo |
| `[Ventas Anio Previo Mismo Periodo]` | Valor de destino |

Lectura esperada:

```text
valor central -> ventas del periodo seleccionado
arco máximo   -> meta anual
línea destino -> ventas del mismo periodo del año previo
```

Si Power BI no permite poner `0` como campo de valor mínimo, deja el mínimo vacío. El odómetro usará cero como base visual.

### 13.4 Decisiones de interacciones

Después de colocar el odómetro y los KPI, configura las interacciones para que la página no se filtre de manera accidental.

Ruta:

```text
Seleccionar visual -> Formato -> Editar interacciones
```

Decisiones recomendadas:

| Visual seleccionado | Interacción recomendada | Motivo |
|---|---|---|
| Segmentador `dim_fecha[año]` | Filtrar todos los visuales | define el año de análisis |
| Segmentador `dim_fecha[mes_desc]` | Filtrar tarjetas, KPI, odómetro y gráficos | define el mes seleccionado |
| Matriz de control | Sin interacción sobre KPI, odómetro y gráficos | evita que un clic en una fila cambie todo el análisis |
| Gráfico mensual | Sin interacción sobre tarjetas, odómetro y KPI | se usa como contexto visual, no como filtro principal |
| Gráfico diario | Sin interacción sobre tarjetas, odómetro y KPI | evita lecturas parciales por día |

Regla:

```text
Los segmentadores controlan la página.
Los visuales explican la página, pero no deben re-filtrar todo por accidente.
```

## 14. Gráfico diario mes actual vs mes anterior

Para el gráfico diario ocurre el mismo problema que en la P1 con los meses: si usas `dim_fecha[dia]`, el eje queda condicionado por el mes seleccionado. Si mayo llega hasta el día 17, pero abril tuvo ventas hasta el día 27, el día 27 de abril no aparece en el eje.

Solución para clase: crear una tabla desconectada de días.

```DAX
Dias Eje =
SELECTCOLUMNS(
    GENERATESERIES(1, 31, 1),
    "dia", [Value]
)
```

No relaciones `Dias Eje` con `dim_fecha`.

### 14.1 Medidas auxiliares para el eje diario

Estas medidas se usan solo para el gráfico diario.

```DAX
Ventas Netas Eje Dia =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_actual =
    SELECTEDVALUE(dim_fecha[mes_numero])
VAR __dia_eje =
    SELECTEDVALUE('Dias Eje'[dia])
RETURN
    CALCULATE(
        [Ventas Netas],
        REMOVEFILTERS(dim_fecha),
        dim_fecha[año] = __anio_actual,
        dim_fecha[mes_numero] = __mes_actual,
        dim_fecha[dia] = __dia_eje
    )
```

```DAX
Venta Mes Anterior Eje Dia =
VAR __anio_actual =
    SELECTEDVALUE(dim_fecha[año])
VAR __mes_actual =
    SELECTEDVALUE(dim_fecha[mes_numero])
VAR __anio_previo =
    IF(__mes_actual = 1, __anio_actual - 1, __anio_actual)
VAR __mes_previo =
    IF(__mes_actual = 1, 12, __mes_actual - 1)
VAR __dia_eje =
    SELECTEDVALUE('Dias Eje'[dia])
RETURN
    CALCULATE(
        [Ventas Netas],
        REMOVEFILTERS(dim_fecha),
        dim_fecha[año] = __anio_previo,
        dim_fecha[mes_numero] = __mes_previo,
        dim_fecha[dia] = __dia_eje
    )
```

Regla:

```text
Las medidas Eje Dia son auxiliares de visual.
No reemplazan a [Ventas Netas] ni a [Venta Mes Anterior] en tarjetas o KPI.
```

### 14.2 Crear el gráfico diario

Crea un gráfico de líneas para analizar la evolución diaria.

Visual:

```text
Gráfico de líneas
```

Campos:

| Campo | Ubicación |
|---|---|
| `Dias Eje[dia]` | Eje X |
| `[Ventas Netas Eje Dia]` | Eje Y |
| `[Venta Mes Anterior Eje Dia]` | Eje Y |
| `[Variacion Ventas vs Mes Anterior]` | Tooltip |
| `[% Variacion Ventas vs Mes Anterior]` | Tooltip |

Lectura esperada:

- cada punto compara un día del mes seleccionado contra el mismo número de día del mes anterior
- el total mensual se interpreta en las tarjetas
- la forma diaria se interpreta en el gráfico
- si el mes anterior tiene ventas en un día posterior al último día con ventas del mes actual, ese día también se puede dibujar

Antes de copiar el gráfico para convertirlo en KPI, configura el subtítulo dinámico:

1. Selecciona el gráfico diario.
2. Ve a `Formato visual`.
3. Entra a `General`.
4. Activa `Subtítulo`.
5. En `Texto`, selecciona el botón `fx`.
6. Configura:

```text
Formato por: Valor de campo
Basado en el campo: [Titulo Ventas Mes Actual vs Mes Anterior]
```

7. Confirma con `Aceptar`.

Resultado esperado:

```text
mayo 2026 VS abril 2026
```

Nota:

```text
Para este gráfico usa Dias Eje[dia].
Usa dim_fecha[dia] solo para KPI o matrices donde quieras respetar el contexto natural del calendario.
```

## 15. Convertir el gráfico copiado a KPI mensual

Esta parte replica el flujo del taller original: copiar el gráfico diario y cambiarlo a KPI.

Para el KPI mensual no uses `Dias Eje`. El KPI debe resumir el mes seleccionado contra el mes anterior y mostrar como fondo el comportamiento diario natural del calendario.

Como el subtítulo dinámico ya fue configurado en el gráfico diario, al copiar y pegar el visual el KPI hereda esa configuración.

Pasos:

1. Selecciona el gráfico diario.
2. Copia y pega el visual.
3. Cambia el compilador visual a `KPI`.
4. Configura:

| Campo | Ubicación |
|---|---|
| `[Ventas Netas]` | Indicador |
| `dim_fecha[dia]` | Eje de tendencia |
| `[Venta Mes Anterior]` | Objetivo |

Lectura del KPI mensual:

```text
valor central -> ventas del mes seleccionado
fondo         -> comportamiento diario del mes seleccionado segun dim_fecha[dia]
objetivo      -> ventas del mes anterior
```

Configuración final:

```text
KPI mensual
Valor             -> [Ventas Netas]
Eje de tendencia  -> dim_fecha[dia]
Destino           -> [Venta Mes Anterior]
```

No uses en este KPI:

```text
Dias Eje[dia]
[Ventas Netas Eje Dia]
[Venta Mes Anterior Eje Dia]
```

Esos elementos quedan reservados para el gráfico diario.

Si el KPI aparece en blanco:

1. Revisa que haya un solo año y un solo mes seleccionados.
2. Verifica que el eje de tendencia sea `dim_fecha[dia]`.
3. Si aún aparece en blanco, en filtros del objeto visual configura `[Ventas Netas]` como:

```text
no está en blanco
```

## 16. Diferencia entre gráfico diario y KPI mensual

No mezcles el uso de ambos visuales:

```text
Gráfico diario -> explica qué días suben o caen frente al mes anterior
KPI mensual    -> resume el mes seleccionado contra el mes anterior
```

Si el mes seleccionado no está completo, el KPI compara lo que existe en el periodo seleccionado contra el mes anterior según la medida.

## 17. Segmentadores recomendados

Además de año y mes, puedes agregar:

- `dim_producto[nombre_familia]`
- `dim_producto[nombre_categoria]`
- `dim_estado_pedido[estado_pedido]`
- `dim_vendedor[nombre_vendedor]`

Regla:

```text
Primero valida la comparación sin filtros adicionales.
Luego aplica filtros de negocio para explicar la diferencia.
```

## 18. Preguntas de análisis

Responde con base en los visuales:

- Las ventas del mes seleccionado son mayores que las del mes anterior?
- Cuál es la variación absoluta?
- Cuál es la variación porcentual?
- Qué días explican la diferencia?
- Hay días sin venta en el mes actual o en el mes anterior?
- Qué productos explican el aumento o disminución?
- Qué categorías muestran mejor comportamiento mensual?
- Qué vendedor tuvo mejor desempeño reciente?

## 19. Validación SQL

La validación depende del mes seleccionado. Ajusta los meses según los datos disponibles.

Ejemplo para comparar agosto de 2022 contra julio de 2022:

```sql
SELECT
    SUM(CASE
        WHEN df.anio = 2022 AND df.mes_numero = 8
        THEN fv.venta_neta ELSE 0
    END) AS ventas_mes_actual,
    SUM(CASE
        WHEN df.anio = 2022 AND df.mes_numero = 7
        THEN fv.venta_neta ELSE 0
    END) AS ventas_mes_anterior,
    SUM(CASE
        WHEN df.anio = 2022 AND df.mes_numero = 8
        THEN fv.venta_neta ELSE 0
    END)
        - SUM(CASE
            WHEN df.anio = 2022 AND df.mes_numero = 7
            THEN fv.venta_neta ELSE 0
        END) AS variacion_ventas
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key;
```

Para validar por día:

```sql
SELECT
    df.dia,
    SUM(CASE
        WHEN df.anio = 2022 AND df.mes_numero = 8
        THEN fv.venta_neta ELSE 0
    END) AS ventas_mes_actual,
    SUM(CASE
        WHEN df.anio = 2022 AND df.mes_numero = 7
        THEN fv.venta_neta ELSE 0
    END) AS ventas_mes_anterior
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
WHERE
    (df.anio = 2022 AND df.mes_numero IN (7, 8))
GROUP BY
    df.dia
ORDER BY
    df.dia;
```

## 20. Actividad final: completar carpetas de medidas

Continúa la organización iniciada en la P1.

Ruta:

```text
Vista Modelo -> seleccionar medida -> Propiedades -> Carpeta para mostrar
```

Carpeta para esta práctica:

```text
03 Tiempo - Mes anterior
```

Medidas:

```text
- Venta Mes Anterior
- Variacion Ventas vs Mes Anterior
- % Variacion Ventas vs Mes Anterior
- Titulo Ventas Mes Actual vs Mes Anterior
```

Si se crearon medidas auxiliares para gráficos, colócalas en:

```text
04 Auxiliares
```

Medidas auxiliares de esta práctica:

```text
- Ventas Netas Eje Dia
- Venta Mes Anterior Eje Dia
```

Medidas de meta y odómetro:

```text
05 Metas
- Ventas Meta Anual
- Variacion Ventas vs Meta Anual
- % Cumplimiento Meta Anual
```

## 21. Resultado esperado

El informe debe permitir:

- comparar ventas del mes seleccionado vs mes anterior
- identificar crecimiento mensual
- identificar disminución mensual
- analizar tendencia diaria dentro del mes
- mostrar odómetro de ventas contra meta anual
- manejar correctamente enero contra diciembre del año anterior
- usar `CALCULATE`, `REMOVEFILTERS` y filtros de calendario para cambiar el contexto temporal

## 22. Checklist

- existe segmentador de año
- existe segmentador de mes
- existe matriz de control por mes y día
- existe medida `[Venta Mes Anterior]`
- existe medida `[Variacion Ventas vs Mes Anterior]`
- existe medida `[% Variacion Ventas vs Mes Anterior]`
- existe medida `[Ventas Meta Anual]`
- existe odómetro
- existe título dinámico mensual
- existen tarjetas de control
- existe gráfico diario mes actual vs mes anterior
- existe tabla `Dias Eje`
- existen medidas auxiliares `[Ventas Netas Eje Dia]` y `[Venta Mes Anterior Eje Dia]`
- existe KPI mensual
- las interacciones fueron configuradas
- los segmentadores de año y mes funcionan
- enero compara contra diciembre del año anterior
- el resultado fue validado contra SQL
- las medidas de mes anterior quedaron en la carpeta `03 Tiempo - Mes anterior`

## 23. Evidencias a entregar

- captura de segmentadores de año y mes
- captura de matriz de control por mes y día
- captura de tarjetas comparativas
- captura del odómetro
- captura de edición de interacciones
- captura de la tabla `Dias Eje`
- captura de gráfico diario
- captura del KPI mes actual vs mes anterior
- captura con filtro de mes aplicado
- captura de `_Medidas` con la carpeta `03 Tiempo - Mes anterior`
- captura de validación SQL
- tres conclusiones ejecutivas

Nombre sugerido:

```text
FarmaciaPBI_U2_S5_P2_Ventas_Mes_Actual_vs_Mes_Anterior.pbix
```

## 24. Cierre

Con esta práctica, el reporte agrega una lectura de corto plazo: cómo va el mes seleccionado frente al mes anterior y qué días explican la diferencia.

