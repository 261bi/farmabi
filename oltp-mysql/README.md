# oltp-mysql

Origen transaccional MySQL del proyecto `farmabi`.

## Configuracion clave

- contenedor: `farmabi-oltp-mysql`
- puerto host: `13306`
- base: `farmadb`
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
docker exec -it farmabi-oltp-mysql mysql -uroot -proot farmadb
```

## Documentacion

Las guias de clase estan en [`../docs/sesiones/`](../docs/sesiones/).
