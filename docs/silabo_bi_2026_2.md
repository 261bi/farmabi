<!-- Version 2026-2 construida desde silabo_bi_2026_1.md y docs/index.md -->

Universidad Peruana Union  
Carret. Central km. 19.5 Nana. Telf. 01-6186300 Casilla 3564 Lima 1, Peru

# Silabo: Inteligencia de Negocios

## I. Informacion General de Asignatura

| N. | Campo | Informacion | N. | Campo | Informacion |
|---|---|---|---|---|---|
| 01 | Facultad/EGP | Facultad de Ingenieria y Arquitectura | 09 | Ano de plan de estudio | 2022-1 |
| 02 | Programa de estudio | EP Ingenieria de Sistemas | 10 | Ciclo de estudio | 8 |
| 03 | Tipo de estudio | General | 11 | Codigo de asignatura |  |
| 04 | Nombre de asignatura | Inteligencia de Negocios | 12 | Numero de creditos | 3 |
| 05 | Duracion |  | 13 | Nota minima probatoria | 13 |
| 06 | Horas de la asignatura | H. Te. Pract: 32 / H. Prc. Pres: 32 | 14 | Ano y semestre academico | 2026-2 |
| 07 | Docente | Sullon Macalupu Abel Angel |  |  |  |
| 08 | Pre requisito | Gestion de Procesos |  |  |  |

## II. Sumilla

La asignatura de Inteligencia de Negocios es de caracter teorico practico, perteneciente al Area de Formacion Especializada y Sub Area de Gestion de TI e Innovacion tecnologica. Su proposito es formar al estudiante para construir una solucion analitica completa orientada a la toma de decisiones, desde una fuente transaccional hasta un modelo consumible en Power BI. El curso integra definicion del problema de negocio, requerimientos analiticos, modelado dimensional, construccion del Data Warehouse/DataMart, pipelines de ingesta y transformacion, modelo semantico, visualizacion, gobierno del dato y sustentacion tecnica.

## III. Competencia del perfil de egreso en relacion a la asignatura

| Tipo | Competencia | Nivel / dimensiones |
|---|---|---|
| General | Pensamiento superior (caracter y aprendizaje autonomo). | N. 1.1: Firmeza de proposito, ejecucion, dominio propio, mantener el esfuerzo, habilidades tecnicas, salud socio emocional. |
| Especifica | Disena y gestiona sistemas inteligentes basandose en metodologias, estandares y herramientas a fin de lograr estrategias de mejora para la organizacion. | N. 1.1: Define requerimientos de inteligencia analitica, construye datasets, analiza los datos y define estrategias. |

## IV. Resultado de aprendizaje de la asignatura

| Resultado de aprendizaje | Producto Academico |
|---|---|
| Analiza un problema de negocio, define requerimientos analiticos y KPIs, modela dimensionalmente una solucion BI, implementa un Data Warehouse/DataMart, construye un pipeline de ingesta y transformacion, desarrolla un modelo semantico y presenta dashboards interactivos en Power BI, incorporando trazabilidad, validacion con negocio, gobierno del dato y sustentacion tecnica. | **Nombre:** Solucion BI end-to-end para toma de decisiones, con origen transaccional, Data Warehouse/DataMart, pipeline de ingesta y transformacion, modelo semantico, dashboard interactivo, validacion de KPIs, trazabilidad y sustentacion tecnica. |
|  | **Descripcion:** Solucion de Inteligencia de Negocios implementada sobre un flujo reproducible de datos que integra MySQL OLTP, ingesta Debezium/Kafka o Airbyte, PostgreSQL RAW/DW, transformaciones SQL/dbt y consumo analitico en Power BI. La solucion evidencia consistencia de datos, trazabilidad fuente-modelo-KPI, validacion de resultados, gobierno del dato y una demo end-to-end defendida tecnicamente. |

## V. Unidades de aprendizaje

## Unidad 1: Definicion del sistema de informacion para ejecutivos

