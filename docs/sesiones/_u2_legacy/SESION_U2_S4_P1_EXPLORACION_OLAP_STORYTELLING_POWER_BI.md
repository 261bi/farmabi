# Sesión U2 S4 P1: Exploración OLAP, progresión y storytelling BI

## 1. Título

Exploración de ventas netas por tiempo y producto para identificar hallazgos y construir una narrativa BI.

## 2. Objetivo

Usar jerarquías, filtros e interacciones de Power BI para explorar ventas netas, analizar su progresión temporal y redactar hallazgos de negocio.

Al finalizar la práctica, el alumno debe poder:

- navegar la jerarquía `Calendario`
- navegar la jerarquía `Producto Comercial`
- analizar ventas netas por año, mes, día, familia, categoría y producto
- usar interacciones visuales y filtrado cruzado
- usar drill-down, drill-up y drill-through
- usar tooltips para ampliar contexto
- identificar picos, caídas y concentraciones de venta
- validar un hallazgo contra SQL
- redactar una mini narrativa BI

## 3. Relación con prácticas previas

Esta práctica continúa desde:

- [SESION_U2_S3_P1_MODELO_SEMANTICO_POWER_BI.md](SESION_U2_S3_P1_MODELO_SEMANTICO_POWER_BI.md)
- [SESION_U2_S3_P2_MEDIDAS_DAX_Y_AGREGACIONES.md](SESION_U2_S3_P2_MEDIDAS_DAX_Y_AGREGACIONES.md)

Antes de iniciar, verifica:

- relaciones activas entre dimensiones y `fact_ventas`
- jerarquía `Calendario`
- jerarquía `Producto Comercial`
- medida `[Ventas Netas]`
- medida `[Pedidos]`
- medida `[Unidades Vendidas]`
- medida `[Ticket Promedio]`

Medidas opcionales:

- `[Margen Bruto]`
- `[% Margen Bruto]`

## 4. Idea central

La secuencia de la sesión es:

```text
ventas netas -> exploración -> detalle -> hallazgo -> historia
```

La S4 no busca construir el dashboard final. Busca entender qué está pasando.

Usaremos tres formas de exploración:

- `filtrado cruzado`: seleccionar un dato y actualizar los visuales de la misma página
- `drill-down / drill-up`: bajar o subir dentro de una jerarquía
- `drill-through / Obtener detalles`: ir desde un dato seleccionado hacia una página de detalle

## 5. Página de trabajo

Crea una página llamada:

```text
Exploración OLAP
```

Debe contener:

- matriz OLAP por producto
- gráfico de progresión mensual y acumulada
- gráfico comparativo por mes y año
- radar por día de semana
- análisis diario opcional para investigar picos
- tabla o matriz de clientes para análisis de detalle
- segmentadores de exploración
- tooltip contextual
- espacio de texto para hallazgos

Preparación para interacciones:

- la matriz OLAP por producto será el visual de origen para `Detalle Producto`
- la tabla o matriz de clientes será el visual de origen para `Detalle Cliente`
- los gráficos temporales y el radar responderán al filtrado cruzado cuando selecciones un producto, cliente, año o mes

Tabla o matriz de clientes:

- filas: `dim_cliente[nombre_cliente]`
- valores: `[Ventas Netas]`, `[Pedidos]`, `[Ticket Promedio]`
- orden: `[Ventas Netas]` de mayor a menor

## 6. Matriz OLAP por producto

Crea una matriz.

Filas:

- `dim_producto[nombre_familia]`
- `dim_producto[nombre_categoria]`
- `dim_producto[nombre_producto]`

Valores:

- `[Ventas Netas]`
- `[Pedidos]`
- `[Unidades Vendidas]`
- `[Ticket Promedio]`

Interpretación importante:

```text
La columna [Pedidos] no se suma verticalmente como [Ventas Netas] o [Unidades Vendidas].
```

Un mismo pedido puede contener productos de más de una familia o categoría. Por eso:

- el subtotal de una familia cuenta los pedidos distintos que incluyen productos de esa familia
- el subtotal de otra familia puede contar algunos de esos mismos pedidos
- el total general cuenta pedidos distintos una sola vez

Entonces, si los pedidos por familia suman más que el total general, no es un error. Significa que algunos pedidos compraron productos de varias familias.

Opcional:

