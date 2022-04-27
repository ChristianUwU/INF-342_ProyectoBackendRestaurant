--• Consultas simples
-- 1. Mostrar los datos del personal de cocina

SELECT Empleado.*
FROM Empleado, Tipo_Empleado
WHERE Empleado.Id_Empleado = Tipo_Empleado.Id_Tipo_Empleado AND Tipo_Empleado.Nombre = 'COCINERO';

-- 2. Mostrar los datos del personal de meseros

SELECT Empleado.*
FROM Empleado, Tipo_Empleado
WHERE Empleado.Id_Empleado = Tipo_Empleado.Id_Tipo_Empleado ANDTipo_Empleado.Nombre = 'MESERO';

-- 3. Mostrar los clientes registrados

SELECT *
FROM Cliente;

--• Consultas Múltiples
-- 4. Mostrar los cocineros que trabajan en la mañana

SELECT Empleado.*
FROM Empleado, Empleado_Turno, Tipo_Empleado
WHERE Empleado.IdTipoEmpleado = Tipo_Empleado.Id_Tipo_Empleado AND Tipo_Empleado.Nombre = 'COCINERO' AND
		Empleado.Id_Empleado = Empleado_Turno.IdEmpleado AND Empleado_Turno.IdTurno = 1;

-- 5. Mostrar los cocineros que trabajan en la noche

SELECT Empleado.*
FROM Empleado, Empleado_Turno, Tipo_Empleado
WHERE Empleado.IdTipoEmpleado = Tipo_Empleado.Id_Tipo_Empleado AND Tipo_Empleado.Nombre = 'COCINERO' AND
		Empleado.Id_Empleado = Empleado_Turno.IdEmpleado AND Empleado_Turno.IdTurno = 2;

-- 6. Mostrar los meseros que trabajan en la mañana

SELECT Empleado.*
FROM Empleado, Empleado_Turno, Tipo_Empleado
WHERE Empleado.IdTipoEmpleado = Tipo_Empleado.Id_Tipo_Empleado AND Tipo_Empleado.Nombre = 'MESERO' AND
		Empleado.Id_Empleado = Empleado_Turno.IdEmpleado AND Empleado_Turno.IdTurno = 1;

-- 7. Mostrar los meseros que trabajan en la noche

SELECT Empleado.*
FROM Empleado, Empleado_Turno, Tipo_Empleado
WHERE Empleado.IdTipoEmpleado = Tipo_Empleado.Id_Tipo_Empleado AND Tipo_Empleado.Nombre = 'MESERO' AND
		Empleado.Id_Empleado = Empleado_Turno.IdEmpleado AND Empleado_Turno.IdTurno = 2;

-- 8. Mostrar todos los platos del menu

SELECT *
FROM Plato;

-- 9. Mostrar todos los platos que se encuentran disponibles

SELECT *
FROM Plato
WHERE Estado = 'DISPONIBLE';

-- 10. Mostrar todos los platos que no se encuentran disponibles
SELECT *
FROM Plato
WHERE Estado = 'AGOTADO';


--• Subconsultas
-- 11. Mostrar todas las reservas realizadas para la fecha actual

SELECT *
FROM Reserva
WHERE Fecha_Reserva = GETDATE();

-- 12. Mostrar los platos del menu con sus cantidades

SELECT Plato.*, Cantidad
FROM Plato, Cantidad_Plato
WHERE Plato.IdCantidadPlato=Cantidad_Plato.Id_Cantidad_Plato;

-- 13. Mostrar la cantidad de pedidos realizados

SELECT COUNT(*)
FROM Pedido;

--14. Mostrar todas las mesas que se encuentran disponibles

SELECT *
FROM Mesa
WHERE Estado='DISPONIBLE';

-- 15. Mostrar todas las mesas que se encuentran ocupadas

SELECT *
FROM Mesa
WHERE Estado='OCUPADA';

-- 16. Mostrar el total de ganancias del dia

SELECT SUM(Total)
FROM Recibo
WHERE Fecha=GETDATE();

-- 17. Mostrar los clientes que realizaron una reserva

SELECT Cliente.*
FROM Cliente, Reserva
WHERE Cliente.Id_Cliente=Reserva.IdCliente

-- 18. Mostrar todos los cargos

SELECT *
FROM Tipo_Empleado

-- 19. Mostrar los platos que han sido pedidos alguna vez

SELECT Plato.*
FROM Plato, Pedido_Plato
WHERE Plato.Id_Plato=Pedido_Plato.IdPlato

-- 20. Mostrar los platos que no han sido pedidos ni una vez

SELECT *
FROM Plato
WHERE Id_Plato NOT IN (SELECT IdPlato
						FROM Pedido_Plato);

