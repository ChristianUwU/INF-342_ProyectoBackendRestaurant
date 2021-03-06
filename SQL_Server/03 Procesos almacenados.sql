USE RESTAURANTE;

------------------------------FUNCIONES--------------------------------
--1 Funcion que calcula el total a pagar de un pedido
CREATE FUNCTION Calcular_Importe(@id_recibo INT)
RETURNS FLOAT
AS
BEGIN
RETURN (SELECT SUM(Precio)
FROM Plato, Pedido_Plato, Pedido, Recibo
WHERE Pedido.Id_Pedido=Pedido_Plato.IdPedido AND
Plato.Id_Plato=Pedido_Plato.IdPlato AND
 Recibo.IdPedido=Pedido.Id_Pedido AND
 Recibo.Id_Recibo=@id_recibo)
END
--2 DEVOLVER LA DIRECCION DE UN EMPLEADO POR SU CI
CREATE FUNCTION DIRECCION_EMPLEADO(@DIRECCION INT) RETURNS VARCHAR(100) AS
BEGIN
RETURN (SELECT EMPLEADO.DIRECCION FROM EMPLEADO WHERE DIRECCION = @DIRECCION)
END
--3 DEVOLVER EL NOMBRE DE LA FUNCION DE UN CARGO TENIENDO EL ID
CREATE FUNCTION FUNCION_CARGO(@ID INT) RETURNS VARCHAR(50) AS
BEGIN
RETURN (SELECT CARGO.DESCRIPCION FROM CARGO,COMPONE,FUNCION WHERE
CARGO.ID = COMPONE.ID_CARGO AND CARGO.ID = @ID )
END
--4 MOSTRAR EL PRECIO DE UN PRODUCTO CON SU NOMBRE
CREATE FUNCTION MOSTRAR_PRECIO(@NOMBRE VARCHAR(50)) RETURNS FLOAT AS
BEGIN
RETURN( SELECT PRODUCTO.PRECIO FROM PRODUCTO WHERE PRODUCTO.NOMBRE = @NOMBRE)
END
--5 DEVOLVER EL NOMBRE DE UN CLIENTE TENIENDO SU ID
CREATE FUNCTION NOMBRE_CLIENTE(@CODIGO INT) RETURNS INT AS
BEGIN
RETURN (SELECT CLIENTE.NOMBRE FROM CLIENTE WHERE COD_CLIENTE = @CODIGO)
END
--6 DEVOLVER EL NOMBRE DE UN EMPLEADO TENIENDO SU CI
CREATE FUNCTION NOMBRE_EMPLEADO(@CI INT) RETURNS INT AS
BEGIN RETURN (SELECT EMPLEADO.NOMBRE FROM EMPLEADO WHERE CI = @CI)
END
163 | P ? g i n a
SISTEMAS DE INFORMACI?N I
9.3.7. Procedimientos almacenados
------------------------PROCEDIMIENTOS ALMACENADOS------------------------------
--1 Procedimiento para agregar un plato a un pedido
CREATE PROCEDURE Agregar_A_Pedido(@id_pedido INT, @id_plato INT)
AS
INSERT INTO Pedido_Plato VALUES(@id_pedido, @id_plato)
-- 2 PRECIO TOTAL DEL RECIBO
CREATE PROCEDURE PERCIO_TOTAL(@CODIGO INT,@TOTAL FLOAT OUTPUT)AS
SELECT @TOTAL = (R.TOTAL)
FROM RECIBO R
WHERE R.COD_RECIBO = @CODIGO
RETURN
--3 VERIFICA SI HAY CLIENTE CON DICHO CODIGO
--DROP FUNCTION VERIF_CLIENTE;
CREATE FUNCTION VERIF_CLIENTE(@CODIGO INT)
RETURNS BIT
AS BEGIN
RETURN (SELECT ISNULL(COUNT(COD_CLIENTE),0) FROM CLIENTE WHERE
COD_CLIENTE=@CODIGO);
END;
--4 A?ADE UN NUEVO CLIENTE
--DROP INSERTAR_CLIENTE;
CREATE PROCEDURE INSERTAR_CLIENTE(@CODIGO INT,@NOMBRE NVARCHAR(60),@TELEFONO INT,
@DIRECCION NVARCHAR(80))
AS
IF(@CODIGO NOT IN (SELECT COD_CLIENTE FROM CLIENTE))
INSERT INTO CLIENTE VALUES(@CODIGO ,@NOMBRE,@TELEFONO, @DIRECCION);
RETURN;
EXECUTE INSERTAR_CLIENTE 1000,'JUAN MALDONADO PEREZ', 69087450, 'PRIMAVERA'
SELECT *
FROM CLIENTE

9.3.8. Disparadores
--1 Valida si un plato se encuentra disponible para agregarlo al pedido
CREATE TRIGGER Cant_plato
ON Pedido_Plato
FOR INSERT
AS
DECLARE @id_pedido INT, @id_plato INT, @id_cant INT, @cant_plato BIGINT
SELECT @id_pedido=IdPedido, @id_plato=IdPlato FROM INSERTED
IF (@id_pedido NOT IN (SELECT Id_Pedido FROM Pedido))
BEGIN
RAISERROR('El ID de pedido no existe', 16, 1)
ROLLBACK
RETURN
END
SELECT @id_cant=Id_Cantidad_Plato, @cant_plato=Cantidad
FROM Cantidad_Plato, Plato
WHERE Plato.Id_Plato=@id_plato AND
Cantidad_Plato.Id_Cantidad_Plato=Plato.IdCantidadPlato
IF (@cant_plato>1)
UPDATE Cantidad_Plato SET Cantidad=@cant_plato-1 WHERE
Id_Cantidad_Plato=@id_cant
ELSE
IF (@cant_plato=1)
BEGIN
UPDATE Cantidad_Plato SET Cantidad=@cant_plato-1 WHERE
Id_Cantidad_Plato=@id_cant
UPDATE Plato SET Estado='AGOTADO' WHERE IdCantidadPlato=@id_cant
END
ELSE
BEGIN
RAISERROR('El plato se ha agotado', 16, 1)
ROLLBACK
RETURN
END
--2 INSERTAR CLIENTES
CREATE TRIGGER INSERTARCLIENTE
ON CLIENTE
FOR INSERT
AS
PRINT'HA INSERTADO REGISTROS EN LA TABLE CLIENTE'
INSERT INTO CLIENTE VALUES (121212,'MARIO GOMEZ','7888888','LOS PENOCOS');
--3 ACTUALIZAR DATOS DEL CLIENTE
CREATE TRIGGER INSERTAR_CLIENTE1
ON CLIENTE
FOR UPDATE
AS
UPDATE CLIENTE SET NOMBRE = 'SANTIAGO CRUZ' WHERE COD_CLIENTE = 55555
--4 INSERTAR EMPLEADOS
CREATE TRIGGER INSERTAR_EMPLEADO
ON EMPLEADO
FOR INSERT
AS
PRINT'HA INSERTADO REGISTROS EN LA TABLE CLIENTE'
INSERT INTO EMPLEADO VALUES(00010,1001,'FRANKLIN',' PEREZ','M','20/05/1975','AV. LA 
BARRANCA #45',70060063,'04/03/2018',110);
