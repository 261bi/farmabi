# ingesta-debezium

Modulo CDC con Debezium, Kafka y Kafka Connect para replicar cambios desde MySQL hacia PostgreSQL.

## Servicios

| Servicio | Contenedor | Puerto host |
|---|---|---|
| Zookeeper | `farmabi-debezium-zookeeper` | `52181` |
| Kafka | `farmabi-debezium-kafka` | `59092` |
| Kafka UI | `farmabi-debezium-kafka-ui` | `58085` |
| Kafka Connect | `farmabi-debezium-connect` | `58083` |

## Prerequisitos

- `oltp-mysql/` levantado
- `dw-pg/` levantado
- Red `farmabi-net` creada

## Operacion minima

```powershell
cd ingesta-debezium
docker compose up -d
docker compose ps
```

Esperar ~30-60s a que Zookeeper, Kafka y Kafka Connect terminen de iniciar. Luego registrar conectores:

### Opcion 1: Un solo comando (ambos conectores)

Este script ejecuta internamente `register-source.ps1` y `register-sink.ps1`.

```powershell
.\scripts\register-connectors.ps1
```

### Opcion 2: Paso a paso (para enseñanza)

```powershell
.\scripts\register-source.ps1
# verificar que el source quedo activo
Invoke-RestMethod http://localhost:58083/connectors/mysql-farma-oltp-source/status

.\scripts\register-sink.ps1
# verificar que el sink quedo activo
Invoke-RestMethod http://localhost:58083/connectors/postgres-cdc-sink/status
```

## Verificacion rapida

```powershell
# Estado de conectores
Invoke-RestMethod http://localhost:58083/connectors
Invoke-RestMethod http://localhost:58083/connectors/mysql-farma-oltp-source/status
Invoke-RestMethod http://localhost:58083/connectors/postgres-cdc-sink/status

# Kafka UI
start http://localhost:58085
```

## Documentacion

- Guia de clase: [`../docs/sesiones/SESION_U2_S2_P4_CDC_CARGA_INCREMENTAL_Y_SCD.md`](../docs/sesiones/SESION_U2_S2_P4_CDC_CARGA_INCREMENTAL_Y_SCD.md)
- Detalle del modulo: [`../docs/guias/ingesta-debezium-detalle.md`](../docs/guias/ingesta-debezium-detalle.md)
