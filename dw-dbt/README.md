# dw-dbt

Proyecto dbt para transformar `raw` hacia `staging` y `marts`.

## Configuracion clave

- contenedor: `farmabi-dw-dbt`
- proyecto dbt: `farmacia_bi`
- profile: `.dbt/profiles.yml`
- compose: `compose.yml`

## Operacion minima

```powershell
cd dw-dbt
docker compose up -d --build
docker compose ps
```

Ingresar al contenedor:

```powershell
docker exec -it farmabi-dw-dbt bash
```

Dentro del contenedor:

```bash
cd /usr/app/farmacia_bi
dbt debug
dbt run --select staging
dbt run --select +marts
dbt test --select marts
```

## Documentacion

Las guias de clase estan en [`../docs/sesiones/`](../docs/sesiones/).
