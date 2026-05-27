# oltp-mysql

Origen transaccional MySQL del proyecto `farmabi`.

## Configuracion clave

- contenedor: `farmabi-oltp-mysql`
- puerto host: `53306`
- base: `farma_oltp_db`
- usuario root: `root`
- password root: `root`
- compose: `compose.yml`

## Operacion minima

```powershell
cd oltp-mysql
docker compose up -d
docker compose ps
```

Acceso opcional:

```powershell
docker exec -it farmabi-oltp-mysql mysql -uroot -proot farma_oltp_db
```

## Documentacion

Las guias de clase estan en [`../docs/sesiones/`](../docs/sesiones/).
