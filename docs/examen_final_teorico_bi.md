# Examen Final Teórico - Inteligencia de Negocios

**Curso:** Inteligencia de Negocios  
**Proyecto:** Proyecto grupal BI  
**Duración:** 20 minutos  
**Puntaje:** 10 puntos  
**Modalidad:** Individual

**Estudiante:** ___________________________________________  
**Código:** ______________________________________________  
**Grupo N.°:** ____________________________________________  
**Nombre del proyecto grupal:** ___________________________

## Indicaciones

Responda de forma breve, clara y aplicada a su proyecto grupal. Cada pregunta vale **1 punto**. No se evaluará memoria aislada, sino comprensión de la solución BI desarrollada durante el curso.

Arquitectura de referencia trabajada:

```text
MySQL OLTP -> Debezium/Kafka o Airbyte -> PostgreSQL RAW -> dbt -> DataMart -> Power BI
```

## Preguntas

### 1. Problema de negocio y decisión - 1 punto

Indique el problema de negocio que atiende su proyecto grupal y qué decisión ejecutiva busca apoyar.

Respuesta:

```text

```

### 2. Pregunta analítica - 1 punto

Escriba una pregunta analítica principal de su proyecto y explique por qué es relevante para el negocio.

Respuesta:

```text

```

### 3. KPI principal - 1 punto

Indique un KPI principal de su proyecto, su fórmula de negocio y qué significa para la toma de decisiones.

| Elemento | Respuesta |
|---|---|
| KPI |  |
| Fórmula |  |
| Interpretación |  |

### 4. Tabla de hechos - 1 punto

Indique la tabla de hechos principal de su modelo dimensional y explique cuál es su grano.

| Elemento | Respuesta |
|---|---|
| Tabla de hechos |  |
| Grano |  |

### 5. Dimensiones - 1 punto

Mencione dos dimensiones de su modelo y explique qué análisis permite cada una.

| Dimensión | Análisis que permite |
|---|---|
| 1. |  |
| 2. |  |

### 6. Pipeline BI - 1 punto

Ordene el flujo de datos de su solución BI usando los componentes trabajados en el curso.

| Orden | Componente |
|---:|---|
| 1 |  |
| 2 |  |
| 3 |  |
| 4 |  |
| 5 |  |
| 6 |  |

### 7. Ingesta de datos - 1 punto

Explique brevemente qué tipo de ingesta usó o podría usar su proyecto: batch, CDC con Debezium/Kafka o Airbyte. Justifique su elección.

Respuesta:

```text

```

### 8. DataMart y Power BI - 1 punto

Explique la diferencia entre el DataMart en PostgreSQL y el modelo semántico en Power BI.

Respuesta:

```text

```

### 9. Dashboard - 1 punto

Mencione un gráfico o visual de su dashboard, el KPI que muestra y qué interacción permite al usuario.

| Visual | KPI mostrado | Interacción o filtro |
|---|---|---|
|  |  |  |

### 10. Validación y trazabilidad - 1 punto

Seleccione un KPI de su proyecto y explique cómo validó su trazabilidad desde la fuente hasta Power BI.

| Elemento | Respuesta |
|---|---|
| KPI seleccionado |  |
| Fuente o tabla origen |  |
| Tabla DataMart o transformación |  |
| Medida o visual en Power BI |  |
| Validación realizada |  |

## Distribución de puntaje

| Pregunta | Criterio evaluado | Puntaje |
|---:|---|---:|
| 1 | Problema y decisión | 1 pt |
| 2 | Pregunta analítica | 1 pt |
| 3 | KPI principal | 1 pt |
| 4 | Tabla de hechos y grano | 1 pt |
| 5 | Dimensiones | 1 pt |
| 6 | Pipeline BI | 1 pt |
| 7 | Ingesta de datos | 1 pt |
| 8 | DataMart y Power BI | 1 pt |
| 9 | Dashboard | 1 pt |
| 10 | Validación y trazabilidad | 1 pt |
| **Total** |  | **10 pts** |