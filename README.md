# sql-select-fundamentals

# SQL Select Fundamentals — TechStore

## Descripción

Este repositorio contiene una práctica de consultas básicas en PostgreSQL desarrollada para TechStore.

El objetivo es transformar los nombres técnicos de una tabla de ventas en resultados claros para el equipo de finanzas, utilizando:

- `SELECT *` para una exploración inicial.
- Selección de columnas específicas.
- Alias de columnas mediante `AS`.
- Nombres en español con formato `snake_case`.

## Estructura del repositorio

```text
sql-select-fundamentals/
├── consultas_basicas.sql
└── README.md
```

## Tabla utilizada

Las consultas se ejecutan sobre la tabla `sales`, que contiene información de pedidos, clientes, productos, cantidades, precios y montos totales.

El archivo `consultas_basicas.sql` supone que la tabla `sales` ya fue creada y cargada en PostgreSQL con los datos proporcionados en la práctica.

## Consultas desarrolladas

| Consulta   |   Objetivo |
|------------|-----------|
| Consulta 1 | Explorar todas las columnas de la tabla `sales`. |
| Consulta 2 | Mostrar únicamente cliente, producto y monto total. |
| Consulta 3 | Presentar fecha, producto y cantidad con nombres amigables en español. |

## ¿Por qué es mala práctica usar SELECT * en producción?

`SELECT *` solicita todas las columnas disponibles de una tabla, aunque el análisis o reporte solo necesite algunas.

Puede ser una mala práctica en producción por las siguientes razones:

### 1. Rendimiento

Traer columnas innecesarias puede aumentar la cantidad de datos que la base debe leer, procesar y transferir.

Por ejemplo, si un reporte solo necesita `customer_id`, `product_id` y `total_amount`, no tiene sentido devolver también el nombre del producto, la categoría, la cantidad y el precio unitario.

### 2. Mantenibilidad

Una consulta con `SELECT *` depende de todas las columnas que existan en la tabla.

Si más adelante se agregan, eliminan o reorganizan columnas, el resultado del proceso puede cambiar inesperadamente. En cambio, una consulta que enumera sus columnas deja claro qué información utiliza realmente.

### 3. Seguridad y exposición de datos

`SELECT *` puede devolver columnas sensibles o innecesarias que el destinatario del reporte no debería recibir.

Seleccionar explícitamente las columnas ayuda a limitar la información expuesta y hace más fácil revisar qué datos se están compartiendo.

`SELECT *` sí puede ser útil durante una exploración inicial o una validación rápida de una tabla pequeña, pero no debería usarse automáticamente en reportes, procesos ETL o consultas permanentes.

## ¿Por qué son importantes los alias para un stakeholder no técnico?

Los nombres físicos de las columnas suelen estar diseñados para desarrolladores y bases de datos, no necesariamente para las personas que consumen un reporte.

Un alias permite mostrar un nombre más claro sin modificar la estructura ni los datos de la tabla.

Por ejemplo:

```sql
select
	total_amount as monto_total
from sales;
```

La columna continúa llamándose `total_amount` dentro de PostgreSQL, pero el resultado se presenta como:

| monto_total |
|---:|
| 2400.00 |
| 140.00 |
| 450.00 |

Para una persona del equipo de finanzas, `monto_total` es más directo y comprensible que `total_amount`.

## Herramientas utilizadas

- PostgreSQL
- DBeaver
- SQL
- GitHub

## Autor

Jorge Navarrete