-- 21.- MOSTRAR LA LISTA DE PRODUCTOS DE LA MESA NRO 6

SELECT P.COD_PRODUCTO, P.NOMBRE
FROM PRODUCTO P
WHERE P.COD_PRODUCTO IN (SELECT PP.COD_PRODUCTO
						FROM PEDIDO_PRODUCTO PP
						WHERE PP.COD_PEDIDO IN (SELECT P.COD_PEDIDO
												FROM PEDIDO P, RECIBO R
												WHERE P.COD_REC= R.COD_RECIBO AND R.COD_MESA = '6'));


-- 22.- MOSTRAR LA LISTA DE MESAS QUE HAYAN ORDENADO PRODUCTO TIPO DE MENU 1

SELECT M.COD_MESA
FROM MESA M
WHERE M.COD_MESA IN (SELECT R.COD_MESA
					FROM RECIBO R
					WHERE R.COD_RECIBO IN ( SELECT P.COD_REC
											FROM PEDIDO P
											WHERE P.COD_PEDIDO IN (SELECT PP.COD_PEDIDO
																	FROM PEDIDO_PRODUCTO PP WHERE PP.COD_PRODUCTO IN (SELECT P.COD_PRODUCTO
																							FROM PRODUCTO P
																							WHERE P.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
																																FROM CATEGORIAPRODUCTO CP
																																WHERE CP.NOMBRE = 'MENU1')))))

-- 23.- MOSTRAR EL NOMBRE DE LOS PRODUCTOS DE TIPO BEBIDA QUE TENGA UN PRECIO MENOR A 50 BS

SELECT PR.NOMBRE, PR.PRECIO
FROM PRODUCTO PR
WHERE PR.PRECIO < 50 AND PR.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
														FROM CATEGORIAPRODUCTO CP
														WHERE CP.NOMBRE = 'BEBIDAS')

-- 24.-MOSTRAR EL NOMBRE COMPLETO DE LOS EMPLEADOS QUE INGRESARON EN EL MES DEL MARZO Y JUNIO

SELECT E.NOMBRE, E.APELLIDO,C.DESCRIPCION
FROM EMPLEADO E, CARGO C
WHERE C.COD_CARGO = E.COD_CARGO AND E.FECHA_INGRESO BETWEEN '2018/03/01' AND '2018/05/31'

-- 25.-MOSTRAR EL NOMBRE DE LOS PRODUCTOS DE TIPO CARNES QUE TENGA UN PRECIO MENOR A 50 BS

SELECT PR.NOMBRE, PR.PRECIO
FROM PRODUCTO PR
WHERE PR.PRECIO < 50 AND PR.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
														FROM CATEGORIAPRODUCTO CP
														WHERE CP.NOMBRE = MENU1);

-- 26.- MOSTRAR EL NOMBRE DE LOS PRODUCTOS DE TIPO GUARNICION QUE TENGA UN PRECIO MENOR A 5 BS

SELECT PR.NOMBRE, PR.PRECIO
FROM PRODUCTO PR
WHERE PR.PRECIO <= 5 AND PR.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
														FROM CATEGORIAPRODUCTO CP
														WHERE CP.NOMBRE = 'GUARNICIONES EXTRAS');

-- 27.- MOSTRAR EL NOMBRE DE LOS PRODUCTOS DE TIPO TRAGOS QUE TENGA UN PRECIO MENOR A 50 BS

SELECT PR.NOMBRE, PR.PRECIO
FROM PRODUCTO PR
WHERE PR.PRECIO <= 50 AND PR.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
														FROM CATEGORIAPRODUCTO CP
														WHERE CP.NOMBRE = 'BEBIDAS');

-- 28.-MOSTRAR EL NOMBRE DE LOS PRODUCTOS DE TIPO JUGOS QUE TENGA UN PRECIO MENOR A 30 BS

SELECT PR.NOMBRE, PR.PRECIO
FROM PRODUCTO PR
WHERE PR.PRECIO <= 30 AND PR.COD_CATEGORIAPRODUCTO IN (SELECT CP.COD_CATEGORIAPRODUCTO
														FROM CATEGORIAPRODUCTO CP
														WHERE CP.NOMBRE = 'JUGO');

-- 29.- MOSTRAR LA SUMA TOTAL DE LOS PRECIOS DEL PRODUCTO DE TIPO DE BEBIDAS

SELECT SUM(PRECIO)
FROM PRODUCTO P
WHERE P.COD_CATEGORIAPRODUCTO = '3';

-- 30.-MOSTRAR LA SUMA TOTAL DE LOS PRECIOS DEL PRODUCTO DE TIPO DE GUARNICION

SELECT SUM(PRECIO)
FROM PRODUCTO P
WHERE P.COD_CATEGORIAPRODUCTO = '2'
