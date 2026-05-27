# Práctica BI — Comparativos de ventas con inteligencia de tiempo

## Contexto del nuevo modelo

Esta práctica adapta los pasos 24 y 25 del laboratorio original de Power BI a un modelo de **ventas/pedidos** basado en la base de datos `farmadb`.

Modelo sugerido:

| Tipo | Tabla | Uso |
|---|---|---|
| Dimensión | `DTIEMPO` | Análisis por año, mes y día |
| Dimensión | `productos` | Análisis por producto |
| Dimensión | `categorias` | Análisis por categoría |
| Dimensión | `familias` | Agrupación superior de productos |
| Dimensión | `clientes` | Análisis por cliente |
| Dimensión | `vendedores` | Análisis por vendedor |
| Hecho | `pedido_detalles` | Cantidades, precios, descuentos, IGV |
| Hecho / Cabecera | `pedidos` | Fechas, estado, cliente, vendedor |

> Para análisis de ventas se recomienda usar como fecha principal `pedidos[fecha_confirmacion]`.  
> Si el pedido aún no tiene confirmación, se puede usar `pedidos[fecha_creacion]`, según el criterio del negocio.

---

## Relaciones sugeridas

```text
DTIEMPO[Date]              1 ─── * pedidos[fecha_confirmacion]
clientes[id]               1 ─── * pedidos[cliente_id]
vendedores[id]             1 ─── * pedidos[vendedor_id]
pedidos[id]                1 ─── * pedido_detalles[pedido_id]
productos[id]              1 ─── * pedido_detalles[producto_id]
categorias[id]             1 ─── * productos[categoria_id]
familias[id]               1 ─── * categorias[familia_id]
```

---

# Medidas base

## Cantidad vendida

```DAX
Cantidad Vendida =
SUM(pedido_detalles[cantidad])
```

## Ventas

```DAX
Ventas =
SUMX(
    pedido_detalles,
    pedido_detalles[cantidad] * pedido_detalles[precio_venta_unitario]
)
```

## Costo de venta

```DAX
Costo de Venta =
SUMX(
    pedido_detalles,
    pedido_detalles[cantidad] * pedido_detalles[precio_compra_unitario]
)
```

## Descuento total

```DAX
Descuento Total =
SUMX(
    pedido_detalles,
    pedido_detalles[cantidad] * pedido_detalles[total_descuento_unitario]
)
```

## IGV total

```DAX
IGV Total =
SUMX(
    pedido_detalles,
    pedido_detalles[cantidad] * pedido_detalles[igv_unitario]
)
```

## Utilidad bruta

```DAX
Utilidad Bruta =
[Ventas] - [Costo de Venta]
```

---

# Paso 24. Comparar ventas actuales vs ventas del año pasado

## Objetivo

Realizar un comparativo entre las ventas actuales y las ventas del año pasado para el mismo periodo, analizando la información por:

- año
- mes
- día

Este análisis permite identificar si las ventas han crecido, disminuido o se mantienen respecto al mismo periodo del año anterior.

---

## Medida: ventas del año previo para el mismo periodo

```DAX
Ventas Año Previo Mismo Periodo =
CALCULATE(
    [Ventas],
    DATEADD(DTIEMPO[Date], -1, YEAR)
)
```

---

## Medida: variación absoluta vs año previo

```DAX
Variación Ventas vs Año Previo =
[Ventas] - [Ventas Año Previo Mismo Periodo]
```

---

## Medida: variación porcentual vs año previo

```DAX
% Variación Ventas vs Año Previo =
DIVIDE(
    [Variación Ventas vs Año Previo],
    [Ventas Año Previo Mismo Periodo]
)
```

---

## Medida: título dinámico para comparación anual

```DAX
Título Ventas Actual vs Año Previo =
VAR __ultf =
    LASTNONBLANK(DTIEMPO[Date], [Ventas])
VAR __anioact =
    FORMAT(__ultf, "yyyy")
VAR __anioprev =
    FORMAT(DATE(YEAR(__ultf) - 1, 1, 1), "yyyy")
RETURN
    __anioact & " VS " & __anioprev
```

---

## Visual recomendado: comparación por meses

Crear un gráfico de líneas o columnas con:

| Campo | Ubicación |
|---|---|
| `DTIEMPO[Año]` | Filtro o segmentador |
| `DTIEMPO[Mes]` | Eje X |
| `[Ventas]` | Valores |
| `[Ventas Año Previo Mismo Periodo]` | Valores |
| `[Título Ventas Actual vs Año Previo]` | Título dinámico |

---

## Visual recomendado: KPI anual

Crear un visual KPI con:

| Campo | Ubicación |
|---|---|
| `[Ventas]` | Indicador |
| `DTIEMPO[Mes]` | Eje de tendencia |
| `[Ventas Año Previo Mismo Periodo]` | Objetivo |