| Resultado de aprendizaje | Producto |
|---|---|
| Convierte una necesidad de negocio en una especificacion BI verificable, definiendo preguntas analiticas, KPIs, hechos, grano, dimensiones, jerarquias, fuentes de datos, mapeo fuente-modelo y una primera propuesta de consumo analitico para ejecutivos. | **Nombre:** Diseno funcional y analitico de la solucion BI, con problema de negocio, requerimientos, KPIs, modelo dimensional, metadata y mockup del dashboard. |

| Criterios de evaluacion del producto | Descripcion del producto |
|---|---|
| Problema de negocio delimitado. Preguntas analiticas y decisiones esperadas claramente definidas. KPIs con formulas, dimensiones de analisis y criterios de aceptacion. Modelo dimensional coherente con hechos, grano, dimensiones y jerarquias. Metadata y mapeo fuente-modelo trazables. Mockup de dashboard alineado al consumo ejecutivo. | Documento de diseno BI que traduce una necesidad organizacional en una especificacion analitica lista para construccion, incluyendo requerimientos, KPIs, modelo dimensional, diccionario de datos, trazabilidad y propuesta inicial de dashboard. |

### Sesiones de aprendizaje

| N. | Fecha | Contenido | HT | HP | Actividad practica | Actividad autonoma |
|---|---|---|---|---|---|---|
| 1 | 15/03/2026 - 21/03/2026 | Fundamentos BI: problema de negocio y ciclo BI negocio -> datos -> insight -> decision. | 2 | 2 | Delimita el caso de negocio BI, actores, decisiones esperadas y preguntas analiticas iniciales. | Documenta el ciclo BI aplicado al caso y refina las decisiones que seran soportadas por datos. |
| 2 | 22/03/2026 - 28/03/2026 | Requerimientos analiticos y KPIs. | 2 | 2 | Construye la matriz de requerimientos analiticos con KPIs, formulas, dimensiones de analisis y criterios de aceptacion. | Completa definiciones de KPIs, fuentes preliminares y validaciones esperadas con usuarios del negocio. |
| 3 | 29/03/2026 - 04/04/2026 | Modelado dimensional y metadata: hechos, grano, dimensiones, jerarquias, fuentes y mapeo fuente-modelo. | 2 | 2 | Disena el modelo dimensional inicial con hecho principal, dimensiones, grano, jerarquias, diccionario de datos y trazabilidad fuente-modelo. | Ajusta el modelo dimensional, valida grano y jerarquias, y completa la metadata de fuentes. |
| 4 | 05/04/2026 - 11/04/2026 | Diseno de la solucion BI: KPIs, mockup del dashboard y consumo analitico. | 2 | 2 | Elabora el blueprint de la solucion BI con KPIs priorizados, mockup del dashboard, filtros, usuarios y flujo de consumo. | Mejora el mockup, alinea visualizaciones con decisiones y prepara evidencias del diseno funcional. |
| 5 | 12/04/2026 - 18/04/2026 | Evaluacion U1: definicion del sistema BI para ejecutivos. | 2 | 2 | Sustenta el documento de diseno BI validado y defendido como base de construccion. | Incorpora retroalimentacion y deja estable la especificacion BI para iniciar la construccion. |

## Unidad 2: Construccion del BI

| Resultado de aprendizaje | Producto |
|---|---|
| Implementa la solucion BI definida en la Unidad 1 usando componentes del laboratorio farmabi: MySQL OLTP como fuente, Debezium + Kafka o Airbyte para ingesta, PostgreSQL RAW/DW como repositorio analitico, SQL/dbt para transformacion y Power BI para modelo semantico, metricas y visualizacion. | **Nombre:** Solucion BI implementada con Data Warehouse/DataMart, pipeline de ingesta y transformacion, modelo semantico, metricas, visualizaciones, paneles interactivos, validacion analitica y gobierno del dato. |

