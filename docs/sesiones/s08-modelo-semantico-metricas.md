# S8 - Modelo semantico y metricas BI

## 1. Introduccion

### 1.1 Proposito

Construir el modelo semantico en Power BI a partir del DataMart `marts` y definir medidas BI confiables.

### 1.2 Resultado de aprendizaje

El estudiante conecta Power BI a PostgreSQL, importa las tablas `marts`, define relaciones, jerarquias, medidas DAX y valida agregaciones contra SQL.

### 1.3 Producto de sesion

Archivo Power BI con modelo estrella, jerarquias OLAP y medidas DAX principales.

## 2. Explica

### 2.1 Flujo de consumo

```text
PostgreSQL marts -> Power BI -> Modelo semantico -> DAX -> Reporte
```

### 2.2 Tablas esperadas

| Tabla | Rol |
|---|---|
| `marts.fact_ventas` | Hecho central |
| `marts.dim_fecha` | Tiempo |
| `marts.dim_producto` | Producto, categoria, familia |
| `marts.dim_cliente` | Cliente |
| `marts.dim_vendedor` | Vendedor |
| `marts.dim_estado_pedido` | Estado |

### 2.3 Medidas base

Tomar como referencia:

```text
powerbi/medidas_farmacia_bi.dax
```

Medidas minimas:

- Ventas Brutas
- Descuentos
- Ventas Netas
- Costo Total
- Margen Bruto
- % Margen Bruto
- Pedidos
- Ticket Promedio
- % Pedidos a Tiempo

## 3. Aplica: actividad practica guiada

### 3.0 Material legacy de referencia

Estas practicas antiguas quedan archivadas fuera del menu principal y sirven para recuperar pasos detallados:

| Practica legacy | Uso recomendado |
|---|---|
| [U2 S3 P1 - Modelo semantico Power BI](_u2_legacy/SESION_U2_S3_P1_MODELO_SEMANTICO_POWER_BI.md) | Crear relaciones, cardinalidades y jerarquias |
| [U2 S3 P2 - Medidas DAX y agregaciones](_u2_legacy/SESION_U2_S3_P2_MEDIDAS_DAX_Y_AGREGACIONES.md) | Implementar medidas BI y validar agregaciones |

### 3.1 Conectar Power BI

**Producto del paso:** tablas `marts` importadas.

Parametros:

```text
Servidor: localhost:55432
Base: farmabi_dw
Schema: marts
```

### 3.2 Definir relaciones

**Producto del paso:** modelo estrella en Power BI.

| Dimension | Hecho | Cardinalidad |
|---|---|---|
| `dim_fecha` | `fact_ventas` | 1:* |
| `dim_producto` | `fact_ventas` | 1:* |
| `dim_cliente` | `fact_ventas` | 1:* |
| `dim_vendedor` | `fact_ventas` | 1:* |
| `dim_estado_pedido` | `fact_ventas` | 1:* |

### 3.3 Crear jerarquias

| Jerarquia | Niveles |
|---|---|
| Calendario | Anio -> Trimestre -> Mes -> Dia |
| Producto | Familia -> Categoria -> Producto |

### 3.4 Crear medidas DAX

Ejemplo:

```DAX
Ventas Netas = SUM(fact_ventas[venta_neta])

Margen Bruto = SUM(fact_ventas[margen_bruto])

% Margen Bruto = DIVIDE([Margen Bruto], [Ventas Netas])
```

### 3.5 Validar SQL vs Power BI

**Producto del paso:** tabla comparativa.

| Metrica | SQL DataMart | Power BI | Coincide |
|---|---:|---:|---|
| Ventas Netas |  |  |  |
| Margen Bruto |  |  |  |
| Pedidos |  |  |  |

## 4. Crea: actividad autonoma

Entrega:

```text
S08_Equipo##_ApellidoNombre.pdf
```

Debe incluir capturas del modelo, relaciones, jerarquias, medidas DAX y validacion SQL vs Power BI.

## 5. Cierre evaluativo

Preguntas:

1. Que diferencia hay entre DataMart fisico y modelo semantico?
2. Por que las dimensiones filtran al hecho?
3. Que medida requiere `DIVIDE`?
4. Como validas una medida DAX contra SQL?
5. Que jerarquias usara el dashboard?