---

## Comparación por días

Para analizar por días, se recomienda crear otro gráfico independiente.

### Medida: título dinámico por día

```DAX
Título Ventas Actual vs Año Previo x Días =
VAR __ultf =
    LASTNONBLANK(DTIEMPO[Date], [Ventas])
VAR __anioact =
    FORMAT(__ultf, "dd-mmmm-yyyy")
VAR __anioprev =
    FORMAT(
        DATE(YEAR(__ultf) - 1, MONTH(__ultf), DAY(__ultf)),
        "dd-mmmm-yyyy"
    )
RETURN
    __anioact & " VS " & __anioprev
```

---

## Visual recomendado: comparación por días

Crear un gráfico de líneas con:

| Campo | Ubicación |
|---|---|
| `DTIEMPO[Mes]` | Filtro |
| `DTIEMPO[Día]` o `DTIEMPO[Date]` | Eje X |
| `[Ventas]` | Valores |
| `[Ventas Año Previo Mismo Periodo]` | Valores |
| `[Título Ventas Actual vs Año Previo x Días]` | Título dinámico |

---

## Preguntas de análisis

- ¿Las ventas actuales superan a las del año anterior?
- ¿En qué meses hubo mayor crecimiento?
- ¿En qué meses disminuyeron las ventas?
- ¿Qué productos explican la diferencia?
- ¿Qué clientes o vendedores aportaron más al crecimiento?
- ¿Qué categorías crecieron más respecto al año anterior?

---

# Paso 25. Comparar ventas del mes actual vs mes anterior

## Objetivo

Realizar un comparativo entre las ventas del mes actual y las ventas del mes anterior para evaluar el comportamiento reciente de las ventas.

Este análisis permite identificar si existe crecimiento o disminución en el corto plazo.

---

## Medida: venta del mes anterior

```DAX
Venta Mes Anterior =
VAR __actf =
    TODAY()
VAR __ultf =
    LASTNONBLANK(DTIEMPO[Date], [Ventas])
VAR __mesactual =
    FILTER(
        DATESMTD(DTIEMPO[Date]),
        DTIEMPO[Date] <= __ultf
    )
RETURN
    CALCULATE(
        CALCULATE(
            [Ventas],
            DATEADD(__mesactual, -1, MONTH)
        ),
        FILTER(
            DTIEMPO,
            DTIEMPO[Date] <= __ultf
        )
    )
```

---

## Medida: variación absoluta vs mes anterior

```DAX
Variación Ventas vs Mes Anterior =
[Ventas] - [Venta Mes Anterior]
```

---

## Medida: variación porcentual vs mes anterior

```DAX
% Variación Ventas vs Mes Anterior =
DIVIDE(
    [Variación Ventas vs Mes Anterior],
    [Venta Mes Anterior]
)
```

---

## Medida: título dinámico para comparación mensual

```DAX
Título Ventas Mes Actual vs Mes Anterior =
VAR __ultf =
    LASTNONBLANK(DTIEMPO[Date], [Ventas])
VAR __mesact =
    FORMAT(__ultf, "mmmm yyyy")
VAR __mesprev =
    FORMAT(EDATE(__ultf, -1), "mmmm yyyy")
RETURN
    __mesact & " VS " & __mesprev
```

---

## Visual recomendado: KPI mensual

Crear un visual KPI con:

| Campo | Ubicación |
|---|---|
| `[Ventas]` | Indicador |
| `DTIEMPO[Día]` o `DTIEMPO[Date]` | Eje de tendencia |
| `[Venta Mes Anterior]` | Objetivo |
| `[Título Ventas Mes Actual vs Mes Anterior]` | Título dinámico |

---

## Visual recomendado: tarjetas

Agregar tarjetas para mostrar:

| Indicador |
|---|
| `[Ventas]` |
| `[Venta Mes Anterior]` |
| `[Variación Ventas vs Mes Anterior]` |
| `[% Variación Ventas vs Mes Anterior]` |

---

## Preguntas de análisis

- ¿Las ventas del mes actual son mayores que las del mes anterior?
- ¿Cuál es la variación absoluta?
- ¿Cuál es la variación porcentual?
- ¿Qué productos explican el aumento o disminución?
- ¿Qué clientes realizaron más pedidos?
- ¿Qué vendedor tuvo mejor desempeño?
- ¿Qué categoría tuvo mayor crecimiento mensual?

---

# Resultado esperado

Al finalizar estos pasos, el estudiante debe tener un reporte en Power BI capaz de comparar:

- ventas actuales vs año anterior
- ventas actuales vs mes anterior
- variación absoluta
- variación porcentual
- comportamiento por año, mes y día
- desempeño por producto, categoría, cliente y vendedor