| Criterios de evaluacion del producto | Descripcion del producto |
|---|---|
| DataMart construido y validado. Pipeline de ingesta y transformacion operativo. Carga incremental, CDC o SCD evidenciada segun alcance. Modelo semantico con relaciones, jerarquias y medidas DAX. Visualizaciones y paneles interactivos coherentes. Trazabilidad fuente-modelo-KPI. Reglas de calidad y validacion de consistencia documentadas. | Implementacion tecnica de la solucion BI con origen transaccional, repositorio analitico, transformaciones, modelo semantico, dashboards y evidencias de validacion para la toma de decisiones. |

### Sesiones de aprendizaje

| N. | Fecha | Contenido | HT | HP | Actividad practica | Actividad autonoma |
|---|---|---|---|---|---|---|
| 6 | 19/04/2026 - 25/04/2026 | Implementacion manual del DW con SQL: ETL manual, transformacion, carga y validacion analitica. | 2 | 2 | Construye un DataMart manual con SQL, dimensiones/hecho cargados y consultas de validacion analitica. | Documenta scripts, validaciones y correspondencia entre el modelo dimensional y las tablas construidas. |
| 7 | 26/04/2026 - 02/05/2026 | Implementacion del pipeline BI con herramientas: ingesta, CDC, transformacion, carga incremental, optimizacion y SCD. | 2 | 2 | Implementa un pipeline BI automatizado o semi-automatizado con replica MySQL -> PostgreSQL, transformaciones dbt y evidencia de carga incremental/CDC/SCD segun alcance. | Consolida evidencias de ingesta, transforma datos faltantes y documenta decisiones tecnicas del pipeline. |
| 8 | 03/05/2026 - 09/05/2026 | Modelo semantico y metricas BI: OLAP, jerarquias, medidas y agregaciones. | 2 | 2 | Construye el modelo semantico en Power BI con relaciones, jerarquias, medidas DAX y agregaciones validadas. | Valida medidas contra consultas SQL y separa responsabilidades entre DataMart fisico y modelo semantico. |
| 9 | 10/05/2026 - 16/05/2026 | Visualizacion BI base: KPIs, metricas y filtros. | 2 | 2 | Desarrolla un reporte BI base con tarjetas KPI, graficos principales, filtros y lectura inicial de resultados. | Mejora visualizaciones, verifica consistencia de KPIs y documenta hallazgos iniciales. |
| 10 | 17/05/2026 - 23/05/2026 | Diseno de paneles interactivos: drill-down, drill-through, tooltips y segmentacion. | 2 | 2 | Construye un dashboard interactivo con navegacion analitica, segmentadores, tooltips y rutas de exploracion. | Ajusta interacciones, jerarquias visuales y experiencia de exploracion para usuarios ejecutivos. |
| 11 | 24/05/2026 - 30/05/2026 | Interpretacion BI y gobierno del dato: storytelling, trazabilidad y validacion. | 2 | 2 | Elabora una historia analitica con hallazgos, trazabilidad fuente-modelo-KPI, reglas de calidad y validacion de consistencia. | Consolida matriz de trazabilidad, reglas de calidad, linaje de datos y recomendaciones preliminares. |
| 12 | 31/05/2026 - 06/06/2026 | Evaluacion U2: solucion BI construida. | 2 | 2 | Sustenta la solucion BI construida, validada y presentada con evidencias tecnicas. | Corrige observaciones y prepara la integracion end-to-end para la Unidad 3. |

## Unidad 3: Integracion y toma de decisiones

| Resultado de aprendizaje | Producto |
|---|---|
| Integra ETL, DataMart, modelo semantico y visualizacion en una demo completa orientada a decisiones, demostrando la trazabilidad desde la fuente transaccional hasta los KPIs del dashboard, explicando decisiones de modelado y validando consistencia de datos. | **Nombre:** Solucion BI end-to-end integrada, validada con negocio, documentada y sustentada mediante demo tecnica. |

| Criterios de evaluacion del producto | Descripcion del producto |
|---|---|
| Flujo end-to-end operativo desde la fuente transaccional hasta Power BI. Validacion final de KPIs y conciliacion de datos. Matriz de trazabilidad completa. Narrativa ejecutiva orientada a decisiones. Demo tecnica reproducible. Defensa del aporte individual y de las decisiones tecnicas. | Producto final del curso que integra pipeline de datos, Data Warehouse/DataMart, modelo semantico, dashboards, validacion con negocio, gobierno del dato y sustentacion tecnica. |

