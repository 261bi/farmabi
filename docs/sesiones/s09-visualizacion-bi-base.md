# S9 - Visualizacion BI base

## 1. Introduccion

### 1.1 Proposito

Construir la primera pagina de reporte BI con KPIs, metricas, filtros y visualizaciones base.

### 1.2 Resultado de aprendizaje

El estudiante transforma el modelo semantico en una vista ejecutiva inicial, usando tarjetas KPI, tendencias, rankings y segmentadores.

### 1.3 Producto de sesion

Reporte Power BI base con KPIs principales y filtros funcionales.

## 2. Explica

### 2.1 Primera pagina recomendada

```text
Resumen ejecutivo

[Ventas Netas] [Margen Bruto] [% Margen] [Pedidos] [Ticket Promedio] [Lead Time]

Tendencia de ventas
Margen por familia
Top vendedores
Descuentos por categoria
```

### 2.2 Visuales minimos

| Visual | KPI o campo |
|---|---|
| Tarjeta | Ventas Netas |
| Tarjeta | Margen Bruto |
| Tarjeta | Pedidos |
| Linea | Ventas Netas por fecha |
| Barras | Margen por familia |
| Tabla | Producto, venta, margen, descuento |
| Segmentadores | Fecha, familia, vendedor, estado |

## 3. Aplica: actividad practica guiada

### 3.0 Material legacy de referencia

Estas practicas antiguas quedan archivadas fuera del menu principal y sirven para recuperar pasos detallados:

| Practica legacy | Uso recomendado |
|---|---|
| [U2 S4 P1 - Exploracion OLAP y storytelling Power BI](_u2_legacy/SESION_U2_S4_P1_EXPLORACION_OLAP_STORYTELLING_POWER_BI.md) | Base para exploracion OLAP, primeras lecturas y storytelling |
| [U2 S5 P1 - Dashboard KPIs y visualizacion BI](_u2_legacy/SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md) | Base para crear visuales KPI iniciales |

### 3.1 Crear pagina Resumen ejecutivo

**Producto del paso:** pagina inicial del dashboard.

Colocar tarjetas:

- Ventas Netas
- Margen Bruto
- % Margen Bruto
- Pedidos
- Ticket Promedio
- Horas Lead Time Promedio

### 3.2 Agregar filtros

**Producto del paso:** segmentadores funcionales.

Filtros:

- Anio
- Mes
- Familia
- Categoria
- Vendedor
- Estado del pedido

### 3.3 Agregar visuales base

**Producto del paso:** primera lectura ejecutiva.

Visuales:

1. Ventas netas por mes.
2. Margen bruto por familia.
3. Top 10 productos por venta neta.
4. Top vendedores por margen.
5. Tabla de detalle con producto, ventas, descuentos y margen.

### 3.4 Validar comportamiento

**Producto del paso:** evidencia de interaccion.

Probar:

- cambiar anio;
- filtrar una familia;
- seleccionar un vendedor;
- confirmar que todos los visuales responden.

## 4. Crea: actividad autonoma

Entrega:

```text
S09_Equipo##_ApellidoNombre.pdf
```

Incluye capturas de reporte, filtros, visuales y una lectura de hallazgo inicial.

## 5. Cierre evaluativo

Preguntas:

1. Que KPI aparece primero y por que?
2. Que filtro cambia mas la interpretacion?
3. Que visual responde mejor el rendimiento comercial?
4. Que hallazgo inicial puedes defender?
