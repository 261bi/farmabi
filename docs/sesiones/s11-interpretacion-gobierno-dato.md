# S11 - Interpretacion BI y gobierno del dato

## 1. Introduccion

### 1.1 Proposito

Convertir visualizaciones en una historia analitica trazable y aplicar reglas basicas de gobierno del dato.

### 1.2 Resultado de aprendizaje

El estudiante interpreta hallazgos, valida consistencia de KPIs, documenta trazabilidad fuente-modelo-visual y define controles de calidad y gobierno del dato.

### 1.3 Producto de sesion

Historia analitica con hallazgos, matriz de trazabilidad, reglas de calidad y validacion de consistencia.

## 2. Explica

### 2.1 Storytelling BI

Una historia analitica responde:

```text
Que paso?
Por que paso?
Que impacto tiene?
Que decision se recomienda?
Que dato lo respalda?
```

### 2.2 Gobierno del dato

| Elemento | Aplicacion en farmabi |
|---|---|
| Definicion de KPI | Formula unica |
| Propietario | Area responsable |
| Trazabilidad | OLTP -> raw -> staging -> marts -> Power BI |
| Calidad | completitud, unicidad, integridad, consistencia |
| Validacion | SQL vs Power BI |

## 3. Aplica: actividad practica guiada

### 3.1 Seleccionar hallazgos

**Producto del paso:** tres hallazgos defendibles.

Ejemplo:

| Hallazgo | Evidencia | Decision |
|---|---|---|
| Una familia concentra margen | Barras por familia | Priorizar promocion |
| Lead time sube en ciertos estados | KPI operativo | Revisar proceso |
| Descuentos reducen margen | Comparativo descuento/margen | Ajustar politica |

### 3.2 Validar trazabilidad

**Producto del paso:** matriz fuente-modelo-visual.

| Visual | Medida | Campo DataMart | Fuente OLTP |
|---|---|---|---|
| Tarjeta ventas | Ventas Netas | `fact_ventas.venta_neta` | `pedido_detalles` |
| Barras margen | Margen Bruto | `fact_ventas.margen_bruto` | `pedido_detalles` |
| Lead time | Horas Lead Time | `fact_ventas.horas_lead_time` | `pedidos` |

### 3.3 Aplicar controles de calidad

**Producto del paso:** controles documentados.

| Control | Ejemplo |
|---|---|
| Completitud | campos clave no nulos |
| Unicidad | claves de dimensiones unicas |
| Integridad | hechos con claves validas |
| Consistencia | venta_neta = venta_bruta - descuento |
| Rango | cantidades y precios positivos |

### 3.4 Redactar narrativa ejecutiva

**Producto del paso:** historia BI.

Estructura:

```text
Contexto:
Hallazgo principal:
Evidencia:
Impacto:
Recomendacion:
Validacion:
```

## 4. Crea: actividad autonoma

Entrega:

```text
S11_Equipo##_ApellidoNombre.pdf
```

Incluye tres hallazgos, matriz de trazabilidad, controles de calidad y narrativa ejecutiva.

## 5. Cierre evaluativo

Preguntas:

1. Que evidencia respalda tu hallazgo?
2. Como sabes que el KPI es consistente?
3. Que campo fuente origina el visual?
4. Que control de calidad aplicaste?
