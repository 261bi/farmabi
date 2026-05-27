# ingesta-airbyte

Modulo de ingesta con Airbyte para replicar MySQL hacia PostgreSQL `raw`.

## Prerequisitos

- `oltp-mysql/` levantado.
- `dw-pg/` levantado.
- Airbyte local con `abctl`.

## Operacion minima

```powershell
abctl version
abctl local credentials
```

Interfaz esperada:

```text
http://localhost:8010
```

Verificar componentes auxiliares:

```powershell
cd oltp-mysql
docker compose ps

cd ../dw-pg
docker compose ps
```

## Documentacion

La guia de clase esta en [`../docs/sesiones/SESION_U2_S2_P1_AIRBYTE_REPLICA_MYSQL_POSTGRES.md`](../docs/sesiones/SESION_U2_S2_P1_AIRBYTE_REPLICA_MYSQL_POSTGRES.md).
