

CREATE TABLE Ciudadano(
DPI NUMERIC(13,0) identity primary key,
Nombre varchar(50),
Apellidos varchar(50),
FechaNac date
)



IF OBJECT_ID (N'Ciudadano', N'IF') IS NOT NULL
    DROP FUNCTION CiudadanoF;
GO
CREATE FUNCTION CiudadanoF (@Nombre varchar(50), @FechaNac date)
RETURNS TABLE
AS
RETURN
(
    SELECT Nombre, FechaNac, DATEDIFF(yy,GETDATE(), FechaNac) AS Edad
	FROM Ciudadano
	WHERE Nombre = @Nombre
	AND FechaNac = @FechaNac
);




create procedure sp_Ingresar(
@dpi int,
@Nombre varchar(100),
@Apellido varchar(100),
@FechaNac date 
)
as
IF EXISTS (SELECT * FROM Ciudadano  WHERE DPI = @dpi )
begin
	update Ciudadano set Nombre = @Nombre, Apellidos = @Apellido , FechaNac = @FechaNac where DPI = @dpi
end
ELSE
begin
	insert into Ciudadano(DPI,Nombre,Apellidos,FechaNac) values (@dpi, @Nombre, @Apellido, @FechaNac)
end