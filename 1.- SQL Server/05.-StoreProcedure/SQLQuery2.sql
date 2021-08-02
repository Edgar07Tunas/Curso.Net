use ejercicio;

--Ejercico 1 E50--
create Procedure CodigoAscii(
	@Caracter char
)as
begin
	declare @Ascii int 
	set @Ascii = ASCII(@Caracter);
	
	if	@Ascii > 32
	begin
		print @Ascii
	end
end 

exec CodigoAscii '!'
go

--Ejercicio 2 E50--

create procedure FactorialPro(
	@Num int,
	@Fac int out
)as
begin
	declare @Res int, @i int
	
	set @Res = 1
	set @i = 1

	while @i <= @Num
	begin
		set @Res = @Res * @i
		set @i = @i + 1
	end

	set @Fac = @Res
end

declare @Factorial int
exec FactorialPro 4,@Factorial output
print @Factorial
go

--Ejercicio 3 E50--

create table saldos(
	id int not null primary key identity(1,1),
	nombre varchar(100),
	saldo decimal(10,2)
);

create table Transacciones(
	id int not null primary key identity(1,1),
	idOrigen int not null,
	idDestino int not null,
	monto decimal(10,2),
	foreign key (idOrigen) references saldos(id),
	foreign key (idDestino) references saldos(id)
);
go

--Ejercicio 4 E50--
create procedure TransaccionesT(
	@origen int,
	@destino int,
	@monto decimal(10,2)
)as
begin
	
	begin try
		begin transaction
			insert into Transacciones values (@origen,@destino,@monto);
			update saldos set saldo = saldo - @monto where id = @origen;
			update saldos set saldo = saldo + @monto where id = @destino;
		commit transaction
		print 'Transacción con Exito'
	end try

	begin catch
		rollback transaction
		print 'Existio un error';
		throw 51000,'Error al realizar la transferencia',1;
	end catch
end

exec TransaccionesT 2,1,250

select * from saldos;
go

--Ejercicio 1 E60--
create view vAlumnos as
select
	alumnos.id,
	alumnos.nombre,
	alumnos.primerApellido,
	alumnos.segundoApellido,
	alumnos.correo,
	alumnos.telefono,
	alumnos.curp,
	estados.nombre AS 'ESTADOS',
	estatusAlumnos.nombre AS 'ESTATUS'
from alumnos 
inner join estados
on alumnos.idEstadoOrigen = estados.id
inner join estatusAlumnos
on alumnos.idEstadoOrigen = estatusAlumnos.id

SELECT * FROM vAlumnos;
GO

--Ejercicio 2 E60--
create procedure consultarEstado(
	@idEstado int
)as
begin
	if @idEstado between 1 and 31
	begin
		select * from estados where estados.id = @idEstado
	end
	if @idEstado = -1
	begin
		SELECT * FROM estados
	end 
end

exec consultarEstado -1
go

--Ejercicio 3 E60--
create procedure consultarEstatusAlumnos(
	@idEstatus int
)as 
begin
	if @idEstatus between 1 and 8
	begin
		select id, nombre from estatusAlumnos where estatusAlumnos.id = @idEstatus;
	end

	if @idEstatus = -1
	begin
		select * from estatusAlumnos;
	end
end

exec consultarEstatusAlumnos -1
go

--Ejercicio 4 E60--
create procedure consultarAlumnos(
	@idAlumno int 
)as
begin
	declare @ran int
	
	select @ran = COUNT(alumnos.id) from alumnos

	if @idAlumno between 1 and @ran
	begin
		select 
			alumnos.id,
			alumnos.nombre,
			alumnos.primerApellido,
			alumnos.segundoApellido,
			alumnos.correo,
			alumnos.fechaNacimiento,
			alumnos.telefono,
			alumnos.curp,
			estados.nombre as 'Estados',
			estatusAlumnos.nombre as 'Estatus'
		from alumnos
		inner join estados
		on alumnos.idEstadoOrigen = estados.id
		inner join estatusAlumnos
		on alumnos.idEstatus = estatusAlumnos.id
		where alumnos.id = @idAlumno
	end

	if @idAlumno = -1
	begin
		select 
			alumnos.id,
			alumnos.nombre,
			alumnos.primerApellido,
			alumnos.segundoApellido,
			alumnos.correo,
			alumnos.fechaNacimiento,
			alumnos.telefono,
			alumnos.curp,
			estados.nombre as 'Estados',
			estatusAlumnos.nombre as 'Estatus'
		from alumnos
		inner join estados
		on alumnos.idEstadoOrigen = estados.id
		inner join estatusAlumnos
		on alumnos.idEstatus = estatusAlumnos.id
	end
end 

exec consultarAlumnos -1
go

--Ejercicio 5 E60--
create procedure consultarEAlumnos(
	@idAlumnos int 
)as
begin
	declare @ran int

	select @ran = COUNT(alumnos.id) from alumnos;

	if @idAlumnos between 1 and @ran
	begin
		select * from alumnos where alumnos.id = @idAlumnos 
	end

	if @idAlumnos = -1
	begin
		select * from alumnos
	end
end

exec consultarEAlumnos 1
go

--ejercicio 6 E60--
create procedure actualizarEstatusAlumnos(
	@idAlumno int,
	@idEstatusCa int
)as
begin
	update alumnos set idEstatus = @idEstatusCa where id = @idAlumno
end

exec actualizarEstatusAlumnos 1, 1

select * from alumnos
go

--ejercicio 7 E60--
create procedure agregarAlumnos(
	@nombre varchar(60),
	@PApellido varchar(50),
	@SApellido varchar(50),
	@correo varchar(80),
	@telefono nchar(10),
	@fechaN date,
	@curp char(18),
	@idEstado int,
	@idEstatus int,
	@obtid int out
)as
begin
	insert into alumnos 
	values(@nombre, @PApellido,
			@SApellido,@correo,
			@telefono,@fechaN,
			@curp,@idEstado,
			@idEstatus);
	
	set @obtid = @@IDENTITY;

end

declare @id int
exec agregarAlumnos 'alonso','avecilla','martinez','alonso@gmail.com',7731222950,'1998-04-27','1234567887654321',1,1,@id output
print @id

select  * from alumnos;
go

--ejercicio 8 E60--
--ejercicio 9 E60--
--ejercicio 10 E60--


--ejercicio 11 E60--
--ejercicio 12 E60--
--ejercicio 13 E60--
--ejercicio 14 E60--
--ejercicio 15 E60--
