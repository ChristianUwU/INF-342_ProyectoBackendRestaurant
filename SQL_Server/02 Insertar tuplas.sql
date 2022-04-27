USE RESTAURANTE;
---------------Insertar Tuplas---------------
---------------Cliente---------------
insert into Cliente values(1,'Nicolas Coronado',3425463,'Zona Villa Union');
insert into Cliente values(2,'Hubert Sologuren',78195145,'Zona Parque Industrial');
insert into Cliente values(3,'Daniel Toledo',3645900,'Zona Banzer');

---------------Tipo---------------
insert into Tipo values(1,'Chancho al palo');
insert into Tipo values(2,'Keperi');
insert into Tipo values(3,'Pique Macho');
insert into Tipo values(4,'Chicharron');
insert into Tipo values(5,'Sopa de mani');
insert into Tipo values(6,'Soda');
insert into Tipo values(7,'Agua');
insert into Tipo values(8,'Refresco');

---------------Menu Comidas---------------
insert into Producto values(1,'Personal',1,9,5,'Disponible');
insert into Producto values(2,'Extra Grande',1,11,5,'Disponible');
insert into Producto values(3,'Espresso cortado',1,10,5,'Disponible');
insert into Producto values(4,'Americano',1,11,5,'Disponible');
insert into Producto values(5,'Americano cortado',1,12,5,'Disponible');
insert into Producto values(6,'Capuccino',1,12,5,'Disponible');
insert into Producto values(7,'Capuccino Republica',1,15,5,'Disponible');
insert into Producto values(8,'Cafe latte',1,12,5,'Disponible');
insert into Producto values(9,'Cafe latte con escencia',1,15,5,'Disponible');
insert into Producto values(10,'Cafe bombon',1,15,5,'Disponible');
insert into Producto values(11,'Mocaccino',1,12,5,'Disponible');
insert into Producto values(12,'Frapuccino',1,18,5,'Disponible');
insert into Producto values(13,'Cafe Irlandes',1,30,5,'Disponible');

---------------Menu Bebidas---------------
insert into Producto values(14,'Te clasico',2,8,5,'Disponible');
insert into Producto values(15,'Te clasico helado',2,10,5,'Disponible');
insert into Producto values(16,'Lady Grey Tea',2,10,5,'Disponible');
insert into Producto values(17,'Irish Beakfast Tea',2,10,5,'Disponible');
insert into Producto values(18,'English Breakfast Tea',2,10,5,'Disponible');
insert into Producto values(19,'Earl Grey Tea',2,10,5,'Disponible');
insert into Producto values(20,'Naranja y Canela Picante',2,10,5,'Disponible');

---------------Turno---------------
insert into Turno values(1,'Mañana','09:00','17:00');
insert into Turno values(2,'Noche','17:00','01:00');
insert into Turno values(3,'Mañana - Noche','09:00','01:00');

---------------Ambiente---------------
insert into Ambiente values(1,'Abierto',100,'D');
insert into Ambiente values(2,'Cerrado',50,'D');

---------------Mesa---------------
insert into Mesa values(1,4,'D',1);
insert into Mesa values(2,4,'D',2);
insert into Mesa values(3,4,'D',1);
insert into Mesa values(4,4,'O',1);
insert into Mesa values(5,4,'D',2);
insert into Mesa values(6,4,'D',2);
insert into Mesa values(7,4,'D',1);
insert into Mesa values(8,4,'O',2);
insert into Mesa values(9,5,'O',1);
insert into Mesa values(10,5,'D',2);

---------------Reserva---------------
insert into Reserva values(1,1,4,'10:15','02/10/2013','Activo');
insert into Reserva values(2,2,2,'11:15','01/10/2013','Activo');
insert into Reserva values(3,2,3,'20:15','03/10/2013','Activo');

---------------Reservar---------------
insert into Reservar values(1,1);
insert into Reservar values(2,3);
insert into Reservar values(3,5);

