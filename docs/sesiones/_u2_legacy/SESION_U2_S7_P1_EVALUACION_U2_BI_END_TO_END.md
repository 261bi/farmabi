# Sesión U2 S7 P1: Rúbrica de evaluación de proyectos BI

## 1. Título

Evaluación final de soluciones BI desarrolladas por los alumnos.

## 2. Objetivo

Evaluar que el alumno pueda diseñar, construir, explicar, validar e interpretar una solución BI propia.

La evaluación no exige que todos usen el mismo caso de negocio. Cada alumno o equipo puede trabajar con un caso propio, siempre que la solución demuestre el flujo completo de inteligencia de negocio:

```text
problema de negocio -> datos -> modelo -> métricas -> dashboard -> hallazgos -> gobierno
```

## 3. Producto final

El alumno entrega y sustenta un paquete BI compuesto por:

- archivo `.pbix`
- fuente de datos o muestra utilizada
- descripción del caso de negocio
- modelo de datos o modelo semántico
- medidas DAX principales
- dashboard con páginas analíticas
- validaciones de métricas
- hallazgos y recomendaciones
- ficha breve de gobierno del dato

Nombre sugerido:

```text
ProyectoBI_Apellido_Nombre.pbix
```

## 4. Requisitos mínimos del proyecto

### 4.1 Caso de negocio

El proyecto debe responder una pregunta de negocio clara.

Ejemplos:

- ¿qué productos generan mayor venta?
- ¿qué clientes explican la mayor parte de ingresos?
- ¿cómo evoluciona la demanda por periodo?
- ¿qué zonas o canales tienen mejor desempeño?
- ¿qué indicadores alertan una caída o mejora?

El alumno debe explicar:

- contexto del negocio
- usuario objetivo del reporte
- decisiones que el dashboard debe apoyar

### 4.2 Datos

El proyecto debe usar datos estructurados.

Puede usar:

- base de datos
- archivo Excel
- CSV
- dataset público
- datos generados para un caso controlado

Debe documentar:

- fuente
- tablas o archivos usados
- grano principal
- campos clave
- limitaciones de los datos

### 4.3 Modelo

La solución debe tener un modelo entendible.

Se espera:

- tabla de hechos o tabla principal
- dimensiones o tablas descriptivas cuando aplique
- relaciones correctas
- campos técnicos ocultos si no aportan al usuario
- nombres claros para campos visibles

### 4.4 Medidas

El proyecto debe usar medidas, no solo columnas arrastradas al visual.

Medidas mínimas sugeridas:

- métrica principal del negocio
- conteo o volumen
- promedio o ratio
- variación absoluta
- variación porcentual
- acumulado o comparativo temporal si aplica

### 4.5 Dashboard

El reporte debe incluir:

- página de resumen ejecutivo
- al menos una página de análisis o detalle
- KPIs principales
- gráfico temporal si el caso tiene fechas
- matriz o tabla analítica
- segmentadores funcionales
- diseño legible y consistente
- títulos o subtítulos claros

### 4.6 Interpretación

El alumno debe presentar al menos tres hallazgos de negocio.

Cada hallazgo debe responder:

```text
qué se encontró -> qué evidencia lo sustenta -> qué decisión sugiere
```

### 4.7 Validación

El alumno debe demostrar que al menos tres métricas fueron validadas.

Puede validar con:

- SQL
- Excel
- Power Query
- cálculo manual explicado
- tabla de control dentro de Power BI

### 4.8 Gobierno del dato

El proyecto debe incluir una ficha breve de gobierno:

```text
Nombre del dashboard:
Objetivo:
Usuario objetivo:
Fuente de datos:
Grano principal:
Métricas críticas:
Responsable funcional:
Frecuencia de actualización:
Limitaciones:
Datos sensibles:
```

## 5. Rúbrica de evaluación

Puntaje total: 20 puntos.

| Criterio | Peso | Excelente | Satisfactorio | En proceso | Insuficiente |
|---|---:|---|---|---|---|
| Caso de negocio | 2 pts | Problema claro, usuario definido y decisiones explícitas | Problema claro, pero decisiones poco detalladas | Caso entendible, pero débilmente conectado al negocio | No hay problema de negocio claro |
| Datos y preparación | 2 pts | Fuente documentada, grano claro y datos preparados | Fuente identificada y datos utilizables | Datos poco documentados o con limpieza incompleta | Datos confusos o no sustentan el análisis |
| Modelo de datos | 3 pts | Modelo ordenado, relaciones correctas y campos bien nombrados | Modelo funcional con pequeños detalles por mejorar | Modelo funciona parcialmente o tiene relaciones débiles | Modelo incorrecto o no explicable |
| Medidas DAX | 3 pts | Medidas correctas, reutilizables, formateadas y bien nombradas | Medidas principales correctas | Medidas básicas, con errores menores o poca reutilización | Métricas improvisadas o incorrectas |
| Dashboard y usabilidad | 3 pts | Reporte claro, navegable, consistente y orientado a decisión | Reporte funcional y legible | Reporte entendible, pero con problemas de diseño o lectura | Visuales desordenados o no responden al caso |
| Análisis e interpretación | 3 pts | Hallazgos claros con evidencia y recomendación | Hallazgos claros, pero recomendaciones generales | Hallazgos descriptivos con poca profundidad | No interpreta resultados |
| Validación de resultados | 2 pts | Valida métricas clave y explica diferencias | Valida algunas métricas principales | Validación incompleta o poco clara | No valida métricas |
| Gobierno del dato | 1 pt | Incluye ficha completa, métricas críticas y limitaciones | Incluye ficha básica | Ficha incompleta | No incluye gobierno del dato |
| Sustentación | 1 pt | Explica con seguridad lo técnico y lo funcional | Explica la mayor parte del proyecto | Requiere apoyo para explicar decisiones | No puede sustentar el proyecto |

## 6. Escala de calificación

| Puntaje | Nivel |
|---:|---|
| 18 - 20 | Sobresaliente |
| 16 - 17 | Logro esperado |
| 14 - 15 | Logro básico |
| 11 - 13 | En proceso |
| 0 - 10 | Insuficiente |

## 7. Evidencias a entregar

- archivo `.pbix`
- fuente de datos o muestra utilizada
- captura del modelo
- captura de medidas principales
- captura de páginas del dashboard
- tres hallazgos de negocio
- evidencia de validación
- ficha de gobierno del dato

## 8. Preguntas de sustentación

Durante la presentación, el alumno debe poder responder:

1. ¿qué problema de negocio resuelve tu dashboard?
2. ¿quién usaría este reporte?
3. ¿cuál es la fuente de datos?
4. ¿cuál es el grano principal de análisis?
5. ¿cuál es la métrica más importante?
6. ¿cómo calculaste esa métrica?
7. ¿cómo validaste que el resultado es correcto?
8. ¿qué hallazgo es el más relevante?
9. ¿qué decisión tomarías con ese hallazgo?
10. ¿qué limitaciones tiene tu solución?
11. ¿qué dato debería protegerse o controlarse?
12. ¿qué mejorarías en una siguiente versión?

## 9. Criterios de no logro

Se considera insuficiente si:

- no hay archivo Power BI funcional
- no existe problema de negocio claro
- el dashboard no responde preguntas de negocio
- las métricas no son explicables
- no hay medidas principales
- no hay validación de resultados
- el alumno no puede explicar el origen de los datos
- el alumno no puede interpretar sus propios visuales

## 10. Cierre

La evaluación verifica la competencia completa de la Unidad 2: construir una solución BI propia, explicar sus datos, defender sus métricas, comunicar hallazgos y proponer decisiones con base en evidencia.
