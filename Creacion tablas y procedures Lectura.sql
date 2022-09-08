


--create database DBCRUDCORE
--USE DBCRUDCORE


CREATE TABLE Lecturas(
IdLectura int identity primary key,
IdContador int,
Lectura int,
Mes int
)

create procedure eesp_Listar
as
begin
	select * from Lecturas
end

create procedure eesp_obtener(
@IdLecturas int
)
as
begin
	select * from Lecturas where  IdLecturas = @IdLecturas
end


create procedure eesp_registrar(
@idcontador int,
@lectura int,
@mes int
)
as
begin
	insert into Lecturas(IdContador,Lectura,Mes) values (@idcontador,@lectura,@mes)
end


create procedure eesp_modificar(
@idlecturas int,
@idcontador int,
@lectura int,
@mes int
)
as
begin
	update Lecturas set IdContador = @idcontador, Lectura = @lectura , Mes = @mes where IdLecturas = @idlectura
end


create procedure eesp_eliminar(
@IdLecturas int
)
as
begin
	delete from Lecturas where IdLecturas = @idlectura
end



--drop table Lecturas
select * from Lecturas