- `[Margen Bruto]`
- `[% Margen Bruto]`

Acciones:

1. Expande de familia a categoría.
2. Expande de categoría a producto.
3. Ordena por `[Ventas Netas]`.
4. Identifica la familia con mayor venta.
5. Identifica una categoría que concentre ventas.

Preguntas:

- ¿qué familia vende más?
- ¿qué categoría explica la venta?
- ¿hay productos que concentran el resultado?
- ¿la mayor venta viene de muchos pedidos o de pocos pedidos grandes?

Esta matriz también será el visual de origen para el drill-through de producto. Más adelante, al usar `Detalle Producto`, harás clic derecho sobre un producto de esta matriz.

## 7. Progresión mensual y acumulada

Crea un gráfico de líneas.

Eje:

- `dim_fecha[mes_desc]`

Valores:

- `[Ventas Netas]`
- `[Ventas Netas Acumuladas]`

Segmentador:

- `dim_fecha[año]`

Selecciona un solo año para iniciar la lectura.

Recuerda que `mes_desc` debe estar ordenado por `mes_numero`.

Prueba:

1. Selecciona `2024`.
2. Observa la venta mensual y la línea acumulada.
3. Selecciona `2025`.
4. Compara si el acumulado crece de forma parecida o diferente.
5. Selecciona `2026`.
6. Observa que el acumulado se detiene en mayo porque el año está incompleto.

Pregunta:

```text
¿El avance acumulado del año actual puede compararse contra un año completo?
```

Respuesta esperada:

```text
No directamente. 2026 solo tiene datos hasta mayo; debe compararse contra el mismo periodo de años anteriores o indicarse que es un año parcial.
```

## 8. Ventas por mes y año

Crea un gráfico de líneas.

Eje:

- `dim_fecha[mes_desc]`

Leyenda:

- `dim_fecha[año]`

Valores:

- `[Ventas Netas]`

Recuerda que `mes_desc` debe estar ordenado por `mes_numero`.

Uso:

- comparar meses equivalentes entre años
- detectar meses fuertes o débiles
- mostrar visualmente que 2026 es un periodo parcial

Preguntas:

- ¿qué meses muestran mayor venta?
- ¿qué año tiene mejor comportamiento?
- ¿hay meses comparables con diferencias visibles?
- ¿2026 debe leerse como año completo o como periodo parcial?

Interpretación esperada:

```text
2026 no debe compararse contra todo 2024 o todo 2025 como año completo. Solo tiene datos hasta mayo, por eso su línea termina antes.
```

## 9. Radar por día de semana

Crea un gráfico de radar.

Categoría o eje:

- `dim_fecha[dia_semana_desc]`

Valores:

- `[Pedidos]`

Pregunta principal:

```text
¿Qué patrón semanal muestran los pedidos?
```

Preguntas de lectura:

- ¿qué día concentra más pedidos?
- ¿qué día concentra menos pedidos?
- ¿conviene reforzar stock o atención en ciertos días?

Nota:

- el orden de `dim_fecha[dia_semana_desc]` ya debe estar configurado en el modelo semántico
- si el orden aparece alfabético, vuelve a la S3 P1 y revisa la sección `8. Orden semántico de fechas`
- el radar se usa para ver la forma del patrón semanal, no para leer importes exactos

## 10. Detalle diario para investigar picos

Esta actividad es opcional. Úsala solo si en los gráficos mensuales aparece un pico o caída que necesita explicación.

Crea un gráfico de columnas.

Eje:

- `dim_fecha[dia]`

Valores:

- `[Ventas Netas]`

Segmentadores obligatorios:

- `dim_fecha[año]`
- `dim_fecha[mes_desc]`

Uso:

- selecciona primero un año
- selecciona luego un mes
- sirve para detectar picos puntuales dentro de un periodo filtrado

Pregunta:

```text
¿El pico observado corresponde a un comportamiento recurrente o a un día puntual?
```

Nota:

```text
La lectura por fecha exacta puede generar ruido si se muestran muchos años o meses a la vez. Primero analiza mes y acumulado; luego baja al día solo si necesitas explicar un pico.
```

## 11. Drill-through de producto

El drill-through necesita dos partes:

```text
visual de origen -> página de detalle
```

El visual de origen ya quedó preparado en la sección `6. Matriz OLAP por producto`.

