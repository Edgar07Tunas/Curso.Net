use InstitutoTich;

select * from alumnos;

select 
primerApellido AS 'Apellido Paterno',
segundoApellido AS 'Apellido Materno',
nombre,
telefono,
correo
from alumnos;

select
nombre,
primerApellido as 'Apellido Paterno',
segundoApellido as 'Apellido Marterno',
rfc,
cuotaHora as 'Cuota por Hora'
from instructores;

select
clave,
nombre,
descripcion,
horas
from catCursos;

select * into ejercicio.dbo.alumnos from alumnos;
select * into ejercicio.dbo.instructores from instructores;
select * into ejercicio.dbo.estados from estados;

use ejercicio;

insert into instructores( nombre, primerApellido, segundoApellido, correo, telefono , fechaNacimiento, rfc, curp, cuotaHora, activo)
select nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento,'1234567891234',curp,500.50,1 
from alumnos;

select * from instructores;

select top 5 * from alumnos order by fechaNacimiento desc;

select * from alumnos;


select * from alumnos as Alumnos
inner join estados as Estados
on alumnos.idEstadoOrigen = estados.id;

use InstitutoTich;

select 
	nombre,
	primerApellido AS 'Apellido paterno',
	segundoApellido AS 'Apellido Marterno',
	rfc,
	cuotaHora As 'Cuota por Hora',
	case
		when activo = 1 then 'activo'
		when activo = 0 then 'desactivado'
	end As Estatus
from instructores;

select 
nombre AS 'Curso',
horas,
cursos.fechainicio as 'Fecha Inicio',
cursos.fechatermino As 'Fecha Termino'
from catCursos 
inner join cursos
on  catCursos.id = cursos.idCatCurso;

select
	alumnos.nombre,
	alumnos.primerApellido,
	alumnos.segundoApellido,
	alumnos.curp,
	estados.nombre as 'Estado',
	estatusAlumnos.nombre 'Estatus'
from alumnos
inner join estados
on alumnos.idEstadoOrigen = estados.id
inner join estatusAlumnos
on alumnos.idEstatus = estatusAlumnos.id;

select
	instructores.nombre +' '+ instructores.primerApellido +' '+ instructores.segundoApellido AS 'instructor',
	instructores.cuotaHora,
	catCursos.nombre,
	cursos.fechainicio,
	cursos.fechatermino
from instructores
inner join cursosInstructores
on instructores.id = cursosInstructores.idInstructor
inner join cursos
on cursosInstructores.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id;

select
	alumnos.nombre,
	alumnos.primerApellido,
	alumnos.segundoApellido,
	estados.nombre,
	catCursos.nombre AS 'CURSO',
	cursosAlumnos.fechaInscripcion,
	cursos.fechainicio,
	cursos.fechatermino,
	cursosAlumnos.calificaciones
from alumnos
inner join estados
on alumnos.idEstadoOrigen = estados.id
inner join cursosAlumnos
on alumnos.id = cursosAlumnos.idAlumno
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id;

select * from alumnos;


select 
 UPPER(nombre) as 'Nombre',
 UPPER(primerApellido) as 'Apellido Paterno',
 UPPER(segundoApellido) as 'Apellido Materno',
 fechaNacimiento,
 GETDATE() as 'Hoy',
 DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as 'Años',
 DATEDIFF(YEAR,fechaNacimiento,DATEADD(MONTH,5,GETDATE())) AS 'EDAD5MESES'
from alumnos;

select 
 UPPER(nombre) as 'Nombre',
 UPPER(primerApellido) as 'Apellido Paterno',
 UPPER(segundoApellido) as 'Apellido Materno',
 fechaNacimiento,
 GETDATE() as 'Hoy',
 +'19'+SUBSTRING(curp,5,2) +'-'+ SUBSTRING(curp,7,2) +'-'+ SUBSTRING(curp,9,2) AS 'FechaCurp'
from alumnos;

select 
	id,
	nombre,
	primerApellido,
	segundoApellido,
	fechaNacimiento,
	correo,
	replace(correo,'gmail','hotmail') as 'CorreoHot' 
from alumnos;

select 
	estados.nombre,
	COUNT(alumnos.idEstadoOrigen) as 'Total Alumnos'
from alumnos
inner join estados
on alumnos.idEstadoOrigen = estados.id
group by estados.nombre;

select
	estatusAlumnos.nombre As 'Estatus',
	COUNT(alumnos.idEstatus) As 'Total'
from alumnos
inner join estatusAlumnos
on alumnos.idEstatus = estatusAlumnos.id
group by estatusAlumnos.nombre;


select 
'Calificaciones alumnos' As 'Resumen de Calificaciones',
COUNT(calificaciones) as 'Total',
MAX(calificaciones) as 'Maxima',
MIN(calificaciones) as 'Minima',
AVG(calificaciones) as 'Promerdio'
from cursosAlumnos; 

