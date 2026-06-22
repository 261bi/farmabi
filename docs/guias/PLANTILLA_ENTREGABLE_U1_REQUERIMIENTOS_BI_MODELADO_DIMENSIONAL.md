# PLANTILLA - ENTREGABLE U1: Requerimientos BI y modelado dimensional

Esta plantilla integra las actividades autonomas de la Unidad 1:

- S1 Ciclo BI
- S2 Requerimientos BI
- S3 Modelo dimensional
- S4 Prototipos BI

El entregable debe demostrar que el equipo puede convertir una necesidad de negocio en una especificacion BI verificable, con problema, objetivos, KPIs, fuentes, modelo dimensional y mockup inicial del dashboard.

---

## 1. Problema de negocio

Describir brevemente el contexto del negocio en 3 a 5 lineas.

**Contexto del negocio:**

**Descripcion del problema:**

**Area o proceso involucrado:**

**Decisiones que se buscan mejorar:**

| Elemento | Descripcion |
| --- | --- |
| Empresa / caso |  |
| Area de negocio |  |
| Problema principal |  |
| Impacto actual |  |
| Decision esperada |  |

---

## 2. Objetivo analitico

### 2.1 Objetivo general

Indicar que se quiere analizar y para que decision servira.

```text
El objetivo analitico del proyecto es...
```

### 2.2 Preguntas analiticas

| Pregunta de negocio | Usuario interesado | KPI relacionado | Dimension de analisis |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

---

## 3. Alcance del BI o matriz de requerimientos

Completar la matriz de requerimientos BI definida en la sesion 2.

| Stakeholder | KPI | Proceso | Fuente |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

---

## 4. Ficha tecnica de cada KPI

Completar una ficha por cada KPI principal.

### KPI 1

| Campo | Descripcion |
| --- | --- |
| Indicador o KPI |  |
| Definicion |  |
| Objetivo |  |
| Unidad de medida |  |
| Formula |  |
| Caracteristicas / rangos | Bajo: / Promedio: / Cumplido: |
| Frecuencia de medicion |  |
| Usuarios |  |
| Fuente de datos |  |
| Impacto |  |
| Diagnostico, tendencia o comportamiento esperado |  |

### KPI 2

| Campo | Descripcion |
| --- | --- |
| Indicador o KPI |  |
| Definicion |  |
| Objetivo |  |
| Unidad de medida |  |
| Formula |  |
| Caracteristicas / rangos | Bajo: / Promedio: / Cumplido: |
| Frecuencia de medicion |  |
| Usuarios |  |
| Fuente de datos |  |
| Impacto |  |
| Diagnostico, tendencia o comportamiento esperado |  |

---

## 5. Matriz objetivo-indicador

| Objetivo analitico | Indicador / KPI | Pregunta que responde | Decision que permite tomar |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

---

## 6. Modelo dimensional

### 6.1 Matriz bus

| Proceso de negocio | Hecho | Fecha | Producto | Cliente | Tienda | Vendedor | Otra dimension |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Ventas | HVENTAS | X | X | X | X | X |  |
|  |  |  |  |  |  |  |  |

### 6.2 Tabla de hechos

**Nombre de la tabla de hechos:**  

**Grano de la tabla de hechos:**  

| Metrica | Descripcion | Formula / regla | KPI relacionado |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

### 6.3 Dimensiones y jerarquias

| Dimension | Atributos | Jerarquias |
| --- | --- | --- |
| Fecha |  | Dia, mes, trimestre, anio |
| Tienda | Nombre, zona, distrito, provincia, departamento, pais | Tienda, zona, distrito, provincia, departamento, pais |
| Cliente |  |  |
| Producto |  |  |
| Vendedor |  |  |

### 6.4 Ejemplo de jerarquias

| Dimension | Agregaciones |
| --- | --- |
| Fecha | Dia, mes, trimestre, anio |
| Tienda | Nombre, zona, distrito, provincia, departamento |
| Cliente | Nombre, rango etario, sexo, tipo |
| Producto | Nombre, categoria, tipo |

---

## 7. Mapeo modelo DataMart desde fuente OLTP

| Tabla / campo OLTP | Tabla / campo DataMart | Regla de transformacion | Uso analitico |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

---

## 8. Mockup del dashboard

Agregar imagen, enlace o descripcion del prototipo realizado en Power BI, Figma u otra herramienta.

### 8.1 KPIs principales

| KPI | Visual sugerido | Filtro relacionado |
| --- | --- | --- |
|  | Tarjeta |  |
|  | Linea |  |
|  | Barras |  |

### 8.2 Graficos

| Grafico | Proposito | Campo / KPI usado |
| --- | --- | --- |
|  |  |  |
|  |  |  |

### 8.3 Filtros

| Filtro | Campo | Justificacion |
| --- | --- | --- |
| Fecha |  |  |
| Producto |  |  |
| Cliente |  |  |

---

## 9. Validacion analitica

Responder brevemente:

1. Los KPIs responden al problema de negocio?
2. El modelo dimensional soporta el analisis requerido?
3. Las fuentes OLTP son suficientes para calcular los KPIs?
4. El dashboard propuesto permite tomar decisiones?
5. Que limitaciones tiene la propuesta actual?

---

# Rubrica de Evaluacion del Producto de la Unidad 1

| Criterio | N3 - Logro alto | N2 - Esperado | N1 - En proceso | N0 - Deficiente |
| --- | --- | --- | --- | --- |
| 1. Problema de negocio | Problema claro, relevante y bien contextualizado, vinculado a decisiones reales | Problema definido pero poco contextualizado | Problema poco claro o generico | No define problema |
| 2. KPIs y objetivos analiticos | KPIs bien definidos, medibles, con formula, frecuencia y alineados al negocio | KPIs definidos pero incompletos o poco claros | KPIs mal definidos o no medibles | No hay KPIs |
| 3. Fuentes de datos OLTP | Identifica correctamente tablas de BD transaccional, con descripcion y campos relevantes | Identifica fuentes pero sin detalle suficiente | Fuentes poco claras o incompletas | Usa datasets planos o no identifica fuentes |
| 4. Mapeo OLTP a DataMart | Mapeo completo y coherente entre tablas OLTP y modelo dimensional | Mapeo parcial o con inconsistencias menores | Mapeo incompleto o confuso | No existe mapeo o no corresponde |
| 5. Modelo dimensional Kimball | Modelo correcto: hechos, dimensiones, granularidad clara y jerarquias bien definidas | Modelo correcto pero con errores menores | Modelo incompleto o mal estructurado | Modelo incorrecto |
| 6. Coherencia modelo-KPIs | Modelo soporta completamente los KPIs definidos | Soporta parcialmente los KPIs | Relacion debil entre modelo y KPIs | No hay relacion |
| 7. Mockup / diseno BI | Dashboard bien planteado, KPIs claros y visualizacion coherente | Diseno basico pero funcional | Diseno poco claro o incompleto | No presenta diseno |
| 8. Validacion analitica | Justifica claramente que el modelo responde al problema | Validacion basica | Validacion debil o incompleta | No valida |

