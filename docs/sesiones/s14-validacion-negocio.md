# S14 - Validacion con negocio

## 1. Introduccion

### 1.1 Proposito

Validar KPIs, trazabilidad y consistencia de datos con enfoque de negocio antes de la sustentacion final.

### 1.2 Resultado de aprendizaje

El estudiante concilia resultados tecnicos y analiticos, documenta diferencias y ajusta la solucion para una lectura ejecutiva confiable.

### 1.3 Producto de sesion

Validacion final de KPIs, matriz de trazabilidad, conciliacion SQL vs Power BI y ajustes de consistencia.

## 2. Aplica

### 2.1 Validar KPIs principales

| KPI | SQL DataMart | Power BI | Diferencia | Estado |
|---|---:|---:|---:|---|
| Ventas Netas |  |  |  |  |
| Margen Bruto |  |  |  |  |
| Pedidos |  |  |  |  |
| Ticket Promedio |  |  |  |  |
| % Pedidos a Tiempo |  |  |  |  |

### 2.2 Validar trazabilidad

| KPI | Fuente | DataMart | Medida BI | Visual |
|---|---|---|---|---|
| Ventas Netas | `pedido_detalles` | `fact_ventas.venta_neta` | `Ventas Netas` | Tarjeta |
| Margen Bruto | `pedido_detalles` | `fact_ventas.margen_bruto` | `Margen Bruto` | Tarjeta |
| Lead Time | `pedidos` | `fact_ventas.horas_lead_time` | `Horas Lead Time` | KPI |

### 2.3 Cerrar ajustes

Registrar:

```text
Hallazgo:
Causa:
Ajuste aplicado:
Evidencia posterior:
Estado:
```

## 3. Entrega

```text
S14_Equipo##_ApellidoNombre.pdf
```

Incluye conciliacion, trazabilidad y decisiones de ajuste.
