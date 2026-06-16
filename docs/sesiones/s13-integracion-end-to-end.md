# S13 - Integracion completa end-to-end

## 1. Introduccion

### 1.1 Proposito

Integrar ETL, DataMart, modelo semantico y visualizacion en una sola demo BI end-to-end.

### 1.2 Resultado de aprendizaje

El estudiante ejecuta y explica el flujo completo desde la fuente transaccional hasta el dashboard, identificando dependencias, orden de ejecucion y evidencias.

### 1.3 Producto de sesion

Flujo end-to-end operativo:

```text
MySQL -> ingesta -> PostgreSQL raw -> dbt -> marts -> Power BI
```

## 2. Aplica

### 2.1 Checklist de integracion

| Componente | Evidencia |
|---|---|
| MySQL OLTP | tablas y datos |
| Ingesta | tablas en `raw` |
| PostgreSQL DW | schemas `raw`, `staging`, `marts` |
| dbt | `dbt run` y modelos creados |
| Power BI | archivo conectado |
| Dashboard | KPIs y filtros |

### 2.2 Demo end-to-end

Guion:

1. Mostrar arquitectura.
2. Mostrar fuente.
3. Mostrar aterrizaje en `raw`.
4. Mostrar transformacion dbt.
5. Mostrar DataMart.
6. Mostrar dashboard.
7. Mostrar una decision derivada.

## 3. Entrega

```text
S13_Equipo##_ApellidoNombre.pdf
```

Debe incluir evidencias del flujo completo y un problema de integracion resuelto.
