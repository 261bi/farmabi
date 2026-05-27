# ingesta-debezium

Modulo CDC con Debezium, Kafka y Kafka Connect para replicar cambios desde MySQL hacia PostgreSQL.

## Configuracion clave

- Kafka UI: `farmabi-debezium-kafka-ui`
- Kafka Connect: `farmabi-debezium-connect`
- puerto Kafka UI: `38085`
- puerto Kafka Connect: `38083`
- compose: `compose.yml`

## Prerequisitos

- `oltp-mysql/` levantado.
- `dw-pg/` levantado.

## Operacion minima

```powershell
cd ingesta-debezium
docker compose up -d
docker compose ps
```

Registrar conectores:

```powershell
.\scripts\register-connectors.ps1
```

Kafka UI:

```text
http://localhost:38085
```

## Documentacion

- Guia de clase: [`../docs/sesiones/SESION_U2_S2_P4_CDC_CARGA_INCREMENTAL_Y_SCD.md`](../docs/sesiones/SESION_U2_S2_P4_CDC_CARGA_INCREMENTAL_Y_SCD.md)
- Detalle historico del modulo: [`../docs/guias/ingesta-debezium-detalle.md`](../docs/guias/ingesta-debezium-detalle.md)