select
	catCursos.nombre AS 'Cursos',
	cursos.fechainicio as 'Fecha Inicio',
	cursos.fechatermino as 'Fecha Termino',
	COUNT(cursosAlumnos.calificaciones) AS 'Total',
	MAX(cursosAlumnos.calificaciones) AS 'Maxima',
	MIN(cursosAlumnos.calificaciones) AS 'Minima',
	AVG(cursosAlumnos.calificaciones) As 'Promedio'
from cursosAlumnos
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
group by catCursos.nombre, cursos.fechainicio, cursos.fechatermino;

select
	estados.nombre as 'Estados',
	COUNT(cursosAlumnos.calificaciones) As 'Total',
	MAX(cursosAlumnos.calificaciones) As 'Maximo',
	MIN(cursosAlumnos.calificaciones) as 'Minimo',
	AVG(cursosAlumnos.calificaciones) as 'Promedio'
	
from cursosAlumnos
inner join alumnos
on cursosAlumnos.idAlumno = alumnos.id
inner join estados
on alumnos.idEstadoOrigen = estados.id
group by estados.nombre;

select * 
from alumnos
inner join cursosAlumnos
on cursosAlumnos.idAlumno = alumnos.id
where avg(CursosAlumnos.calificaciones) <= (select AVG(calificaciones)from cursosAlumnos);

use InstitutoTich;
select * from alumnos;

select 
	count(alumnos.nombre) as 'Numero Alumnos',
	avg(cursosAlumnos.calificaciones) Promedio
from alumnos
inner join cursosAlumnos
on cursosAlumnos.idAlumno = alumnos.id
where calificaciones <= 
(select avg(calificaciones) from cursosAlumnos);

select 
	nombre,
	Len(nombre) as 'longitud' 
from alumnos
where len(nombre) =
(select Max(LEN(alumnos.nombre)) from alumnos);

select
	catCursos.nombre as 'Nombre del Curso',
	cursos.fechainicio as 'Fecha Inicial',
	cursos.fechatermino as 'Fecha de termino',
	instructores.nombre as 'Nombre del instructor',
	cursos.id
from instructores
inner join cursosInstructores
on cursosInstructores.idInstructor = instructores.id
inner join cursos
on cursosInstructores.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
order by catCursos.nombre , cursos.fechainicio;

go


select 
	alumnos.nombre,
	catCursos.nombre,
	cursos.fechainicio,
	cursos.fechatermino,
	cursosAlumnos.calificaciones
from alumnos
inner join cursosAlumnos
on cursosAlumnos.idAlumno = alumnos.id
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
WHERE cursosAlumnos.calificaciones = (
select MAX(cursosAlumnos.calificaciones) from cursosAlumnos);

select 
	cursosAlumnos.idAlumno,
	MAX(cursosAlumnos.calificaciones) as 'MaximaCal'
from cursosAlumnos
group by cursosAlumnos.idAlumno;

select * from cursos;

select 
	cursosAlumnos.idCurso,
	catCursos.nombre,
	cursosAlumnos.idAlumno,
	cursosAlumnos.calificaciones
from cursosAlumnos
inner join cursos
on cursos.id = cursosAlumnos.idCurso
inner join catCursos
on cursos.idCatCurso = catCursos.id
inner join (
	select 
	cursosAlumnos.idCurso,
	MAX(cursosAlumnos.calificaciones) as 'MaximaCal'
	from cursosAlumnos
	group by cursosAlumnos.idCurso) cal
on cal.idCurso = cursosAlumnos.idCurso and cal.MaximaCal = cursosAlumnos.calificaciones; 
go

select * from instructores
where (cuotaHora >= 800) and (cuotaHora <= 900);
go

select * from instructores
where cuotaHora between 800 and 900;

go

select * from alumnos
where (alumnos.idEstadoOrigen = 1) or
	  (alumnos.idEstadoOrigen = 5) or
	  (alumnos.idEstadoOrigen = 15) or 
	  (alumnos.idEstadoOrigen = 20) or 
	  (alumnos.idEstadoOrigen = 25) or
	  (alumnos.idEstadoOrigen = 18);
go

Select * from alumnos 
where idEstadoOrigen in (1,5,15,20,25,18);
go

select * from instructores
where nombre like '%s%'; 

select * from alumnos
where primerApellido = 'garcia';

select * 
from alumnos
inner join estatusAlumnos
on alumnos.idEstatus = estatusAlumnos.id
where estatusAlumnos.nombre = 'En capacitación'

select 
	nombre, 
	fechaNacimiento,
	(DATEDIFF(YEAR ,fechaNacimiento,GETDATE())) años 
from instructores
where  (DATEDIFF(YEAR ,fechaNacimiento,GETDATE())) > 30;

select * 
from alumnos
where (DATEDIFF(YEAR,fechaNacimiento,GETDATE())) BETWEEN 20 AND 25;

