use ejercicio;
go

--Comando para eliminar una funcion.
--drop function GetGenero;

Create function Suma(@val1 as int, @val2 as int)
returns int
begin
	declare @suma int
	set @suma = @val1 + @val2
	return @suma
end;

select dbo.Suma(1,2) as Resultado;

go


create function GetGenero(@curp as varchar(18))
returns varchar (6)
begin
	declare @genero varchar(10), @CHM varchar(2)
		
		set @CHM  = (SUBSTRING(@curp,11,1));
			
		if @CHM = 'H'
			begin
				set @genero = 'Hombre'
			end
		if @CHM = 'M'
			begin
				set @genero = 'Mujer'
			end
	return @genero
end;

select dbo.GetGenero('MADA971212MVZRMN04') as Genero;

go


create function GetFechaNacimiento(@curp as varchar(18))
returns varchar(50)
begin
	declare @FechaNa varchar(50), @Año varchar(2), @AñoAc varchar(2),@Mes varchar(2),@Dia varchar(2);
	 
	 set @Año = SUBSTRING(@curp,5,2);
	 Set @Mes = SUBSTRING(@curp,7,2);
	 set @Dia = SUBSTRING(@curp,9,2);

	 set @AñoAc = Substring(Convert(varchar(4),YEAR(GETDATE())),3,2);

	 if @Año between 0 and convert(int,@AñoAc)
	 begin
		set @FechaNa = @Dia+' del '+@Mes+ ' del 20'+@Año+'';
	 end

	 else if @Año > @AñoAc
	 begin
		set @FechaNa = @Dia+' del '+@Mes+ ' del 19'+@Año+'';
	 end
	 return @FechaNa
end

select dbo.GetFechaNacimiento('MADA211212MVZRMN04');
go

create function GetIdEstado(@curp as varchar(18))
returns int
begin
	declare @idEs int,@Ces varchar(2);
	
	set @Ces = SUBSTRING(@curp,12,2);
	
	if @Ces = 'VZ'
	begin
		set @idEs = 29
	end

	else if  @Ces = 'OC'
	begin
		set @idEs = 19
	end

	return @idEs
end

select dbo.GetIdEstado('MADA971212HOCRMN04');
go

create function Calculadora(@val1 as decimal(10,2), @val2 as decimal(10,2), @Para as varchar(1))
returns decimal(10,2) 
begin
	declare @Resultado decimal(10,2)

	if @Para = '+'
	begin
		set @Resultado = @val1 + @val2;
	end
	else if @Para = '-'
	begin
		set @Resultado = @val1 - @val2;
	end 
	else if @Para = '*'
	begin
		set @Resultado = @val1 * @val2;
	end 
	else if @Para = '/'
	begin
		if  @val2 = 0
		begin
		   set @Resultado = .0; 
		end
		else
		begin
			set @Resultado = @val1 / @val2; 
		end 
	end
	else if @Para = '%'
	begin
		if  @val2 = 0
		begin
		   set @Resultado = .0; 
		end
		else
		begin
			set @Resultado = @val1 % @val2; 
		end 
	end

	return @Resultado
end

select dbo.Calculadora(5,0,'/');
go

create function Importe(@idIns as int, @idCurso as int)
returns decimal(10,2)
begin
	declare @Respuesta decimal(10,2);
	
			select @Respuesta = (instructores.cuotaHora * catCursos.horas)
			from instructores 
			inner join cursosInstructores
			on cursosInstructores.idInstructor = instructores.id
			inner join cursos
			on cursosInstructores.idCurso = cursos.id
			inner join catCursos
			on cursos.idCatCurso = catCursos.id
			where instructores.id = @idIns and catCursos.id = @idCurso

	return @Respuesta
end

select dbo.Importe(3 ,3);

select
	instructores.id as 'idInstructor',
	instructores.nombre,
	instructores.cuotaHora,
	catCursos.id as 'idCurso',
	catCursos.nombre,
	catCursos.horas,
	(instructores.cuotaHora * catCursos.horas) as 'Cuota * Horas'
from instructores
inner join cursosInstructores
on cursosInstructores.idInstructor = instructores.id
inner join cursos
on cursosInstructores.idCurso = cursos.id
inner join catCursos
on cursos.idCatCurso = catCursos.id
go

create function GetEdad(@FechaNa as date, @FechaAc as date)
returns varchar(2)
begin
	declare @Edad varchar(2),@mesNa int , @diaNa int,@mesAc int, @diaAc int;

	set @mesNa = MONTH(@FechaNa);
	Set @diaNa = DAY(@FechaNa);

	set @mesAc = MONTH(@FechaAc);
	set @diaAc = DAY(@FechaAc);
	
	if (@mesAc <= @mesNa) and (@diaAc < @diaNa)
	begin
		set @Edad = DATEDIFF(YEAR,@FechaNa,@FechaAc)-1
	end 

	else if (@mesAc > @mesNa) 
	begin
		set @Edad = DATEDIFF(YEAR,@FechaNa,@FechaAc)
	end

	return @Edad 
end

drop function GetEdad;

select dbo.GetEdad('1996-06-30','2021-06-30')
go

create function Factorial(@var int)
returns int
begin
	declare @Res int, @i as int;
	
	set @Res = 1;
	set @i = 1;

	while @i <= @var
	begin
		set @Res = @Res * @i;
		set @i = @i + 1;
	end
	return @Res
end 

drop function Factorial

select dbo.Factorial(4)

