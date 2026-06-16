# S12 - Evaluacion U2

## 1. Introduccion

### 1.1 Proposito

Evaluar la solucion BI construida durante U2: DataMart, pipeline, modelo semantico, dashboard, validacion y gobierno del dato.

### 1.2 Resultado de aprendizaje

El estudiante sustenta una solucion BI funcional y validada, evidenciando construccion tecnica, calidad de datos, medidas BI y consumo analitico.

### 1.3 Producto de sesion

Solucion BI construida, validada y presentada con evidencias tecnicas.

## 2. Evidencias obligatorias

| Evidencia | Sesion |
|---|---|
| DataMart manual SQL | S6 |
| Ingesta hacia `raw` | S7 |
| dbt `staging` y `marts` | S7 |
| Tests dbt o validaciones SQL | S7-S8 |
| Modelo semantico Power BI | S8 |
| Dashboard base e interactivo | S9-S10 |
| Storytelling y gobierno | S11 |

## 3. Actividad evaluativa

### 3.1 Demo tecnica

Guion sugerido:

1. Mostrar arquitectura.
2. Mostrar fuente OLTP.
3. Mostrar `raw`, `staging`, `marts`.
4. Mostrar `dbt run` / `dbt test` o evidencia equivalente.
5. Mostrar Power BI y modelo semantico.
6. Mostrar dashboard e interacciones.
7. Presentar hallazgos y validacion.

### 3.2 Entregable U2

Usar como base:

```text
docs/guias/PLANTILLA_ENTREGABLE_U2_ETL_CALIDAD_DATOS_DATAMART.md
```

### 3.3 Defensa individual

Cada estudiante responde por su aporte:

```text
Componente trabajado:
Archivo o evidencia:
Problema encontrado:
Como lo valido:
Que decision BI permite:
```

## 4. Rubrica U2

| Criterio | Peso | 3 | 2 | 1 | 0 | Puntaje |
|---|---:|---|---|---|---|---:|
| DataMart y ETL manual | 2 | Completo y validado | Funcional | Parcial | Ausente | |
| Pipeline con herramientas | 2 | Ingesta + dbt + evidencia | Funcional con detalles | Parcial | Ausente | |
| Modelo semantico | 2 | Relaciones, jerarquias y medidas correctas | Funcional | Parcial | Ausente | |
| Dashboard e interaccion | 2 | Visual, navegable y orientado a decision | Funcional | Basico | Ausente | |
| Calidad y trazabilidad | 1 | Multinivel y clara | Principal | Superficial | Ausente | |
| Defensa individual | 1 | Clara y verificable | Identificable | General | Ausente | |

## 5. Cierre

La U2 termina cuando el equipo puede demostrar que el dato viaja desde el OLTP hasta Power BI con consistencia tecnica y sentido de negocio.
