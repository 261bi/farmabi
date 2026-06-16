# S5 - Evaluacion U1: diseno BI validado

## 1. Introduccion

Tiempo: 20 min.

### 1.1 Proposito

Evaluar y cerrar el diseño de la solucion BI antes de iniciar la construccion tecnica del DataMart y el pipeline en U2.

### 1.2 Resultado de aprendizaje

El estudiante sustenta un diseño BI completo, trazable y construible, integrando problema de negocio, preguntas analiticas, KPIs, modelo dimensional, metadata y mockup de dashboard.

### 1.3 Producto de sesion

Documento de diseño BI validado y defendido como base de construccion para U2.

### 1.4 Motivacion de la sesion

Antes de crear tablas, pipelines o reportes, el equipo debe demostrar que sabe que va a construir y por que. La evaluacion U1 evita que U2 se convierta en ejecucion tecnica sin sentido de negocio.

Pregunta guia:

```text
El diseño BI esta suficientemente claro para que otro equipo pueda construirlo?
```

### 1.5 Ubicacion en el curso

- Unidad: U1 - Definicion del sistema de informacion para ejecutivos.
- Producto de unidad: diseño funcional y analitico de la solucion BI.
- Avance del producto en esta sesion: validacion final del diseño.

## 2. Explica

Tiempo: 15 min.

### 2.1 Componentes evaluados

| Componente | Evidencia esperada |
|---|---|
| Problema de negocio | Caso, decision y usuario ejecutivo |
| Preguntas analiticas | Preguntas medibles y priorizadas |
| KPIs | Formula, fuente, dimension, criterio de aceptacion |
| Modelo dimensional | Hecho, grano, dimensiones y jerarquias |
| Metadata | Diccionario y reglas de calculo |
| Trazabilidad | Fuente OLTP -> modelo -> KPI -> visual |
| Mockup | Paginas, filtros, visuales y narrativa |

### 2.2 Criterios de validacion

Un diseño BI esta listo para U2 si:

- El problema pertenece al alcance ventas / pedidos.
- Los KPIs pueden calcularse con las fuentes existentes.
- El grano de `fact_ventas` esta claro.
- Las dimensiones son suficientes para responder las preguntas.
- La trazabilidad no tiene saltos.
- El dashboard propuesto consume el modelo, no datos inventados.

### 2.3 Semaforo de madurez

| Estado | Significado |
|---|---|
| Verde | Listo para construir en U2 |
| Amarillo | Requiere ajustes menores |
| Rojo | No tiene trazabilidad o alcance viable |

## 3. Aplica: actividad practica guiada

Tiempo: 3h.

### 3.1 Preparar expediente U1

**Producto del paso:** documento integrado.

Estructura minima:

```text
1. Caso de negocio
2. Decision ejecutiva
3. Preguntas analiticas
4. Matriz de KPIs
5. Modelo dimensional
6. Metadata y diccionario
7. Trazabilidad fuente-modelo-KPI-visual
8. Mockup del dashboard
9. Riesgos y supuestos
10. Plan de construccion U2
```

### 3.2 Revisar trazabilidad completa

**Producto del paso:** matriz final de trazabilidad.

| Fuente OLTP | Modelo | KPI | Visual esperado |
|---|---|---|---|
| `pedido_detalles.cantidad` | `fact_ventas.cantidad_vendida` | Unidades Vendidas | Tarjeta / barras |
| `pedido_detalles.precio_venta_unitario` | `fact_ventas.venta_bruta` | Ventas Brutas | Tarjeta |
| `pedido_detalles.total_descuento_unitario` | `fact_ventas.descuento_total` | Descuentos | Tarjeta / tendencia |
| `pedidos.fecha_creacion` | `dim_fecha` | Ventas por periodo | Linea temporal |
| `productos + categorias + familias` | `dim_producto` | Margen por familia | Barras / drill-down |
| `pedidos.fecha_entrega` | `fact_ventas.horas_lead_time` | Lead time | KPI operativo |

### 3.3 Ensayar defensa tecnica

**Producto del paso:** guion de sustentacion.

Guion sugerido de 7 minutos:

1. Problema y decision.
2. Preguntas y KPIs.
3. Modelo dimensional.
4. Trazabilidad.
5. Mockup de consumo.
6. Riesgos.
7. Preparacion para U2.

### 3.4 Checklist de pase a U2

**Producto del paso:** aprobacion del diseño.

| Item | Estado |
|---|---|
| Problema delimitado |  |
| KPIs definidos |  |
| Grano del hecho aprobado |  |
| Dimensiones aprobadas |  |
| Jerarquias definidas |  |
| Trazabilidad completa |  |
| Mockup coherente |  |
| Riesgos identificados |  |

## 4. Crea: actividad autonoma

Tiempo: 4h fuera del aula.

Entrega un PDF:

```text
S05_Equipo##_ApellidoNombre.pdf
```

Debe incluir el expediente U1 completo y una seccion individual:

```text
Aporte individual:
Archivo, tabla, matriz, mockup o seccion desarrollada:
Decision de diseño defendida:
Riesgo detectado:
Mejora propuesta para U2:
```

## 5. Cierre evaluativo

Tiempo: 20 min.

### 5.1 Resultados esperados

El estudiante debe demostrar que:

- Integra S1-S4 en un diseño coherente.
- Defiende el grano y las dimensiones.
- Justifica KPIs con fuentes reales.
- Explica el mockup del dashboard.
- Identifica que se construira en U2.

### 5.2 Preguntas de defensa

1. Cual es la decision ejecutiva principal?
2. Cual es el KPI rey del caso y por que?
3. Cual es el grano de `fact_ventas`?
4. Que tabla fuente alimenta las medidas monetarias?
5. Como se calcula lead time?
6. Que visual responde la decision principal?
7. Que riesgo llevarias a U2?

### 5.3 Rubrica de evaluacion U1

| Dimension | Peso | 3 - Logro destacado | 2 - Logro | 1 - Proceso | 0 - Inicio | Puntuacion obtenida |
|---|---:|---|---|---|---|---:|
| Problema y decision | 2 | Caso, actor y decision estan claros y son viables. | Caso y decision comprensibles. | Caso general. | Sin problema claro. | |
| KPIs y requerimientos | 2 | KPIs completos con formula, fuente y aceptacion. | KPIs con formula y fuente. | KPIs parciales. | KPIs incoherentes. | |
| Modelo dimensional | 2 | Hecho, grano, dimensiones y jerarquias correctos. | Modelo correcto con detalles menores. | Modelo incompleto. | No hay modelo. | |
| Trazabilidad | 2 | Fuente -> modelo -> KPI -> visual sin saltos. | Trazabilidad principal completa. | Trazabilidad parcial. | Sin trazabilidad. | |
| Mockup y consumo | 1 | Mockup orientado a decision y navegacion clara. | Mockup comprensible. | Mockup superficial. | Sin mockup. | |
| Sustentacion y aporte | 1 | Defensa clara con aporte individual verificable. | Defensa y aporte identificables. | Defensa debil. | No sustenta. | |

Puntuacion acumulada = suma de (`Peso` * `Puntuacion obtenida`) = ____.

Nota final = (`Puntuacion acumulada` / 30) * 20 = ____.
