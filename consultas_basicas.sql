-- ═════════════════════════════════════════════════════
-- TechStore — Configuración local de la tabla sales
-- Autor: Jorge Navarrete
-- Fecha: 2026-07-10
-- Motor: PostgreSQL
-- Base de datos de práctica: coderhouse_sql
-- Tabla consultada: sales
-- ═════════════════════════════════════════════════════

-- Eliminamos la tabla únicamente para que el script pueda
-- volver a ejecutarse sin generar un error por tabla duplicada.

drop table if exists sales;

-- Creamos la tabla plana proporcionada por la práctica.
-- Esta tabla se utilizará únicamente para ejercitar consultas SELECT.

create table sales (
	order_id int,
	order_date date,
	customer_id int,
	product_id int,
	product_name varchar(100),
	category varchar(50),
	quantity int,
	unit_price decimal(10,2),
	total_amount decimal(10,2)
);

-- Cargamos los diez registros de prueba.
-- Se especifican las columnas para que el INSERT sea más claro
-- y no dependa implícitamente del orden físico de la tabla.

insert into sales (
	order_id,
	order_date,
	customer_id,
	product_id,
	product_name,
	category,
	quantity,
	unit_price,
	total_amount
)
values
	(1001, '2024-01-05', 201, 301, 'Laptop Pro 15', 'Computación', 2, 1200.00, 2400.00),
	(1002, '2024-01-08', 202, 302, 'Mouse Inalámbrico', 'Accesorios', 5, 28.00, 140.00),
	(1003, '2024-01-12', 203, 303, 'Monitor 4K 27"', 'Computación', 1, 450.00, 450.00),
	(1004, '2024-01-15', 201, 304, 'Teclado Mecánico', 'Accesorios', 3, 95.00, 285.00),
	(1005, '2024-02-03', 204, 305, 'Auriculares BT Pro', 'Audio', 2, 120.00, 240.00),
	(1006, '2024-02-10', 202, 301, 'Laptop Pro 15', 'Computación', 1, 1200.00, 1200.00),
	(1007, '2024-02-18', 205, 306, 'SSD Externo 1TB', 'Almacenamiento', 3, 130.00, 390.00),
	(1008, '2024-03-05', 203, 302, 'Mouse Inalámbrico', 'Accesorios', 8, 28.00, 224.00),
	(1009, '2024-03-12', 204, 303, 'Monitor 4K 27"', 'Computación', 2, 450.00, 900.00),
	(1010, '2024-03-20', 205, 304, 'Teclado Mecánico', 'Accesorios', 4, 95.00, 380.00);

-- Validación de la carga.
-- El resultado esperado es 10.

select count(*) as cantidad_registros
from sales;

-- ══════════════════════════════════════════
-- Consulta 1: Exploración general
-- ══════════════════════════════════════════

-- SELECT * devuelve todas las columnas de la tabla.
-- Es útil durante una exploración inicial para conocer rápidamente
-- la estructura y el contenido de una tabla pequeña.
--
-- No se recomienda como práctica habitual en producción porque puede
-- devolver columnas innecesarias, aumentar el volumen de datos procesados,
-- exponer información que el reporte no necesita y hacer que la consulta
-- sea menos mantenible si la estructura de la tabla cambia.

select *
from sales;

-- ══════════════════════════════════════════
-- Consulta 2: Columnas específicas para finanzas
-- ══════════════════════════════════════════

-- El equipo de finanzas solo necesita identificar al cliente,
-- el producto y el monto total de cada operación.
-- Por eso seleccionamos únicamente las columnas necesarias.

select
	customer_id,
	product_id,
	total_amount
from sales;

-- ══════════════════════════════════════════
-- Consulta 3: Alias amigables en español
-- ══════════════════════════════════════════

-- AS asigna un encabezado temporal más fácil de interpretar.
-- Los alias cambian la presentación del resultado, pero no modifican
-- los nombres reales ni los datos almacenados en la tabla.

select
	order_date as fecha_pedido,
	product_name as nombre_producto,
	quantity as cantidad_unidades
from sales;
