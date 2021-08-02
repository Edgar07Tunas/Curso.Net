USE InstitutoTich
 
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (1, N'PTO       ', N'Prospecto')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (2, N'PRO       ', N'En curso propedéutico')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (3, N'CAP       ', N'En capacitación')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (4, N'INC       ', N'En Incursión')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (5, N'LAB       ', N'Laborando')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (6, N'LIB       ', N'Liberado')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (7, N'NI        ', N'No le interesó')
INSERT into [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (8, N'BA        ', N'Baja')

select * from estatusAlumnos;

INSERT [dbo].[estados] ([id], [nombre]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (2, N'Baja California')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (4, N'Campeche')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (5, N'Chihuahua')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (6, N'Chiapas')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (7, N'Coahuila')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (8, N'Colima')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (9, N'Durango')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (10, N'Guanajuato')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (11, N'Guerrero')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (12, N'Hidalgo')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (13, N'Jalisco')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (14, N'México')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (15, N'Michoacán')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (16, N'Morelos')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (17, N'Nayarit')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (18, N'Nuevo León')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (19, N'Oaxaca')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (20, N'Puebla')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (21, N'Querétaro')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (22, N'Quintana Roo')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (23, N'San Luis Potosí')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (24, N'Sinaloa')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (25, N'Sonora')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (26, N'Tabasco')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (27, N'Tamaulipas')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (28, N'Tlaxcala')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (29, N'Veracruz')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (30, N'Yucatán')
INSERT [dbo].[estados] ([id], [nombre]) VALUES (31, N'Zacatecas')

select *  from estados;

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('edgar','avecilla','martinez','edgarmartinez0704@gmail.com','7721055595','1998-04-07','1234567887654321',1,1);

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('brayan alejandro','garcia','perez','brayan@gmail.com','7721055594','1998-05-23','1234567887654321',2,2);

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('sergio','hernandez','mendoza','sergio@gmail.com','7721055599','1998-02-14','1234567887654321',3,3);

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('dafne','garcia','lorenzo','dafne@gmail.com','7721055545','2001-08-07','1234567887654321',4,4);

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('yadira','cruz','peres','yadira@gmail.com','7721055530','1996-09-21','1234567887654321',5,5);

insert into alumnos (nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,idEstadoOrigen,idEstatus)
values ('yesica','ventura','pantoja','yesica@gmail.com','7721205589','1997-11-08','1234567887654321',6,6);

select * from alumnos;

insert into instructores(nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,rfc,curp,cuotaHora,activo)
values ('jorge', 'valdivia', 'rosas','jorge@gmail.com','7721298769','1876-07-06','q1w2e3r4t5y6u','1234567887456123','850.50',1);

insert into instructores(nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,rfc,curp,cuotaHora,activo)
values ('luis', 'vasquez', 'cruz','luis@gmail.com','7721298768','1876-11-16','q1w2e3r4t5y6u','1234567887456123','950.50',1);

insert into instructores(nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,rfc,curp,cuotaHora,activo)
values ('oscar', 'lopez', 'osonio','oscar@gmail.com','7721298765','1987-08-30','q1w2e3r4t5y6u','1234567887456123','555.50',1);

insert into instructores(nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,rfc,curp,cuotaHora,activo)
values ('jose', 'morales', 'reyes','jose@gmail.com','7721298762','1966-09-13','q1w2e3r4t5y6u','1234567887456123','900.50',1);

select * from instructores;

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('net01','.Net Junior', 'aprende a desarrollar aplicaciones web a nivel junior',160,null,1);

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('net02','.Net medio', 'aprende a desarrollar aplicaciones web a nivel medio',160,2,1);

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('java01','java Junior', 'aprende a desarrollar aplicaciones con java a nivel junior',160,null,1);

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('java02','java medio', 'aprende a desarrollar aplicaciones con java a nivel medio',160,4,1);

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('java03','java senior', 'aprende a desarrollar aplicaciones con jave a nivel senior',160,5,1);

insert into catCursos(clave,nombre,descripcion,horas,idPreRequisito,activo)
values('React01','React Junior', 'aprende a desarrollar fron endt web con rwact a nivel junior',160,null,1);

select * from  catCursos;

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(2,'2020-01-15','2020-03-15',1);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(2,'2019-09-15','2019-12-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(3,'2020-02-15','2020-04-15',1);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(3,'2020-03-15','2020-05-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(4,'2020-01-15','2020-03-15',1);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(4,'2020-02-15','2020-04-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(5,'2020-02-15','2020-04-15',1);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(5,'2020-03-15','2020-05-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(6,'2020-04-15','2020-06-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(6,'2020-05-15','2020-07-15',0);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(7,'2020-01-15','2020-03-15',1);

insert into cursos(idCatCurso,fechainicio,fechatermino,activo)
values(2,'2020-02-15','2020-04-15',0);


select * from cursos;

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(2,1,'2020-01-15','2020-03-15',8);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(5,1,'2020-03-15','2020-05-15',10);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(2,2,'2020-01-15','2020-03-15',9);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(5,2,'2020-03-15','2020-05-15',8);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(10,3,'2020-04-15','2020-06-15',8);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(1,4,'2020-01-15','2020-03-15',10);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(2,5,'2020-01-15','2020-03-15',9);

insert into cursosAlumnos(idCurso,idAlumno,fechaInscripcion,fechaBaja,calificaciones)
values(1,6,'2020-01-15','2020-03-15',8);

select * from cursosAlumnos;

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(1,1,'2020-01-15');

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(3,1,'2019-09-15');

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(1,2,'2020-01-15');

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(4,2,'2020-02-15');

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(5,3,'2020-03-15');

insert into cursosInstructores(idCurso,idInstructor,fechaContratacion)
values(7,1,'2020-02-15');

select * from cursosInstructores;