---------------Empleado---------------
insert into empleado values(001,5012369,'Rodolfo','Bossoe Macias','m','22/07/1968','Zona Norte',75027015,'12/09/2012','Administrador',3,'Activo');
insert into empleado values(002,9623145,'Rosario','Aguirrez Ferreira','f','04/03/1985','Zona Arenales',77098311,'12/09/2012','Cajera',2,'Activo');
insert into empleado values(003,7125626,'Jessica','Melgar Flores','f','22/07/1980','Zona Los Mangales',3649502,'29/09/2012','Cajera',2,'Activo');
insert into empleado values(004,6485912,'Esthepheanie','Fernandez Moreno','f','8/08/1980','Zona Villa 1er Mayo',3817503,'12/09/2012','Cheff',3,'Activo');
insert into empleado values(005,9512341,'Pedro Ariel','Rodas Macias','m','21/09/91','Zona Los Penocos',78522790,'10/02/2013','Jefe de cocina',1,'Activo');
insert into empleado values(006,5648973,'Celim','Fulguera Rios','m','27/05/1982','Zona Estacion Argentina',3496570,'12/09/2012','Jefe de cocina',2,'Activo');
insert into empleado values(007,6123487,'Wilber','Crespo Velasquez','m','29/04/1990','Zona Plan 3000',76611157,'12/09/2012','Ayudante',1,'Activo');
insert into empleado values(008,6848935,'Bladimir','Lopez Condorena','m','20/07/1992','Zona La Ramada',3647894,'06/01/2013','Ayudante',2,'Activo');
insert into empleado values(009,7648213,'Joel','Arauz Otterburg','m','9/07/1991','Zona San Aurelio',77046852,'06/01/2013','Ayudante',1,'Activo');
insert into empleado values(010,5145677,'Tania','Rodriguez Cruz','f','9/09/1990','Zona El trompillo',76075141,'07/03/2013','Ayudante',2,'Activo');
insert into empleado values(011,5069321,'Cinthia', 'Avalos Vaca','f','29/06/1985','Zona Barrio Primavera',3957412,'12/09/2012','Jefe de Garzon',1,'Activo');
insert into empleado values(012,8789517,'Javier', 'Laime Zambrana','m','06/04/1987','Zona 24 Septiembre',708596032,'17/10/2012','Jefe de Garzon',2,'Activo');
insert into empleado values(013,9745633,'Jorge', 'Alvarez Mendoza','m','01/05/1990','Zona Plan 3000',3945863,'10/02/2013','Garzon',1,'Activo');
insert into empleado values(014,7998054,'Eduardo', 'Claros Segovia','m','21/06/1991','Zona Norte',3695895,'06/01/2013','Garzon',1,'Activo');

---------------Asignar---------------
insert into Asignar values(1,013);
insert into Asignar values(2,013);
insert into Asignar values(3,013);
insert into Asignar values(4,013);
insert into Asignar values(5,013);
insert into Asignar values(6,014);
insert into Asignar values(7,014);
insert into Asignar values(8,014);
insert into Asignar values(9,014);
insert into Asignar values(10,014);

---------------Usuario---------------
insert into Usuario values('Administrador General','admin123',001);
insert into Usuario values('Cajera 01','contra456',002);
insert into Usuario values('Cajera 02','contra789',003);

---------------Recibo---------------
insert into Recibo values(1,1,'01/08/2013',0,2,'Cajera 01','Sin Pagar');
insert into Recibo values(2,2,'01/08/2013',0,4,'Cajera 01','Sin Pagar');
insert into Recibo values(3,3,'01/08/2013',0,6,'Cajera 01','Sin Pagar');
insert into Recibo values(4,3,'02/08/2013',0,7,'Cajera 01','Sin Pagar');
insert into Recibo values(5,2,'02/08/2013',0,8,'Cajera 02','Sin Pagar');
insert into Recibo values(6,1,'03/08/2013',0,9,'Cajera 02','Sin Pagar');
insert into Recibo values(7,3,'04/08/2013',0,10,'Cajera 02','Sin Pagar');

---------------Pedido---------------
insert into Pedido values(1,0,1);
insert into Pedido values(2,0,2);
insert into Pedido values(3,0,3);
insert into Pedido values(4,0,4);
insert into Pedido values(5,0,5);
insert into Pedido values(6,0,6);
insert into Pedido values(7,0,7);

---------------Contiene---------------
insert into Contiene values(1,67);
insert into Contiene values(1,68);
insert into Contiene values(1,50);
insert into Contiene values(2,66);
insert into Contiene values(2,67);
insert into Contiene values(3,12);
insert into Contiene values(3,11);
insert into Contiene values(4,2);
insert into Contiene values(4,3);
insert into Contiene values(5,3);
insert into Contiene values(6,57);
insert into Contiene values(7,55);
insert into Contiene values(7,65);
insert into Contiene values(7,57);
---------------End---------------
--Update()
--Delete()