Luego crea una página nueva:

```text
Detalle Producto
```

Campo de drill-through:

- `dim_producto[nombre_producto]`

Pasos:

1. Quédate en la página `Detalle Producto`.
2. En el panel `Datos`, abre la tabla `dim_producto`.
3. Ubica el campo `nombre_producto`.
4. Arrastra `nombre_producto` hacia el panel `Visualizaciones`.
5. Suelta el campo en la sección `Obtener detalles`.
6. Verifica que aparezca `nombre_producto` dentro de `Obtener detalles`.
7. Deja activada la opción `Mantener todos los filtros`.
8. En `Permitir obtención de detalles cuando`, deja la opción `Se utiliza como categoría`.

Agrega tres tarjetas:

1. Selecciona el visual `Tarjeta`.
2. Arrastra la medida `[Ventas Netas]` a la tarjeta.
3. Repite el proceso para crear una tarjeta con `[Pedidos]`.
4. Repite el proceso para crear una tarjeta con `[Unidades Vendidas]`.

Agrega un gráfico de ventas por fecha:

1. Selecciona `Gráfico de líneas` o `Gráfico de columnas`.
2. En el eje X, coloca `dim_fecha[fecha]`.
3. En valores, coloca `[Ventas Netas]`.
4. Ordena el eje por fecha ascendente si fuera necesario.

Agrega una tabla por cliente:

1. Selecciona el visual `Tabla` o `Matriz`.
2. En filas o columnas del visual, coloca `dim_cliente[nombre_cliente]`.
3. En valores, coloca `[Ventas Netas]`, `[Pedidos]` y `[Unidades Vendidas]`.
4. Ordena por `[Ventas Netas]` de mayor a menor.

Botón `Volver`:

En versiones recientes de Power BI, al agregar un campo en `Obtener detalles`, Power BI crea automáticamente el botón de regreso en la página.

Si el botón aparece automáticamente:

- déjalo en la parte superior izquierda
- prueba el retorno con `Ctrl + clic` en Power BI Desktop

Solo si el botón no aparece, agrégalo manualmente:

1. Ve a `Insertar`.
2. Selecciona `Botones`.
3. Elige `Atrás`.
4. Coloca el botón en la parte superior izquierda de la página.
5. Si el botón no regresa, selecciónalo y configura:

```text
Acción: Activado
Tipo: Atrás
```

Prueba:

1. Regresa a la página `Exploración OLAP`.
2. En la matriz OLAP por producto, expande hasta el nivel `nombre_producto`.
3. Haz clic derecho sobre un producto.
4. Selecciona `Obtener detalles`.
5. Elige `Detalle Producto`.
6. Verifica que la página muestre solo el producto seleccionado.

Pregunta:

```text
¿El producto depende de pocos clientes o tiene venta distribuida?
```

## 12. Drill-through de cliente

El visual de origen ya quedó preparado en la sección `5. Página de trabajo`, con la tabla o matriz de clientes.

Luego crea una página nueva:

```text
Detalle Cliente
```

Campo de drill-through:

- `dim_cliente[nombre_cliente]`

Pasos:

1. Quédate en la página `Detalle Cliente`.
2. En el panel `Datos`, abre la tabla `dim_cliente`.
3. Ubica el campo `nombre_cliente`.
4. Arrastra `nombre_cliente` hacia el panel `Visualizaciones`.
5. Suelta el campo en la sección `Obtener detalles`.
6. Verifica que aparezca `nombre_cliente` dentro de `Obtener detalles`.
7. Deja activada la opción `Mantener todos los filtros`.
8. En `Permitir obtención de detalles cuando`, deja la opción `Se utiliza como categoría`.

Agrega tres tarjetas:

1. Selecciona el visual `Tarjeta`.
2. Arrastra la medida `[Ventas Netas]` a la tarjeta.
3. Repite el proceso para crear una tarjeta con `[Pedidos]`.
4. Repite el proceso para crear una tarjeta con `[Ticket Promedio]`.

Agrega una matriz por producto:

1. Selecciona el visual `Matriz`.
2. En filas, coloca la jerarquía `Producto Comercial`.
3. En valores, coloca `[Ventas Netas]`, `[Pedidos]` y `[Unidades Vendidas]`.
4. Expande la jerarquía para revisar familia, categoría y producto.

Agrega un gráfico de ventas por fecha:

