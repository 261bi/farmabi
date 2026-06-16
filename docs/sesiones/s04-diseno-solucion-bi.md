# S4 - Diseno de la solucion BI y mockup del dashboard

## 1. Introduccion

Tiempo: 20 min.

### 1.1 Proposito

Diseñar la experiencia de consumo analitico de la solucion BI antes de construir el dashboard en Power BI.

### 1.2 Resultado de aprendizaje

El estudiante organiza KPIs, filtros, paginas, visualizaciones, rutas de exploracion y criterios de lectura ejecutiva en un blueprint de dashboard alineado al modelo dimensional.

### 1.3 Producto de sesion

Blueprint de la solucion BI con mockup del dashboard, KPIs priorizados, filtros, segmentaciones, jerarquias de navegacion y reglas de consumo analitico.

### 1.4 Motivacion de la sesion

Un dashboard no es una coleccion de graficos. Es una interfaz para decidir. Antes de abrir Power BI, el equipo debe saber:

- Que decision se tomara.
- Que KPIs aparecen primero.
- Que filtros necesita el usuario.
- Que jerarquias permitiran explorar.
- Que hallazgos debe poder explicar.

Pregunta guia:

```text
Como debe consumir la gerencia los KPIs para pasar de dato a decision?
```

### 1.5 Ubicacion en el curso

- Unidad: U1 - Definicion del sistema de informacion para ejecutivos.
- Producto de unidad: diseño funcional y analitico de la solucion BI.
- Avance del producto en esta sesion: blueprint de dashboard y consumo analitico.

## 2. Explica

Tiempo: 15 min.

### 2.1 Del modelo al consumo

El modelo dimensional define que se puede analizar. El dashboard define como se consume.

| Elemento del modelo | Elemento de consumo |
|---|---|
| `fact_ventas.venta_neta` | Tarjeta KPI Ventas Netas |
| `fact_ventas.margen_bruto` | Tarjeta KPI Margen Bruto |
| `dim_fecha` | Segmentador y tendencia temporal |
| `dim_producto` | Drill-down familia -> categoria -> producto |
| `dim_vendedor` | Ranking comercial |
| `fact_ventas.horas_lead_time` | Indicador operativo |

### 2.2 Paginas recomendadas del dashboard

| Pagina | Proposito |
|---|---|
| Resumen ejecutivo | Vista de KPIs principales y tendencia |
| Ventas y margen | Analisis comercial por tiempo, producto y vendedor |
| Operacion de pedidos | Lead time, tiempos de confirmacion, despacho y entrega |
| Detalle exploratorio | Tabla o matriz para trazabilidad de datos |

### 2.3 Visualizaciones candidatas

| Necesidad | Visual sugerido |
|---|---|
| Ver KPI principal | Tarjeta |
| Ver tendencia | Linea por fecha |
| Comparar categorias | Barras |
| Analizar jerarquia producto | Matriz o grafico con drill-down |
| Segmentar | Slicers por fecha, familia, categoria, vendedor, estado |
| Revisar detalle | Tabla o matriz |

### 2.4 Reglas de diseño BI

- El primer pantallazo debe responder la decision principal.
- Los KPIs deben tener definicion y formula conocida.
- Los filtros deben corresponder a dimensiones del modelo.
- La navegacion debe seguir jerarquias reales.
- No se deben incluir KPIs fuera del alcance de datos.
- El usuario debe poder explicar de donde viene cada numero.

## 3. Aplica: actividad practica guiada

Tiempo: 3h.

### 3.1 Priorizar KPIs del primer tablero

**Producto del paso:** lista de KPIs visibles en la primera pagina.

Sugerencia:

| Orden | KPI | Uso |
|---:|---|---|
| 1 | Ventas Netas | Resultado comercial principal |
| 2 | Margen Bruto | Rentabilidad |
| 3 | % Margen Bruto | Calidad de la venta |
| 4 | Pedidos | Volumen |
| 5 | Ticket Promedio | Valor promedio |
| 6 | Lead Time Promedio | Eficiencia operativa |

### 3.2 Definir filtros y segmentadores

**Producto del paso:** mapa de segmentacion.

