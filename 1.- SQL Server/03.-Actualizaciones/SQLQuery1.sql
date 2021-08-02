use ejercicio;

select 
	alumnos.id,
	'Alumno' as 'TipoPersona', 
	nombre, 
	primerApellido, 
	segundoApellido, 
	MONTH(fechaNacimiento) as 'MesNaciemiento',
	DAY(fechaNacimiento) as 'DiaNaciemiento' 
	from alumnos

union all

select 
	instructores.id,
	'Profesor' as 'TipoPerosa', 
	nombre, 
	primerApellido, 
	segundoApellido, 
	MONTH(fechaNacimiento) as 'MesNaciemiento',
	DAY(fechaNacimiento) as 'DiaNaciemiento' 
	from instructores
	order by MONTH(fechaNacimiento), DAY(fechaNacimiento);
	go


	use InstitutoTich;

	select * into ejercicio.dbo.estatusAlumnos from estatusAlumnos;
	select * into ejercicio.dbo.cursosAlumnos from cursosAlumnos;
	select * into ejercicio.dbo.estados from estados;
	select * into ejercicio.dbo.cursos from cursos;
	select * into ejercicio.dbo.cursosInstructores from cursosInstructores;
	select * into ejercicio.dbo.catCursos from catCursos;

	use ejercicio;

	go

	select 
		nombre,
		idEstatus
	From alumnos
	where idEstatus = 2;

	update alumnos
	set idEstatus = 3
	where idEstatus = 2; --and nombre = 'brayan alejandro';
	go

	select nombre,segundoApellido 
	from alumnos;

	update alumnos								   --upper()Mayosculas
	set segundoApellido = upper(segundoApellido);  --lOWER()minusculas

	go

	update alumnos
	set segundoApellido = upper(SUBSTRING(segundoApellido,1,1)) + LOWER(SUBSTRING(segundoApellido,2,LEN(segundoApellido)-1));
	go
	
	select * from alumnos;

	select 
		alumnos.nombre,
		estados.nombre,
		cursosAlumnos.calificaciones,
		cursos.fechainicio
	from alumnos
	inner join cursosAlumnos
	on cursosAlumnos.idAlumno = alumnos.id
	inner join estados
	on alumnos.idEstadoOrigen = estados.id
	inner join cursos
	on cursosAlumnos.idCurso = cursos.id
	where (estados.nombre = 'Hidalgo' or estados.nombre = 'Oaxaca') 
		  and 
		  (year(cursos.fechainicio) = 2021 and MONTH(cursos.fechainicio) = 6);

	update cursosAlumnos
	set calificaciones = calificaciones + 1
	from alumnos
	inner join cursosAlumnos
	on cursosAlumnos.idAlumno = alumnos.id
	inner join estados
	on alumnos.idEstadoOrigen = estados.id
	inner join cursos
	on cursosAlumnos.idCurso = cursos.id
	where (estados.nombre = 'Hidalgo' or estados.nombre = 'Oaxaca') 
		  and 
		  (year(cursos.fechainicio) = 2021 and MONTH(cursos.fechainicio) = 6)
		  and 
		  (calificaciones < 10);

	update cursosAlumnos
	set calificaciones = calificaciones + 1
	where cursosAlumnos.id = 4;
	go


	select 
		instructores.nombre,
		instructores.cuotaHora,
		catCursos.nombre
	from instructores
	inner join cursosInstructores
	on cursosInstructores.idInstructor = instructores.id
	inner join cursos
	on cursosInstructores.idCurso = cursos.id
	inner join catCursos
	on cursos.idCatCurso = catCursos.id
	where catCursos.nombre like '.Net%';

	update instructores
	set cuotaHora = (cuotaHora+(cuotaHora * .10))
	from instructores
	inner join cursosInstructores
	on cursosInstructores.idInstructor = instructores.id
	inner join cursos
	on cursosInstructores.idCurso = cursos.id
	inner join catCursos
	on cursos.idCatCurso = catCursos.id
	where catCursos.nombre = '.Net junior';
	go

	select * from catCursos;

	select 
		nombre, 
		telefono,
		curp,
		SUBSTRING(curp,12,2) as 'estado',
		'55'+ SUBSTRING(telefono,3,10) AS 'CAMBIO'
	from instructores;

	UPDATE instructores
	SET telefono = ('55'+ SUBSTRING(telefono,3,10))
	WHERE (SUBSTRING(curp,12,2)) = 'DF';
	go

	select telefono from alumnos;
	select telefono from instructores;

	select 
		alumnos.telefono,
		instructores.telefono
	from alumnos
	inner join cursosAlumnos
	on cursosAlumnos.idAlumno = alumnos.id
	inner join cursos
	on cursosAlumnos.idCurso = cursos.id
	inner join cursosInstructores
	on cursosInstructores.idCurso = cursos.id
	inner join instructores
	on cursosInstructores.idInstructor = instructores.id;

	update alumnos
	set alumnos.telefono = instructores.telefono
	from alumnos
	inner join cursosAlumnos
	on cursosAlumnos.idAlumno = alumnos.id
	inner join cursos
	on cursosAlumnos.idCurso = cursos.id
	inner join cursosInstructores
	on cursosInstructores.idCurso = cursos.id
	inner join instructores
	on cursosInstructores.idInstructor = instructores.id;


