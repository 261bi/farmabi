# Unidad 2 - Sesión 5

## Sesión 10 - Comparativos de ventas con inteligencia de tiempo

Este documento deja congelada la quinta sesión macro de la Unidad 2.

La sesión corresponde al bloque:

```text
Unidad 2 - Construcción del BI
Sesión 10 - Comparativos de ventas: año previo y mes anterior
```

## Por qué esta sesión va después de la exploración

Una vez que el estudiante ya sabe navegar jerarquías, abrir detalles y controlar contexto de filtro, puede usar inteligencia de tiempo para comparar periodos.

Aquí el foco cambia:

```text
Explorar el modelo -> Comparar periodos -> Interpretar crecimiento o caída
```

La sesión inicia directamente con el comparativo de ventas actuales contra el año previo, porque esa pregunta genera una lectura de negocio más productiva que construir primero un dashboard base.

## Alcance

- ventas actuales vs ventas del año previo para el mismo periodo
- ventas del mes actual vs ventas del mes anterior
- odómetro de ventas contra meta anual
- tablas KPI de variación por año y categoría
- medidas con `DATEADD`, `DATESMTD` y `CALCULATE`
- KPIs con eje de tendencia por mes y por día
- títulos dinámicos según el periodo seleccionado
- variación absoluta y porcentual
- filtros de año, mes, producto, categoría, vendedor y estado
- validación de comparativos contra SQL

## Prácticas que la componen

- [SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md](SESION_U2_S5_P1_DASHBOARD_KPIS_VISUALIZACION_BI.md)
- [SESION_U2_S5_P2_DASHBOARD_KPIS_VISUALIZACION_BI.md](SESION_U2_S5_P2_DASHBOARD_KPIS_VISUALIZACION_BI.md)
- [SESION_U2_S5_P3_TABLA_KPI_VARIACION_BI.md](SESION_U2_S5_P3_TABLA_KPI_VARIACION_BI.md)

## Lógica didáctica

- el estudiante aplica inteligencia de tiempo sobre una medida de ventas
- diferencia comparación anual y comparación mensual
- entiende que el contexto de filtro cambia el periodo comparable
- crea KPIs por mes y por día sin mezclar ambas lecturas
- usa títulos dinámicos para comunicar el periodo comparado
- valida ventas actuales, ventas comparables y variación contra SQL

## Resultado esperado

Al finalizar la sesión, el alumno debe tener un reporte Power BI con:

- KPI de ventas actuales vs año previo
- KPI diario de ventas actuales vs año previo
- KPI de ventas del mes actual vs mes anterior
- visuales de tendencia por mes y por día
- medidas de variación absoluta y porcentual
- odómetro de ventas contra meta anual
- tabla KPI por año y por categoría
- segmentadores funcionales de tiempo y negocio
- conclusiones sobre crecimiento o disminución de ventas

## Cierre del bloque BI

Esta sesión cierra el curso de BI porque integra todo el recorrido:

```text
modelo estrella -> medidas DAX -> comparativos temporales -> KPIs -> interpretación ejecutiva
```

El alumno ya no trabaja solo con visuales aislados. Trabaja con un reporte capaz de responder preguntas de negocio:

- cómo va el año frente al año previo?
- cómo va el mes frente al mes anterior?
- qué productos explican el crecimiento o la caída?
- qué familias requieren acción comercial?
- dónde conviene priorizar revisión de stock, promoción o seguimiento?

Mensaje final:

```text
Un reporte BI aporta valor cuando convierte datos en decisiones.
```

## Continuidad

La siguiente sesión convierte el reporte en un producto BI entregable:

- control de calidad
- rendimiento básico
- actualización de datos
- seguridad y publicación conceptual
- documentación del modelo y métricas
- paquete final para evaluación
