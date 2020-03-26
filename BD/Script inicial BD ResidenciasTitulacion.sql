create database Residencias_Titulacion;
use Residencias_Titulacion;

Create table estados(
	idEstado int primary key auto_increment,
    estado varchar(50) not null unique
);
Create table municipios(
	idMunicipio int primary key auto_increment,
    municipio varchar(50) not null unique,
    idEstado int not null,
    foreign key (idEstado) references estados(idEstado)
);
create table empresas(
	idEmpresa int(5) primary key,
	nombre varchar (60) not null,
	sector tinyint not null comment '1-Industrial, 2-Servicios, 3-Otro',
    giro tinyint not null comment '1-Público, 2-Privado' ,
	rfc char (13) not null,
	domicilio varchar(60) not null,
	colonia varchar(40) not null,
	cp int not null,
	fax int not null,
	idMunicipio int not null,
	telefono int not null,
	mision text not null,
	nombreTitular varchar (60) not null,
	puestoTitular varchar (50) not null,
    foreign key (idMunicipio) references municipios(idMunicipio)
);

create table carreras(
	idCarrera int primary key auto_increment,
	carrera varchar (50) not null,
    coordinador varchar(60) not null
);

create table alumnos(
	noControl char (9) primary key not null,
    nombre varchar (30) not null,
	idCarrera int not null,
    idMunicipio int not null,
	domicilio varchar(80) not null,
	email varchar (60) not null,
	tipoSeguro tinyint not null comment '1-IMSS, 2-ISSSTE, 3-OTROS',
	noSeguro int not null,
	telefono int not null,
    foreign key (idMunicipio) references municipios(idMunicipio),
    foreign key (idCarrera) references carreras(idCarrera)
);

create table proyecto(
	idProyecto int primary key auto_increment,
    noControl char(9) not null,
	nombre varchar (50) not null,
	opcion tinyint not null comment '1-Banco de proyetcos, 2-Propuesta propia, 3-Trabajador',
	periodo varchar (21) not null, 
	nombreAsesor varchar (60) not null,
	puestoAsesor varchar (50) not null,
	nombreEncargado varchar (60) not null,
	puestoEncargado varchar (50) not null,
    fechaSolicitud date not null,
    idEmpresa int not null,
    foreign key (noControl) references alumnos(noControl),
    foreign key (idEmpresa) references empresas(idEmpresa)
);

insert into estados values
(1,'Aguascalientes'),
(2,'Baja California'),
(3,'Baja California Sur'),
(4,'Campeche'),
(5,'Coahuila de Zaragoza'),
(6,'Colima'),
(7,'Chiapas'),
(8,'Chihuahua'),
(9,'Distrito Federal'),
(10,'Durango'),
(11,'Guanajuato'),
(12,'Guerrero'),
(13,'Hidalgo'),
(14,'Jalisco'),
(15,'México'),
(16,'Michoacán de Ocampo'),
(17,'Morelos'),
(18,'Nayarit'),
(19,'Nuevo León'),
(20,'Oaxaca'),
(21,'Puebla'),
(22,'Querétaro'),
(23,'Quintana Roo'),
(24,'San Luis Potosí'),
(25,'Sinaloa'),
(26,'Sonora'),
(27,'Tabasco'),
(28,'Tamaulipas'),
(29,'Tlaxcala'),
(30,'Veracruz de Ignacio de la Llave'),
(31,'Yucatán'),
(32,'Zacatecas');

insert into municipios (idestado, municipio) values
(11,'Abasolo'),
(11,'Acámbaro'),
(11,'Apaseo el Alto'),
(11,'Apaseo el Grande'),
(11,'Atarjea'),
(11,'Celaya'),
(11,'Comonfort'),
(11,'Coroneo'),
(11,'Cortazar'),
(11,'Cuerámaro'),
(11,'Doctor Mora'),
(11,'Dolores Hidalgo Cuna de la Independencia Nacional'),
(11,'Guanajuato'),
(11,'Huanímaro'),
(11,'Irapuato'),
(11,'Jaral del Progreso'),
(11,'Jerécuaro'),
(11,'León'),
(11,'Manuel Doblado'),
(11,'Moroleón'),
(11,'Ocampo'),
(11,'Pénjamo'),
(11,'Pueblo Nuevo'),
(11,'Purísima del Rincón'),
(11,'Romita'),
(11,'Salamanca'),
(11,'Salvatierra'),
(11,'San Diego de la Unión'),
(11,'San Felipe'),
(11,'San Francisco del Rincón'),
(11,'San José Iturbide'),
(11,'San Luis de la Paz'),
(11,'San Miguel de Allende'),
(11,'Santa Catarina'),
(11,'Santa Cruz de Juventino Rosas'),
(11,'Santiago Maravatío'),
(11,'Silao de la Victoria'),
(11,'Tarandacuao'),
(11,'Tarimoro'),
(11,'Tierra Blanca'),
(11,'Uriangato'),
(11,'Valle de Santiago'),
(11,'Victoria'),
(11,'Villagrán'),
(11,'Xichú'),
(11,'Yuriria');