### Sesiones de aprendizaje

| N. | Fecha | Contenido | HT | HP | Actividad practica | Actividad autonoma |
|---|---|---|---|---|---|---|
| 13 | 07/06/2026 - 13/06/2026 | Integracion completa: ETL + DataMart + visualizacion. | 2 | 2 | Integra el flujo end-to-end desde MySQL OLTP hasta Power BI, con evidencias de ejecucion. | Estabiliza el pipeline, corrige fallos de integracion y documenta el flujo completo de datos. |
| 14 | 14/06/2026 - 20/06/2026 | Validacion con negocio: KPIs, trazabilidad y consistencia de datos. | 2 | 2 | Realiza la validacion final de KPIs, conciliacion de datos, matriz de trazabilidad y ajustes de consistencia. | Completa evidencias de validacion, actualiza reglas de calidad y refina recomendaciones ejecutivas. |
| 15 | 21/06/2026 - 27/06/2026 | Sustentacion final: demo end-to-end BI. | 2 | 2 | Presenta la demo final de la solucion BI, narrativa ejecutiva y defensa tecnica del aporte. | Incorpora retroalimentacion, consolida repositorio, evidencias finales y materiales de sustentacion. |
| 16 | 28/06/2026 - 04/07/2026 | Examen final. | 2 | 2 | Desarrolla la evaluacion individual de competencias BI y toma de decisiones basada en datos. | Reflexiona sobre aprendizajes, limitaciones del producto y mejoras futuras de la solucion BI. |

## VI. Estrategias metodologicas

| N. | Estrategias de ensenanza y de aprendizaje que se aplicaran en la asignatura |
|---|---|
| 1.1 | Aprendizaje Cooperativo: Fomenta habilidades colaborativas y de trabajo en equipo, cruciales en la mayoria de los entornos laborales modernos. |
| 1.2 | Aprendizaje Basado en Problemas: Centra el aprendizaje en la resolucion de problemas reales, una habilidad esencial en casi todas las profesiones. Estimula el pensamiento critico y la colaboracion, elementos clave en el desarrollo de competencias. |
| 1.3 | Estudios de caso: Desarrolla el pensamiento critico y la toma de decisiones al analizar situaciones complejas, preparando a los estudiantes para enfrentar problemas similares en sus futuras carreras profesionales. |
| 1.4 | Proyectos: Fomentan habilidades de investigacion, gestion del tiempo y trabajo en equipo, todas cruciales en el mundo profesional. |

## VII. Evaluacion

La evaluacion de los estudiantes se rige por el Reglamento de Estudios, disponible en: <https://upeu.edu.pe/reglamentos/evaluacion/>.

La estructura evaluativa comprende componentes formativos y/o de procesos, de producto y genericos, reflejando un enfoque integral.

### Componentes de evaluacion y ponderacion

- **Evaluacion de Sesiones (ES):** Es el promedio de las evaluaciones aplicadas a los estudiantes para verificar su proceso de aprendizaje durante las sesiones de las unidades. Su contribucion a la nota final es de hasta el 20%.
- **Evaluacion de Productos (EP):** Es el promedio ponderado de las evaluaciones de los productos entregados en cada unidad. Este componente representa un minimo del 70% de la nota final.
- **Evaluacion de Competencias Generales (ECG):** Esta evaluacion aporta hasta un 10% al calculo de la nota final.

### Programacion de evaluaciones

