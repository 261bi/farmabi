# S10 - Paneles interactivos

## 1. Introduccion

### 1.1 Proposito

Mejorar el reporte BI con interacciones, drill-down, drill-through, tooltips y segmentacion avanzada.

### 1.2 Resultado de aprendizaje

El estudiante diseña rutas de exploracion para que el usuario pase del KPI agregado al detalle analitico sin perder contexto.

### 1.3 Producto de sesion

Dashboard interactivo con navegacion analitica, segmentadores, tooltips y paginas de detalle.

## 2. Explica

### 2.1 Interacciones clave

| Interaccion | Uso |
|---|---|
| Drill-down | Explorar jerarquias |
| Drill-through | Ir a una pagina de detalle |
| Tooltip | Mostrar contexto adicional |
| Segmentador | Filtrar el modelo |
| Bookmark | Guardar una vista de analisis |

### 2.2 Rutas recomendadas

| Ruta | Pregunta |
|---|---|
| Anio -> Mes -> Dia | Cuando cambia la venta? |
| Familia -> Categoria -> Producto | Que explica el margen? |
| Vendedor -> Cliente | Quien genera la venta? |
| Estado -> Pedido | Donde se demora el proceso? |

## 3. Aplica: actividad practica guiada

### 3.0 Material base para desarrollar la sesion

Para desarrollar esta sesion en aula, usar como referencia las practicas legacy de la antigua U2 S5. No estan publicadas en el menu principal, pero quedan archivadas para recuperar pasos, capturas, medidas y actividades:

| Practica legacy | Uso recomendado en S10 |
|---|---|
| [U2 S5 P1 - Dashboard KPIs y visualizacion BI](_u2_legacy/SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md) | Base para armar la primera version del dashboard con KPIs, filtros y visuales principales |
| [U2 S5 P2 - Dashboard KPIs y visualizacion BI](_u2_legacy/SESION_U2_S5_P2_DASHBOARD_KPIS_VISUALIZACION_BI.md) | Base para extender el dashboard, ordenar paginas y mejorar lectura ejecutiva |
| [U2 S5 P3 - Tabla KPI variacion BI](_u2_legacy/SESION_U2_S5_P3_TABLA_KPI_VARIACION_BI.md) | Base para incorporar variaciones, comparativos y tabla KPI de seguimiento |

La sesion nueva S10 debe consolidar esas tres practicas en una experiencia mas compacta: panel interactivo, rutas de exploracion, tooltips, drill-down/drill-through y comparativos de variacion.

### 3.1 Configurar drill-down

**Producto del paso:** jerarquias navegables.

Usar:

- Calendario: anio, trimestre, mes, dia.
- Producto: familia, categoria, producto.

### 3.2 Crear pagina de detalle

**Producto del paso:** drill-through por producto o vendedor.

Pagina sugerida:

```text
Detalle producto
KPI: Ventas Netas, Margen, % Margen, Descuento
Tabla: fecha, cliente, vendedor, pedido, cantidad, venta_neta
```

### 3.3 Crear tooltips

**Producto del paso:** contexto sin saturar visuales.

Tooltip recomendado:

- ventas netas;
- margen bruto;
- % margen;
- descuentos;
- unidades vendidas.

### 3.4 Probar la navegacion

**Producto del paso:** evidencia de recorrido.

Validar:

1. Desde familia hasta producto.
2. Desde vendedor hasta clientes.
3. Desde KPI operativo hasta estados o pedidos.

## 4. Crea: actividad autonoma

Entrega:

```text
S10_Equipo##_ApellidoNombre.pdf
```

Incluye capturas de drill-down, drill-through, tooltips y una explicacion de la ruta analitica usada.

## 5. Cierre evaluativo

Preguntas:

1. Que diferencia hay entre drill-down y drill-through?
2. Que tooltip agrega valor real?
3. Que pagina ayuda a explicar un hallazgo?
4. Como evitas saturar el dashboard?