1. Selecciona `Gráfico de líneas` o `Gráfico de columnas`.
2. En el eje X, coloca `dim_fecha[fecha]`.
3. En valores, coloca `[Ventas Netas]`.
4. Ordena el eje por fecha ascendente si fuera necesario.

Botón `Volver`:

En versiones recientes de Power BI, al agregar un campo en `Obtener detalles`, Power BI crea automáticamente el botón de regreso en la página.

Si el botón aparece automáticamente:

- déjalo en la parte superior izquierda
- prueba el retorno con `Ctrl + clic` en Power BI Desktop

Solo si el botón no aparece, agrégalo manualmente:

1. Ve a `Insertar`.
2. Selecciona `Botones`.
3. Elige `Atrás`.
4. Coloca el botón en la parte superior izquierda de la página.
5. Si el botón no regresa, selecciónalo y configura:

```text
Acción: Activado
Tipo: Atrás
```

Prueba:

1. Regresa a la página `Exploración OLAP`.
2. Desde una tabla, matriz o visual con clientes, haz clic derecho sobre un cliente.
3. Selecciona `Obtener detalles`.
4. Elige `Detalle Cliente`.
5. Verifica que la página muestre solo el cliente seleccionado.

Pregunta:

```text
¿El cliente compra de forma recurrente, concentrada o esporádica?
```

## 13. Tooltip contextual

Crea una página tooltip:

```text
TT Ventas
```

Configura la página:

1. Selecciona un espacio vacío de la página.
2. Ve al panel `Formato`.
3. En `Información de página`, activa `Permitir usar como información sobre herramientas`.
4. En `Configuración del lienzo`, cambia el tipo de página a `Información sobre herramientas` o `Tooltip`.

Incluye tarjetas pequeñas:

- `[Ventas Netas]`
- `[Pedidos]`
- `[Unidades Vendidas]`
- `[Ticket Promedio]`

Asigna el tooltip a:

- matriz OLAP
- gráfico de progresión mensual
- gráfico comparativo por mes y año
- radar por día de semana

Para asignarlo a un visual:

1. Selecciona el visual.
2. Abre el panel `Formato`.
3. Busca `Información sobre herramientas`.
4. Cambia el tipo a `Página de informe`.
5. Selecciona la página `TT Ventas`.

Prueba:

```text
Pasa el mouse sobre una marca del visual y verifica que aparezca el tooltip con las métricas.
```

## 14. Segmentadores de exploración

Agrega segmentadores:

- `dim_fecha[año]`
- `dim_fecha[mes_desc]`
- `dim_producto[nombre_familia]`
- `dim_estado_pedido[estado_pedido]`

Regla:

- usa campos de negocio
- no uses claves técnicas

## 15. De hallazgo a historia

Un hallazgo debe tener evidencia.

Ejemplo débil:

```text
La categoría X vende más.
```

Ejemplo BI:

```text
La categoría X concentra la mayor venta neta del periodo seleccionado. Al revisar la progresión mensual, la venta se concentra en los meses de mayor actividad, por lo que conviene monitorear disponibilidad y reposición en esos periodos.
```

Ejemplo con la página construida:

```text
El comportamiento de ventas muestra que 2026 debe leerse como un periodo parcial, no como un año completo. En el gráfico mensual, la línea de 2026 solo llega hasta mayo, mientras que 2024 y 2025 tienen datos hasta diciembre. Por ello, cualquier comparación anual debe hacerse contra el mismo periodo de años anteriores o indicar explícitamente que el año actual está incompleto.
```

Otro ejemplo:

```text
El radar semanal muestra que los pedidos se distribuyen durante toda la semana, con mayor intensidad relativa en algunos días. Esta lectura ayuda a identificar días donde podría reforzarse atención, stock o seguimiento comercial, pero debe complementarse con ventas netas antes de tomar una decisión operativa.
```

Estructura:

```text
Contexto -> Evidencia -> Interpretación -> Acción sugerida
```

## 16. Plantilla de narrativa

Completa tres narrativas:

```text
Hallazgo:
Contexto:
Evidencia:
Interpretación:
Acción sugerida:
Visual usado:
Validación SQL:
```

Temas sugeridos:

- familia o categoría
- progresión mensual
- día de semana
- producto
- cliente

Ejemplo completo:

```text
Hallazgo:
El avance de ventas de 2026 muestra un desempeño parcial que requiere comparación contra el mismo tramo enero-mayo de años anteriores.

Contexto:
Se analiza la página Exploración OLAP con ventas netas por mes y año.

Evidencia:
La línea de 2026 aparece solo hasta mayo, mientras que 2024 y 2025 tienen datos hasta diciembre.

Interpretación:
Si se compara 2026 contra años completos, el análisis puede sugerir una caída artificial. La lectura correcta es evaluar el avance acumulado de enero a mayo y revisar si el ritmo mensual está por encima o por debajo del mismo periodo de 2024 y 2025.

Acción sugerida:
Crear una comparación parcial enero-mayo por año y usarla como base para estimar si 2026 mantiene, mejora o reduce el ritmo de ventas antes de proyectar metas o alertas.

Visual usado:
Ventas por mes y año; Ventas Netas Acumuladas por mes.

Validación SQL:
Consulta de ventas por mes y año en marts.fact_ventas y marts.dim_fecha.
```

Ejemplo adicional:

```text
Hallazgo:
La venta por categoría muestra diferencias importantes en unidades vendidas.

Contexto:
Se revisa la tabla de unidades vendidas por categoría en la página Exploración OLAP.

Evidencia:
Las categorías como Tableta y Polvo para Solución Inyectable concentran más unidades vendidas que otras categorías.

Interpretación:
La concentración de unidades puede indicar mayor rotación y necesidad de seguimiento de inventario.

Acción sugerida:
Revisar disponibilidad de productos en las categorías con mayor rotación y contrastar con ventas netas para priorizar reposición.

Visual usado:
Tabla de unidades vendidas por categoría.

Validación SQL:
Consulta agrupada por dim_producto[nombre_categoria] usando SUM(fact_ventas[cantidad_vendida]).
```

## 17. Validación SQL

### 17.1 Ventas por familia

```sql
SELECT
    dp.nombre_familia,
    SUM(fv.venta_neta) AS ventas_netas
FROM marts.fact_ventas fv
JOIN marts.dim_producto dp
    ON fv.producto_key = dp.producto_key
GROUP BY dp.nombre_familia
ORDER BY ventas_netas DESC;
```

### 17.2 Ventas por mes y año

```sql
SELECT
    df.anio,
    df.mes_numero,
    df.mes_desc,
    SUM(fv.venta_neta) AS ventas_netas
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
GROUP BY
    df.anio,
    df.mes_numero,
    df.mes_desc
ORDER BY
    df.anio,
    df.mes_numero;
```

### 17.3 Ventas por día de semana

```sql
SELECT
    df.dia_semana_numero,
    df.dia_semana_desc,
    SUM(fv.venta_neta) AS ventas_netas
FROM marts.fact_ventas fv
JOIN marts.dim_fecha df
    ON fv.fecha_key = df.fecha_key
GROUP BY
    df.dia_semana_numero,
    df.dia_semana_desc
ORDER BY df.dia_semana_numero;
```

## 18. Checklist

- existe página `Exploración OLAP`
- se usa `[Ventas Netas]` como medida principal
- la matriz permite navegar familia, categoría y producto
- existe tabla o matriz de clientes para análisis de detalle
- existe visual de progresión mensual y acumulada
- existe visual de ventas por mes y año
- si se usa análisis diario, está filtrado por año y mes
- el radar por día de semana respeta el orden configurado en el modelo semántico
- existe drill-through de producto
- existe drill-through de cliente
- existe tooltip contextual
- se redactaron tres hallazgos
- al menos un hallazgo fue validado contra SQL

## 19. Evidencias a entregar

- captura de matriz OLAP
- captura de tabla o matriz de clientes
- captura de progresión mensual y acumulada
- captura de ventas por mes y año
- captura opcional de ventas por día del mes
- captura del radar por día de semana
- captura de drill-through de producto
- captura de drill-through de cliente
- tres hallazgos redactados
- validación SQL

Nombre sugerido:

```text
FarmaciaPBI_U2_S4_OLAP_Progresion_Storytelling.pbix
```

## 20. Cierre

Con esta práctica, el alumno aprende a explorar ventas netas, leer su progresión y convertir observaciones en hallazgos. La siguiente sesión convierte esos hallazgos en una página ejecutiva con KPIs.

