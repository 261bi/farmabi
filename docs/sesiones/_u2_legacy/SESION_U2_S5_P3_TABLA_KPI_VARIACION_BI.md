# Sesión U2 S5 P3: Tabla KPI de variación

## 1. Título

Construcción de tablas KPI con variación de ventas e iconos en Power BI.

## 2. Objetivo

Crear tablas KPI para analizar la variación de ventas frente al año previo.

Al finalizar, el alumno debe poder:

- construir una tabla KPI por año
- construir una tabla KPI por familia y producto
- mostrar ventas actuales y ventas del año previo
- calcular variación absoluta y porcentual
- aplicar iconos de subida o bajada
- interpretar crecimiento o caída por dimensión de negocio

## 3. Relación con prácticas previas

Esta práctica continúa desde:

- [SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md](SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md)
- [SESION_U2_S5_P2_DASHBOARD_KPIS_VISUALIZACION_BI.md](SESION_U2_S5_P2_DASHBOARD_KPIS_VISUALIZACION_BI.md)

La P1 dejó las medidas de año previo. La P2 dejó el odómetro, las medidas de mes anterior y los gráficos diarios. En esta P3 se trabaja solo la lectura tabular de variación.

## 4. Preparar la página

Crea una página nueva.

Nombre sugerido:

```text
S5 P3 - Tabla KPI
```

Distribución sugerida:

```text
Izquierda  -> segmentador de año
Arriba     -> tabla KPI por año
Abajo      -> matriz KPI por familia y producto
```

## 5. Segmentador de año

Agrega un segmentador:

| Campo | Uso |
|---|---|
| `dim_fecha[año]` | seleccionar un solo año |

Regla:

```text
Trabaja con un solo año seleccionado para que la variación sea clara.
```

## 6. Medida: variación porcentual

Si todavía no existe, crea la medida de variación porcentual frente al año previo.

```DAX
% Variacion Ventas vs Anio Previo =
DIVIDE(
    [Variacion Ventas vs Anio Previo],
    [Ventas Anio Previo Mismo Periodo]
)
```

Formato:

```text
Porcentaje con 2 decimales
```

Esta medida es equivalente a la fórmula del taller:

```DAX
([Ventas] - [Ventas año previo mismo periodo]) / [Ventas año previo mismo periodo]
```

En nuestro modelo la dejamos separada para reutilizar también la variación absoluta.

## 7. Medida: indicador KPI de variación

Crea una medida para mostrar una flecha de subida o bajada.

```DAX
KPI Var Ventas =
IF(
    [% Variacion Ventas vs Anio Previo] >= 0,
    UNICHAR(9650),
    UNICHAR(9660)
)
```

Lectura:

```text
UNICHAR(9650) -> triángulo arriba
UNICHAR(9660) -> triángulo abajo
```

## 8. Medida: color del KPI

Crea una medida para pintar la flecha.

```DAX
KPI Var Ventas Color =
IF(
    [% Variacion Ventas vs Anio Previo] >= 0,
    "Green",
    "Red"
)
```

Esta medida no se muestra como columna principal. Se usa como valor de campo en formato condicional.

## 9. Tabla KPI por año

Crea una tabla o matriz.

Campos:

| Campo | Ubicación |
|---|---|
| `dim_fecha[año]` | Filas |
| `[Ventas Netas]` | Valores |
| `[Ventas Anio Previo Mismo Periodo]` | Valores |
| `[Variacion Ventas vs Anio Previo]` | Valores |
| `[% Variacion Ventas vs Anio Previo]` | Valores |
| `[KPI Var Ventas]` | Valores |

Formato recomendado:

- `[Ventas Netas]`: moneda
- `[Ventas Anio Previo Mismo Periodo]`: moneda
- `[Variacion Ventas vs Anio Previo]`: moneda
- `[% Variacion Ventas vs Anio Previo]`: porcentaje con 2 decimales
- `[KPI Var Ventas]`: texto centrado

## 10. Formato condicional de la flecha

En el campo `[KPI Var Ventas]`, aplica color de fuente.

Ruta sugerida:

```text
Visual -> Valores -> KPI Var Ventas -> Formato condicional -> Color de fuente
```

Configuración:

```text
Estilo de formato: Valor de campo
Aplicar a: Valores y totales
En qué campo debemos basar esto?: [KPI Var Ventas Color]
```

En esta práctica se usa `Valores y totales`, no `Solo valores`, porque la matriz tiene grupos y detalles.

```text
Solo valores       -> colorea principalmente filas de detalle
Valores y totales  -> colorea detalle, grupos y totales
```

Así la flecha de la familia y la flecha del producto toman color al mismo tiempo.

Resultado:

```text
▲ verde -> crecimiento o empate
▼ rojo  -> caída
```

Importante:

```text
[KPI Var Ventas Color] se usa solo para pintar la flecha.
No debe quedar como columna visible en la tabla final.
```

Después de aplicar el color condicional, quita `[KPI Var Ventas Color]` del visual si lo agregaste temporalmente para validarlo.

## 11. Matriz KPI por familia y producto

Crea otra matriz para analizar familias y productos.

Campos:

| Campo | Ubicación |
|---|---|
| `dim_producto[nombre_familia]` | Filas |
| `dim_producto[nombre_producto]` | Filas debajo de familia |
| `[Ventas Netas]` | Valores |
| `[Ventas Anio Previo Mismo Periodo]` | Valores |
| `[Variacion Ventas vs Anio Previo]` | Valores |
| `[% Variacion Ventas vs Anio Previo]` | Valores |
| `[KPI Var Ventas]` | Valores |

Orden sugerido:

```text
Ordenar por [Ventas Netas] descendente
```

## 12. Formato condicional del porcentaje

