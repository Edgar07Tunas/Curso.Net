create database InstitutoTich;

use InstitutoTich;

create table estados(
	id int primary key not null,
	nombre varchar(100) not null
);

create table estatusAlumnos(
	id smallint primary key not null,
	clave char(10) not null,
	nombre varchar(100) not null
);

create table catCursos(
	id smallint not null primary key identity(1,1),
	clave varchar(15) not null,
	nombre varchar(50) not null,
	descripcion varchar(100),
	horas tinyint not null,
	idPreRequisito smallint,
	activo bit not null
);

create table cursos(
	id smallint not null primary key identity(1,1),
	idCatCurso smallint,
	fechainicio date,
	fechatermino date,
	activo bit
);

create table alumnos(
	id int primary key not null identity(1,1),
	nombre varchar(60) not null,
	primerApellido varchar(50) not null,
	segundoApellido varchar(50),
	correo varchar(80) not null,
	telefono nchar(10) not null,
	fechaNacimiento date not null,
	curp char(18) not null,
	idEstadoOrigen int not null,
	idEstatus smallint not null
);

create table instructores(
	id int primary key not null identity(1,1),
	nombre varchar(60) not null,
	primerApellido varchar(50) not null,
	segundoApellido varchar(50),
	correo varchar(80) not null,
	telefono nchar(10) not null,
	fechaNacimiento date not null,
	rfc char(13) not null,
	curp char(18) not null,
	cuotaHora decimal(9,2) not null,
	activo bit
);
create table cursosAlumnos(
	id int not null primary key identity(1,1),
	idCurso smallint not null,
	idAlumno int not null,
	fechaInscripcion date not null,
	fechaBaja date ,
	calificaciones tinyint
);

create table cursosInstructores(
	id int not null primary key identity(1,1),
	idCurso smallint not null,
	idInstructor int  not null,
	fechaContratacion date
);

create table alumnosBaja(
	id int not null primary key identity(1,1),
	nombre varchar(60) not null,
	primerApellido varchar(50) not null,
	segunbdoApellido varchar(50),
	fechaBaja datetime
);

alter table alumnos
add foreign key(idEstadoOrigen) references estados(id);

alter table alumnos 
add foreign key(idEstatus) references estatusAlumnos(id);

alter table cursosAlumnos
add foreign key(idAlumno) references alumnos(id);

alter table cursosAlumnos
add foreign key(idCurso) references cursos(id);

alter table cursosInstructores
add foreign key(idCurso) references cursos(id);

alter table cursosInstructores
add foreign key(idInstructor) references instructores(id);

alter table cursos
add foreign key(idCatCurso) references catCursos(id);

alter table CatCursos
add foreign key(idPreRequisito) references catCursos(id);