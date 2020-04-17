create database LabFM;
use  LabFM;

create table Clientes(
Tarjeta_C int primary key auto_increment,
Nombre_C varchar(60) not null,
Dpi_C int not null,
Tel_C int not null,
Direccion_C varchar(60) not null,
Correo_C varchar(60) not null,
Mora_Acum decimal(10,2) not null,
Renta_Acum decimal(10,2) not null,
Bonos_Acum int not null
)engine=innodb;

insert into Clientes values(0,"Ashly Barrios",283472994,23348585,"Zona 1","ranbr@gmail.com",0,0,0);
insert into Clientes values(0,"Javier Torres",283272994,8392493,"Zona 5","dsf@gmail.com",0,0,0);
insert into Clientes values(0,"Sandra Perez",283473494,98348934,"Zona 13","iewwo@gmail.com",0,0,0);

create table Tipo_A(
CTipo_A int primary key auto_increment,
Nombre varchar(60) not null
)engine=innodb;

insert into Tipo_A values(0,"Pelicula");
insert into Tipo_A values(0,"Video Juego");


create table Genero_A(
CGenero_A int primary key auto_increment,
Nombre_A varchar(60) not null,
CTipo_A int not null,

foreign key (CTipo_A) references
Tipo_A(CTipo_A)
)engine=innodb;

insert into Genero_A values(0,"Accion",1);
insert into Genero_A values(0,"Aventura",1);
insert into Genero_A values(0,"suspenso",1);
insert into Genero_A values(0,"Terror",1);
insert into Genero_A values(0,"Romantico",1);
insert into Genero_A values(0,"Familiar",1);
insert into Genero_A values(0,"Ciencia Ficcion",1);
insert into Genero_A values(0,"Cocina",2);
insert into Genero_A values(0,"Documental",1);
insert into Genero_A values(0,"Memoria",2);
insert into Genero_A values(0,"Accion",2);
insert into Genero_A values(0,"Aventura",2);
insert into Genero_A values(0,"Ciencia Ficcion",2);
insert into Genero_A values(0,"Vestir",2);



create table Clas_A(
CClas_A int primary key auto_increment,
Nombre_A varchar(60) not null,
CTipo_A int not null,
foreign key (CTipo_A) references
Tipo_A(CTipo_A)
)engine=innodb;

insert into Clas_A values(0,"AA",1);
insert into Clas_A values(0,"A",1);
insert into Clas_A values(0,"B",1);
insert into Clas_A values(0,"C",1);
insert into Clas_A values(0,"D",1);
insert into Clas_A values(0,"EC",2);
insert into Clas_A values(0,"T",2);
insert into Clas_A values(0,"M",2);
insert into Clas_A values(0,"AO",2);
insert into Clas_A values(0,"E +10",2);
insert into Clas_A values(0,"E",2);

select Nombre_A , CClas_A from Clas_A where CTipo_A=1;

create table Tiendas(
Codigo_T int primary key auto_increment,
Nombre_T varchar(60) not null,
Ubicacion_T varchar(60) not null,
Estado varchar(1) not null
)engine=Innodb;

insert into Tiendas values(0,"Majadas","Periferico","A");
insert into Tiendas values(0,"Metronorte","zona 17","A");
insert into Tiendas values(0,"Cayala","Paseo Cayala","C");
insert into Tiendas values(0,"Naranjo","Zona 7","A");
insert into Tiendas values(0,"CentraNorte","Ruta al Atlantico","C");

create table Empleados(
Codigo_E int primary key auto_increment,
Codigo_T int not null,
Nombre_E varchar(60) not null,
Estado_E varchar(1) not null,

foreign key (Codigo_T) references
Tiendas(Codigo_T)
)Engine=Innodb;

insert into Empleados values(0,1,"Daniel Garcia","A");
insert into Empleados values(0,1,"Ashly Barrios","A");
insert into Empleados values(0,3,"Heidy Queme","A");
insert into Empleados values(0,4,"Kevin Flores","A");

create table Articulos(
Codigo_A int primary key auto_increment,
Nombre_A varchar(60) not null,
Autor_A varchar(60) not null,
CGenero_A int not null,
Clasificacion_A int not null,
Duracion_A int ,
Precio_A decimal(10,2) not null,
Existencia int not null,
CTipo_A int not null,
Tienda int not null,

foreign key (CTipo_A) references
Tipo_A(CTipo_A),
foreign key (CGenero_A) references
Genero_A(CGenero_A),
foreign key (Clasificacion_A) references
Clas_A(CClas_A),
foreign key (Tienda) references
Tiendas(Codigo_T)
)engine=innodb;

insert into Articulos values(0,"league of legends","Riot Games",11,3,3,15.00,1000,2,2);
insert into Articulos values(0,"PUBG","Tencent Games",10,4,4,20.00,20,2,4);
insert into Articulos values(0,"Liga de la justicia","DC comics",1,3,12,15.00,1000,1,1);


create table Rentas(
Codigo_R int primary key auto_increment,
Codigo_T int not null,
Tarjeta_C int not null,
Codigo_A int not null,
Cantidad_A int not null,
Total_R decimal(10,2) not null,
Mora decimal(10,2) not null,
Fecha_Inico datetime not null,
Fecha_Vencimiento datetime not null,

foreign key (Tarjeta_C) references
Clientes(Tarjeta_C),
foreign key (Codigo_A) references
Articulos(Codigo_A),
foreign key (Codigo_T) references
Tiendas(Codigo_T)
)engine=Innodb;

create table Devoluciones(
Codigo_D int primary key,
Codigo_R int not null,
Fecha_D datetime not null,

foreign key (Codigo_R) references
Rentas(Codigo_R)
)engine=Innodb;

select * from Articulos where Codigo_A = "7" and CTipo_A="2";
select * from clientes;
select * from empleados;
select * from articulos;
select * from tiendas;
select * from rentas;
select * from tipo_a;
select * from Clas_A;
select * from Genero_A;


drop database LabFM;