| Fecha | Unidad | Producto | Evaluacion de proceso y de resultado | Pesos |
|---|---|---|---|---|
| 18/04/2026 | Unidad 1: Definicion del sistema de informacion para ejecutivos | Diseno funcional y analitico de la solucion BI. | Evaluacion de sesiones | 5% |
| 18/04/2026 | Unidad 1: Definicion del sistema de informacion para ejecutivos | Diseno funcional y analitico de la solucion BI. | Evaluacion del producto | 20% |
| 06/06/2026 | Unidad 2: Construccion del BI | Solucion BI implementada con Data Warehouse/DataMart, pipeline, modelo semantico, visualizaciones y gobierno del dato. | Evaluacion de sesiones | 5% |
| 06/06/2026 | Unidad 2: Construccion del BI | Solucion BI implementada con Data Warehouse/DataMart, pipeline, modelo semantico, visualizaciones y gobierno del dato. | Evaluacion del producto | 20% |
| 04/07/2026 | Unidad 3: Integracion y toma de decisiones | Solucion BI end-to-end integrada, validada con negocio, documentada y sustentada mediante demo tecnica. | Evaluacion de sesiones | 10% |
| 04/07/2026 | Unidad 3: Integracion y toma de decisiones | Solucion BI end-to-end integrada, validada con negocio, documentada y sustentada mediante demo tecnica. | Evaluacion del producto | 30% |
| 04/07/2026 | Competencia General | Pensamiento superior (caracter y aprendizaje autonomo). | Competencia General | 10% |

| Componente | Peso |
|---|---|
| Evaluacion de sesiones | 20% |
| Evaluacion del producto | 70% |
| Evaluacion de competencia generica | 10% |
| **Total** | **100%** |

## VIII. Recursos, medios y materiales

| N. | Recursos, medios y materiales |
|---|---|
| 1 | Guias y/o tutoriales |
| 2 | PC de Escritorio con programas de ofimatica |
| 3 | Laboratorios |
| 4 | Internet - Wifi |
| 5 | Proyector y/o TV Smart |

## IX. Referencias

### Libros

- Sanchez Castro. (2013). *Fundamentos de Inteligencia Empresarial*. Bogota, CO: Filigrana.
- Powell, B. (2018). *Mastering Microsoft Power BI*. United Kingdom: Packt.
- Aspin, A. (2018). *Pro Power BI Desktop*. United Kingdom: Apress.
- Powell, B. (2017). *Microsoft Power BI Cookbook*. United Kingdom: Packt.
- Kimball, R. (2013). *The Data Warehouse Toolkit*. Wiley.
- Matteo Zaralli. (2024). *Virtual Reality and Artificial Intelligence: Risks and Opportunities for Your Business*. Productivity Press.
- Vincent Charles. (2023). *Data Analytics and Business Intelligence: Computational Frameworks, Practices, and Applications*. CRC Press.
- Santa Biblia. (1960). Sociedades Biblicas Unidas. Reina-Valera 1960.
- Hiran Kamal. (2023). *Handbook of Research on AI and Knowledge Engineering for Real-Time Business Intelligence*. Engineering Science Reference.
- Bernd Heesen. (2024). *Effective Strategy Execution: Business Intelligence Using Microsoft Power BI*. Springer.
- Sherman, R. (2015). *Business Intelligence Guidebook*. MK.
- Joyanes, L. (2020). *Inteligencia de negocios y analitica de datos*. Alfaomega.
- Jen Stirrup, Thomas Weinandy. (2024). *Artificial Intelligence with Microsoft Power BI: Simpler AI for the Enterprise*. O'Reilly Media.
- Kellenberger, K. (2016). *Beginning SQL Server Reporting Services*. Springer. DOI: <https://doi.org/10.1007/978-1-4842-1990-4>.
- Marques, M. *Business Intelligence, Tecnicas, herramientas y aplicaciones*. Editorial RC.

### Enlaces de internet

- <https://learn.microsoft.com/es-es/sql/sql-server/install/install-sql-server-business-intelligence-features?view=sql-server-ver16>
- <https://crai.upeu.edu.pe/repositorios-upeu/>
- <https://renati.sunedu.gob.pe/>
- <https://www.biblegateway.com/versions/Reina-Valera-1960-RVR1960-Biblia/>
- <https://repositorio.upeu.edu.pe/>
- <https://learn.microsoft.com/es-es/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms>
- <https://alicia.concytec.gob.pe/vufind/>