Aplica color de fuente o color de fondo sobre `[% Variacion Ventas vs Anio Previo]`.

Reglas sugeridas:

```text
Mayor que 0 -> verde
Menor que 0 -> rojo
Igual a 0   -> gris
```

El objetivo es que el usuario pueda leer tanto el número exacto como la señal visual.

## 13. Editar interacciones

Configura las interacciones para que las tablas funcionen como análisis y no rompan los KPI construidos en P1 y P2.

Ruta:

```text
Seleccionar visual -> Formato -> Editar interacciones
```

Decisiones recomendadas:

| Visual seleccionado | Interacción recomendada | Motivo |
|---|---|---|
| Segmentador `dim_fecha[año]` | Filtrar tablas KPI | define el año de análisis |
| Tabla KPI por año | Sin interacción sobre la matriz por familia | evita una doble lectura accidental |
| Matriz KPI por familia | Sin interacción sobre la tabla por año | mantiene la tabla anual como resumen |

Regla:

```text
El segmentador controla la página.
Las tablas se usan para analizar, no para re-filtrar el resto de visuales por accidente.
```

## 14. Preguntas de análisis

Responde con base en las tablas:

- ¿qué año tiene mayor venta?
- ¿qué año creció más frente al año previo?
- ¿qué familia tiene mayor venta actual?
- ¿qué familia creció más?
- ¿qué familia cayó más?
- ¿la familia con mayor venta también es la que más crece?
- ¿qué acción comercial sugerirías para una familia o producto en rojo?

## 15. Validación SQL

Ejemplo para comparar 2026 contra 2025 por familia y producto:

```sql
SELECT
    dp.nombre_familia,
    dp.nombre_producto,
    SUM(CASE WHEN df.anio = 2026 THEN fv.venta_neta ELSE 0 END) AS ventas_actuales,
    SUM(CASE WHEN df.anio = 2025 THEN fv.venta_neta ELSE 0 END) AS ventas_anio_previo,
    SUM(CASE WHEN df.anio = 2026 THEN fv.venta_neta ELSE 0 END)
        - SUM(CASE WHEN df.anio = 2025 THEN fv.venta_neta ELSE 0 END) AS variacion_ventas
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
JOIN marts.dim_producto dp
    ON fv.producto_key = dp.producto_key
GROUP BY
    dp.nombre_familia,
    dp.nombre_producto
ORDER BY
    ventas_actuales DESC;
```

Si en Power BI estás comparando un año parcial, replica el mismo rango de meses en SQL.

## 16. Actividad final: carpetas de medidas

Ubica las nuevas medidas en carpeta:

```text
02 Tiempo - Año previo
- KPI Var Ventas
- KPI Var Ventas Color
```

Ruta:

```text
Vista Modelo -> seleccionar medida -> Propiedades -> Carpeta para mostrar
```

## 17. Resultado esperado

El informe debe permitir:

- analizar variación por año
- analizar variación por familia y producto
- comunicar crecimiento o caída con iconos
- identificar familias y productos prioritarios
- interpretar desempeño frente al año previo

## 18. Checklist

- existe medida `[KPI Var Ventas]`
- existe medida `[KPI Var Ventas Color]`
- existe tabla KPI por año
- existe matriz KPI por familia y producto
- las flechas muestran mejora o caída
- la flecha tiene color condicional
- el porcentaje de variación tiene formato condicional
- las interacciones fueron configuradas
- las medidas quedaron en carpetas
- el resultado fue validado contra SQL

## 19. Evidencias a entregar

- captura de la tabla KPI por año
- captura de la matriz KPI por familia y producto
- captura de la columna `[KPI Var Ventas]`
- captura del color condicional basado en `[KPI Var Ventas Color]`
- captura de formato condicional del porcentaje
- captura de edición de interacciones
- captura de carpetas de medidas
- captura de validación SQL

Nombre sugerido:

```text
FarmaciaPBI_U2_S5_P3_Tabla_KPI_Variacion.pbix
```

## 20. Interpretación final

La tabla KPI permite pasar de una lectura general a una lectura accionable.

Primero se revisa el año seleccionado frente al año previo. Luego se baja al detalle por familia y producto para identificar qué elementos explican la variación.

Lectura esperada:

```text
Flecha verde -> la venta crece o se mantiene frente al año previo
Flecha roja  -> la venta cae frente al año previo
```

Si el total del año cae, pero algunos productos aparecen en verde, esos productos están ayudando a sostener el resultado. Si una familia aparece en rojo, pero dentro de ella hay productos en verde, la acción comercial no debe aplicarse a toda la familia por igual: conviene revisar producto por producto.

Preguntas de interpretación:

- qué familias explican la caída total?
- qué productos crecen a pesar de que su familia cae?
- qué productos de alto volumen están en rojo?
- qué productos de bajo volumen están creciendo y podrían impulsarse?
- la caída viene por una familia específica o por varias familias al mismo tiempo?

Conclusión ejecutiva:

```text
La tabla KPI no solo muestra si se vendió más o menos.
Ayuda a decidir dónde actuar primero.
```

## 21. Cierre del curso BI

Con esta práctica se completa el flujo de inteligencia de negocio construido durante el curso:

```text
modelo de datos -> medidas DAX -> inteligencia de tiempo -> KPIs -> interpretación de negocio
```

El reporte final ya no solo muestra ventas. Ahora permite comparar periodos, identificar crecimiento o disminución, revisar el comportamiento por año, mes, día, familia y producto, y convertir los resultados en señales de decisión.

El cierre esperado para el alumno es:

```text
Un buen reporte BI no termina en el visual.
Termina cuando el usuario puede tomar una decisión con confianza.
```

## 22. Cierre

Con esta práctica, la sesión 05 completa la lectura tabular de variación: qué años, familias y productos crecen o caen frente al año previo.
