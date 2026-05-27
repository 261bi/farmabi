# powerbi

Capa de consumo analitico y visualizacion del proyecto `farmabi`.

## Fuente principal

Power BI debe consumir principalmente el modelo estrella final construido en PostgreSQL:

- base: `farmabi_dw`
- schema principal: `marts`

## Contenido esperado

- archivos `.pbix`
- medidas DAX
- capturas o mockups
- documentacion del reporte final

## Validacion minima

Antes de conectar Power BI, valida que en PostgreSQL existan:

```sql
\dt marts.*
select * from marts.fact_ventas limit 20;
```

## Documentacion

Las guias de clase estan en [`../docs/sesiones/`](../docs/sesiones/).