SELECT 
	alumnos.nombre,
	alumnos.idEstadoOrigen,
	estados.nombre as 'Estado',
	alumnos.idEstatus,
	estatusAlumnos.nombre as 'Estatus'
FROM Alumnos
inner join estados
on alumnos.idEstadoOrigen = estados.id
inner join estatusAlumnos
on alumnos.idEstatus = estatusAlumnos.id
where (estados.nombre = 'Oaxaca' and estatusAlumnos.nombre = 'En capacitacion')
		or
	  (estados.nombre = 'Campeche' and estatusAlumnos.nombre = 'Prospecto');


select * from alumnos
where correo like '%gmail%';


select * from alumnos
where (MONTH(fechaNacimiento)) = 4;
go

select 
	alumnos.nombre,
	DATEDIFF(YEAR,fechaNacimiento,GETDATE()) as ' años fecha actual',
	DATEDIFF(Year,fechaNacimiento,DATEADD(YEAR,5,GETDATE()))  as 'años + 5'
from alumnos
where (DATEDIFF(Year,fechaNacimiento,DATEADD(YEAR,5,GETDATE()))) = 30;
go

select 
	nombre,
	LEN(nombre) as caracteres
from alumnos
where (Len(nombre )) > 10;
go

select 
	nombre,
	curp,
	SUBSTRING(curp,16,1) as 'fin'
from alumnos
where (SUBSTRING(curp,16,1)) between 0 and 9;
go

select
	alumnos.nombre,
	cursosAlumnos.calificaciones
from cursosAlumnos
inner join alumnos
on cursosAlumnos.idAlumno = alumnos.id
where cursosAlumnos.calificaciones > 8;
go

select  
	alumnos.nombre,
	alumnos.primerApellido +' '+ alumnos.segundoApellido as 'apellidos',
	catCursos.nombre as 'Cursos',
	cursos.fechainicio as 'Fecha Inicio',
	cursos.fechatermino as 'Fecha Final',
	cursosAlumnos.calificaciones
from alumnos
inner join cursosAlumnos
on cursosAlumnos.idAlumno = alumnos.id
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
order by cursosAlumnos.calificaciones desc;
go

select 
	nombre, 
	primerApellido,
	SUBSTRING(primerApellido,1,1) as 'PrimeraLeApellido',
	fechaNacimiento,
	YEAR(fechaNacimiento) as 'AñoNaciemiento'
from alumnos
where (((YEAR(fechaNacimiento)) between 1990 and 2000)
		and 
	  ((SUBSTRING(primerApellido,1,1) in ('a','c','z'))));
go

select 
	idCurso,
	AVG(calificaciones)
from cursosAlumnos
group by idCurso;
go

select 
	idCurso,
	COUNT(idAlumno) cantidad,
	catCursos.nombre,
	cursos.fechainicio,
	cursos.fechatermino
from cursosAlumnos
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
group by 
	idCurso, 
	cursos.fechainicio, 
	cursos.fechatermino,
	catCursos.nombre;
go

select 
	curp,
	fechaNacimiento,
	nombre,
	'19'+SUBSTRING(curp,5,2) AS 'AñoCurp',
	''+YEAR(fechaNacimiento)
from alumnos
where ('19'+SUBSTRING(curp,5,2)) <> (''+YEAR(fechaNacimiento))
		or
	  (+SUBSTRING(curp,7,2));
go

select 
	nombre,
	primerApellido,
	SUBSTRING(primerApellido,1,1) as 'Letra1Ap',
	fechaNacimiento,
	MONTH(fechaNacimiento) as 'MES',
	DATEDIFF(YEAR,fechaNacimiento,getdate()) as 'Edad'
from alumnos
where (SUBSTRING(primerApellido,1,1)) = 'a'
		and
	  (MONTH(fechaNacimiento)) = '4'
		and
	  (DATEDIFF(YEAR,fechaNacimiento,getdate())) between 21 and 30;
go


select * from alumnos
where nombre like '%brayan%';
go

select 
	nombre,
	Len(nombre) as 'longitud' 
from alumnos
where len(nombre) =
(select Max(LEN(alumnos.nombre)) from alumnos);
go

 select 
	CAT2.nombre Cursoso, 
	ISNULL(ca.nombre,'s/p') requisitos 
from catCursos ca
right join catCursos CAT2 
ON CAT2.idPreRequisito = ca.id;

SELECT
	alumnos.nombre,
	catCursos.nombre,
	cursosAlumnos.calificaciones,
	case 
		when cursosAlumnos.calificaciones between 9 and 10 then 'Exelente'
		when cursosAlumnos.calificaciones between 7 and 8  then 'Bien'
		when cursosAlumnos.calificaciones = 6 then 'Suficiente'
		when cursosAlumnos.calificaciones < 6 then 'N/A'
	end as Des
FROM cursosAlumnos
inner join alumnos
on cursosAlumnos.idAlumno = alumnos.id
inner join cursos
on cursosAlumnos.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id;
