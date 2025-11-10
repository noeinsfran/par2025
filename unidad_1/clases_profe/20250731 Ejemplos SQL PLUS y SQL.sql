----------------------------
----------SQL PLUS----------
----------------------------

--Comando DESCRIBE
DESC B_AREAS;
DESCRIBE B_AREAS;

--Otros comandos SQL Plus
EDIT / LIST / RUN (/) / EDIT <nombre_fichero.extensión> / SAVE / START / GET /SPOOL / EXIT
SELECT * FROM B_AREAS;

SELECT * FROM B_LOCALIDAD;

SELECT * FROM B_TIPO_CUENTA;
SAVE TIPO_CUENTA.SQL

--Comandos para formatear visualización de datos
SELECT * FROM B_ARTICULOS;
SET LINESIZE 300
SET PAGESIZE 50

--Formato de columnas
COLUMN PRECIO FORMAT 999,999,999
SELECT ID, NOMBRE, PRECIO, PORC_IVA FROM B_ARTICULOS;

COLUMN PORC_IVA FORMAT 990.99
SELECT ID, NOMBRE, PRECIO, PORC_IVA FROM B_ARTICULOS;

COLUMN PORC_IVA CLEAR
SELECT * FROM B_ARTICULOS;

SELECT nombre, apellido
FROM b_empleados;

COLUMN apellido HEADING 'Apellido del empleado' FORMAT A15
SELECT nombre, apellido
FROM b_empleados;

COLUMN apellido

COLUMN apellido CLEAR

--Variables de sustitución
SELECT nombre ||' '|| apellido as Empleado
FROM b_empleados
WHERE cedula = &c;

1234440

SELECT nombre ||' '|| apellido as Empleado
FROM b_empleados
WHERE apellido = '&apellido';

Medina

SELECT nombre ||' '|| apellido as Empleado
FROM b_empleados
WHERE apellido = &apellido;


--DEFINE /UNDEFINE
DEFINE ced_empleado = 200

SELECT cedula, apellido
FROM b_empleados
WHERE cedula = &ced_empleado;

DEFINE ced_empleado = 1234440

SELECT cedula, apellido
FROM b_empleados
WHERE cedula = &ced_empleado;

UNDEFINE ced_empleado
SELECT cedula, apellido
FROM b_empleados
WHERE cedula = &ced_empleado;

-----------------------
----------SQL----------
-----------------------
--Expresiones aritmeticas
SELECT * 
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

SELECT id_articulo, numero_item, cantidad, precio, cantidad*precio
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

--Precedencia de operadores
--Escenario 1
SELECT id_articulo, numero_item, cantidad, precio, precio * cantidad + 100
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

--Escenario 2
SELECT id_articulo, numero_item, cantidad, precio, precio * (cantidad + 100)
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

--Alias de columnas
SELECT id_articulo, numero_item, cantidad, precio, cantidad*precio subtotal
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

SELECT id_articulo, numero_item, cantidad, precio, cantidad*precio "SUB TOTAL"
FROM b_detalle_ventas
WHERE ID_VENTA = 1;

--Operador de concatenación
SELECT cedula, nombre || ' ' ||apellido "Nombre y apellido"
FROM b_empleados;

--Filas duplicadas - DISTINCT
SELECT NOMBRE 
FROM B_EMPLEADOS 
ORDER BY NOMBRE;

SELECT DISTINCT 
NOMBRE 
FROM B_EMPLEADOS 
ORDER BY NOMBRE;

--WHERE
SELECT cedula, nombre, apellido
FROM b_empleados
WHERE cedula_jefe = 952160;

--ORDER BY
SELECT cedula, APELLIDO || ' ' ||NOMBRE "Apellido y nombre"
FROM b_empleados; --SIN ORDEN

SELECT cedula, APELLIDO || ' ' ||NOMBRE "Apellido y nombre"
FROM b_empleados
ORDER BY APELLIDO ASC; --Por defecto el orden es ascendente, independientemente a que se indique explícitamente

SELECT cedula, APELLIDO || ' ' ||NOMBRE "Apellido y nombre"
FROM b_empleados
ORDER BY APELLIDO DESC;

SELECT cedula, APELLIDO || ' ' ||NOMBRE "Apellido y nombre"
FROM b_empleados
ORDER BY "Apellido y nombre" DESC;

--Orden de múltiples columnas
SELECT id, nombre_area 
FROM b_areas 
ORDER BY 2;

SELECT id, nombre_area 
FROM b_areas 
ORDER BY nombre_area, id;

SELECT id, nombre_area 
FROM b_areas 
ORDER BY 2, 1;


--Top N-Filas
SELECT ROWNUM,ID,FECHA,MONTO_TOTAL
FROM B_VENTAS
WHERE ID_CLIENTE=2
AND ROWNUM<=2;

SELECT ROWNUM,ID,FECHA,MONTO_TOTAL
FROM B_VENTAS
WHERE ID_CLIENTE=2
FETCH FIRST 2 ROWS ONLY;

--FETCH FIRST
SELECT ID,FECHA,MONTO_TOTAL
FROM B_VENTAS
WHERE ID_CLIENTE=2
ORDER BY 3 DESC
FETCH FIRST 2 ROWS ONLY;

--Operadores IN y BETWEEN
SELECT DISTINCT cedula, nombre, apellido
FROM b_empleados
WHERE apellido BETWEEN 'Aguayo' and 'Florentin';

SELECT DISTINCT cedula, nombre, apellido
FROM b_empleados
WHERE apellido IN ('Aguayo', 'Balmaceda');

--LIKE / ESCAPE
SELECT nombre ||' '|| apellido as Empleado
FROM b_empleados
WHERE apellido like 'B%'; --Como alternativa al BETWEEN

SELECT nombre ||' '|| apellido as Empleado
FROM b_empleados
WHERE nombre like 'Cint_ia';

/*Recordemos que el "/" se utilizará como comodín para indicar que "_" se utilizará como patrón de búsqueda y no para denotar un caracter */
SELECT nombre ||' '|| apellido Cliente, correo_electronico
FROM b_personas
WHERE correo_electronico like '%\_%' ESCAPE '\'; --Recuperamos todos los registros cuyos mails contengan "_" guión bajo.

--IS NULL
SELECT cedula, nombre ||' '|| apellido Cliente
FROM b_personas
WHERE ruc is null;

--Condiciones múltiples
SELECT codigo_cta, nombre_cta
FROM b_cuentas
WHERE id_tipo=1
AND imputable='S';

SELECT codigo_cta, nombre_cta
FROM b_cuentas
WHERE id_tipo=1
OR imputable='S';
