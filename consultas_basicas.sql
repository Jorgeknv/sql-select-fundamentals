-- ═════════════════════════════════════════════════════
-- TechStore — Configuración local de la tabla sales
-- Autor: Jorge Navarrete
-- Fecha: 2026-07-10
-- Motor: PostgreSQL
-- Base de datos de práctica: coderhouse_sql
-- Tabla consultada: sales
-- ═════════════════════════════════════════════════════

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
