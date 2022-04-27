CREATE DATABASE RESTAURANTE;
USE RESTAURANTE;

	----------- ROLES -----------
	CREATE TABLE "ROLES"
	(
	ID_ROLES int NOT NULL Primary Key,
	ROLES varchar(25) NOT NULL
	);


	---------- USUARIO -----------
	CREATE TABLE USUARIO
	(
	Id_Usuario int NOT NULL Primary Key,
	User_Name varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	IdRoles int NOT NULL,
	foreign Key (IdRoles) references ROLES (Id_Roles)
	);

	insert into Usuario values('Administrador General','admin123',001);
	insert into Usuario values('Cajera 01','contra456',002);
	insert into Usuario values('Cajera 02','contra789',003);

	---------- CLIENTE ----------------
	CREATE TABLE CLIENTE
	(
	Id_Cliente int NOT NULL Primary Key,
	Nombre varchar(50) NOT NULL,
	Telefono varchar(15),
	E_mail varchar(50),
	IdUsuario int not null,
	foreign Key (IdUsuario) references Usuario (Id_Usuario)
	);

	-------------- RESERVA ---------------
	CREATE TABLE RESERVA
	(
	Id_Reserva int NOT NULL Primary Key,
	Fecha_Reserva date,
	Hora_Reserva time(7),
	Num_Persona int,
	Estado char(10),
	IdCliente int NOT NULL,
	foreign Key (IdCliente) references Cliente (Id_Cliente)
	); 


	------------ AREA ------------
	CREATE TABLE AREA
	(
	Id_Area int NOT NULL Primary Key,
	Cantidad_Mesa int,
	Descripcion varchar(50)
	);


	------------- MESA -------------
	CREATE TABLE MESA
	(
	Id_Mesa int NOT NULL Primary Key,
	Capacidad int,
	IdArea int NOT NULL,
	foreign Key (IdArea) references Area (Id_Area),
	); 


	-------------- RESERVAR ----------------
	CREATE TABLE RESERVAR
	(
	IdMesa int NOT NULL ,
	IdReserva int NOT NULL,
	Primary Key (IdMesa, IdReserva),
	foreign Key (IdMesa) references Mesa (Id_Mesa),
	foreign Key (IdReserva) references Reserva (Id_Reserva),
	); 


	--------------- PEDIDO ----------------
	CREATE TABLE PEDIDO
	(
	Id_Pedido int NOT NULL Primary Key,
	IdMesa int NOT NULL,
	foreign Key (IdMesa) references Mesa (Id_Mesa),
	); 


	--------------- RECIBO ---------------------
	CREATE TABLE RECIBO
	(
	Id_Recibo int NOT NULL Primary Key,
	Fecha date,
	Total float,
	IdCliente int NOT NULL,
	IdMesa int NOT NULL,
	IdPedido int NOT NULL,
	foreign Key (IdCliente) references Cliente (Id_Cliente),
	foreign Key (IdMesa) references Mesa (Id_Mesa),
	foreign Key (IdPedido) references Pedido (Id_Pedido),
	); 


	--------------- CANTIDAD PLATO ----------------------
	CREATE TABLE CANTIDAD_PLATO
	(
	Id_Cantidad_Plato int NOT NULL Primary Key,
	Cantidad int
	);


	---------------- TIPO EMPLEADO ---------------------
	CREATE TABLE TIPO_EMPLEADO
	(
	Id_Tipo_Empleado int NOT NULL Primary Key,
	Nombre varchar(50)
	); 


	----------------- EMPLEADO --------------------
	CREATE TABLE EMPLEADO
	(
	Id_Empleado int NOT NULL Primary Key,
	Nombre varchar(50),
	Direccion varchar(50),
	Estado char(10),
	IdUsuario int NOT NULL,
	IdPedido int NOT NULL,
	IdTipoEmpleado int NOT NULL,
	foreign Key (IdUsuario) references Usuario (Id_Usuario),
	foreign Key (IdTipoEmpleado) references Tipo_Empleado(Id_Tipo_Empleado),
	foreign Key (IdPedido) references Pedido (Id_Pedido),
	);


	------------------ TURNO -----------------------
	CREATE TABLE TURNO
	(
	Id_Turno int NOT NULL Primary Key,
	Nombre varchar(50),
	Hora_Llegada time(7),
	Hora_Salida time(7),
	); 


	---------------------- EMPLEADO TURNO -----------------------
	CREATE TABLE EMPLEADO_TURNO
	(
	IdTurno int NOT NULL,
	IdEmpleado int NOT NULL,
	Primary Key (IdTurno, IdEmpleado),
	foreign Key (IdTurno) references Turno (Id_Turno),
	foreign Key (IdEmpleado) references Empleado (Id_Empleado),
	);


	----------------- MODIFICACION -----------------------
	CREATE TABLE MODIFICACION
	(
	Id_Modificacion int NOT NULL Primary Key,
	Detalle varchar(50),
	IdEmpleado int NOT NULL,
	foreign Key (IdEmpleado) references Empleado (Id_Empleado),
	); 


	---------------- PLATO ----------------------
	CREATE TABLE PLATO
	(
	Id_Plato int NOT NULL Primary Key,
	Nombre varchar(50),
	Descripcion varchar(50),
	Precio float,
	Estado char(10),
	IdCantidadPlato int NOT NULL,
	IdModificacion int NOT NULL,
	foreign Key (IdCantidadPlato) references Cantidad_Plato (Id_Cantidad_Plato),
	foreign Key (IdModificacion) references Modificacion (Id_Modificacion),
	); 


	----------------- PEDIDO PLATO ------------------
	CREATE TABLE PEDIDO_PLATO
	(
	IdPedido int NOT NULL ,
	IdPlato int NOT NULL,
	Detalle varchar (50),
	Primary Key (IdPedido, IdPlato),
foreign Key (IdPedido) references Pedido (Id_Pedido),
foreign Key (IdPlato) references Plato (Id_Plato),
); 

----------------- ELIMINAMOS TODA LAS TABLAS ----------------
DROP TABLE ROLES;
DROP TABLE USUARIO;
DROP TABLE CLIENTE;
DROP TABLE RESERVA;
DROP TABLE AREA;
DROP TABLE MESA;
DROP TABLE RESERVAR;
DROP TABLE PEDIDO;
DROP TABLE RECIBO;
DROP TABLE CANTIDAD_PLATO;
DROP TABLE TIPO_EMPLEADO;
DROP TABLE EMPLEADO;
DROP TABLE TURNO;
DROP TABLE EMPLEADO_TURNO;
DROP TABLE MODIFICACION;
DROP TABLE PLATO;
DROP TABLE PEDIDO_PLATO;
DROP DATABASE RESTAURANTE;