| Segmentador | Fuente |
|---|---|
| Anio / mes | `dim_fecha` |
| Familia / categoria / producto | `dim_producto` |
| Vendedor | `dim_vendedor` |
| Cliente | `dim_cliente` |
| Estado del pedido | `dim_estado_pedido` |

### 3.3 Diseñar mockup textual

**Producto del paso:** wireframe del dashboard.

Ejemplo:

```text
Pagina 1: Resumen ejecutivo

[Ventas Netas] [Margen Bruto] [% Margen] [Pedidos] [Ticket Promedio] [Lead Time]

Filtros: Anio | Mes | Familia | Vendedor | Estado

Grafico 1: Ventas netas por mes
Grafico 2: Margen por familia
Grafico 3: Top vendedores por ventas
Grafico 4: Lead time promedio por estado
Tabla: detalle de productos con venta, margen y descuento
```

### 3.4 Definir rutas de exploracion

**Producto del paso:** rutas de drill-down o drill-through.

| Ruta | Pregunta que responde |
|---|---|
| Anio -> Mes -> Dia | Cuando se vende mas? |
| Familia -> Categoria -> Producto | Que productos explican el margen? |
| Vendedor -> Cliente | Quien vende y a quien? |
| Estado -> Pedido | Donde se demora el proceso? |

### 3.5 Definir reglas de lectura ejecutiva

**Producto del paso:** narrativa del dashboard.

Completa:

```text
Si ventas netas bajan, revisar:
Si margen baja, revisar:
Si lead time sube, revisar:
Si descuentos suben, revisar:
Si pedidos caen, revisar:
```

## 4. Crea: actividad autonoma

Tiempo: 4h fuera del aula.

Entrega un PDF:

```text
S04_Equipo##_ApellidoNombre.pdf
```

Debe incluir:

1. Objetivo del dashboard.
2. Usuario ejecutivo.
3. KPIs priorizados.
4. Mockup de minimo dos paginas.
5. Filtros y segmentadores.
6. Rutas de exploracion.
7. Tabla KPI -> visual -> dimension -> decision.
8. Reflexion breve:

```text
Que riesgo aparece si el dashboard muestra graficos que no estan conectados a una decision?
```

## 5. Cierre evaluativo

Tiempo: 20 min.

### 5.1 Resultados esperados

El estudiante debe demostrar que:

- Diseña un dashboard orientado a decision.
- Selecciona KPIs coherentes con el modelo.
- Define filtros desde dimensiones reales.
- Propone rutas de exploracion utiles.
- Conecta visualizaciones con preguntas analiticas.

### 5.2 Preguntas de defensa

1. Que KPI debe verse primero y por que?
2. Que filtros son indispensables?
3. Que jerarquia usarias para analizar producto?
4. Que pagina responde el problema operativo?
5. Como validaras que un visual usa el campo correcto?

### 5.3 Rubrica

| Dimension | Peso | 3 - Logro destacado | 2 - Logro | 1 - Proceso | 0 - Inicio | Puntuacion obtenida |
|---|---:|---|---|---|---|---:|
| Priorizacion de KPIs | 2 | KPIs priorizados segun decision y usuario. | KPIs relevantes. | KPIs poco priorizados. | KPIs incoherentes. | |
| Mockup y paginas | 2 | Mockup claro, navegable y orientado a decision. | Mockup comprensible. | Mockup incompleto. | No presenta mockup. | |
| Filtros y jerarquias | 2 | Usa dimensiones y jerarquias reales del modelo. | Usa filtros correctos. | Filtros genericos. | Sin filtros utiles. | |
| Narrativa ejecutiva | 2 | Conecta hallazgos, acciones y decisiones. | Presenta lectura basica. | Narrativa superficial. | Sin narrativa. | |
| Aporte individual | 1 | Aporte verificable. | Aporte identificable. | Aporte general. | Sin aporte. | |
| Orden y evidencia | 1 | Documento claro y profesional. | Documento comprensible. | Documento desordenado. | Sin evidencia. | |

Puntuacion acumulada = suma de (`Peso` * `Puntuacion obtenida`) = ____.

Nota final = (`Puntuacion acumulada` / 30) * 20 = ____.
