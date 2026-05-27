# dw-pg

PostgreSQL analitico para alojar `raw`, `staging` y `marts` del proyecto `farmabi`.

## Configuracion clave

- contenedor: `farmabi-dw-pg`
- puerto host: `55432`
- base: `farmabi_dw`
- usuario: `postgres`
- password: `postgres`
- compose: `compose.yml`

## Operacion minima

```powershell
cd dw-pg
docker compose up -d
docker compose ps
```

Acceso opcional:

```powershell
docker exec -it farmabi-dw-pg psql -U postgres -d farmabi_dw
```

## Documentacion

Las guias de clase estan en [`../docs/sesiones/`](../docs/sesiones/).
