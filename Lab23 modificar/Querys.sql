/* ##Parte 1## */

IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaMaterial' AND type = 'P')
   DROP PROCEDURE creaMaterial
GO

CREATE PROCEDURE creaMaterial
       @uclave NUMERIC(5,0),
       @udescripcion VARCHAR(50),
       @ucosto NUMERIC(8,2)
AS
	INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto)
GO

EXECUTE creaMaterial 5000,'Martillos Acme',250

select * from materiales

--PROCEDIMIENTOS MATERIALES--
--Procedimiento modificaMaterial
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'modificaMaterial' AND type = 'P')
   DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaMaterial
	   @uclave NUMERIC(5,0),
       @udescripcion VARCHAR(50),
       @ucosto NUMERIC(8,2)
AS
	UPDATE materiales SET clave = @uclave, descripcion = @udescripcion, costo = @ucosto
	WHERE clave = @uclave 
GO

EXECUTE modificaMaterial 5000,'Martillos Acme',300

select * from materiales

--Procedimiento eliminaMaterial
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'eliminaMaterial' AND type = 'P')
   DROP PROCEDURE eliminaMaterial
GO

CREATE PROCEDURE eliminaMaterial
       @uclave NUMERIC(5,0)
AS
	DELETE FROM Materiales WHERE clave = @uclave
GO

EXECUTE eliminaMaterial 5000

select * from materiales

--PROCEDIMIENTOS PROYECTOS
--Procedimiento creaProyecto
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaProyecto' AND type = 'P')
   DROP PROCEDURE creaProyecto
GO

CREATE PROCEDURE creaProyecto
       @unumero NUMERIC(5,0),
       @udenominacion VARCHAR(50)
AS
	INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

EXECUTE creaProyecto 5020,'Proyecto prueba'

select * from proyectos

--Procedimiento modificaProyecto
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'modificaProyecto' AND type = 'P')
   DROP PROCEDURE modificaProyecto
GO

CREATE PROCEDURE modificaProyecto
	   @unumero NUMERIC(5,0),
       @udenominacion VARCHAR(50)
AS
	UPDATE proyectos SET numero = @unumero, denominacion = @udenominacion
	WHERE numero = @unumero 
GO

EXECUTE modificaProyecto 5020,'Prueba 1'

select * from Proyectos

--Procedimiento eliminaProyecto
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'eliminaProyecto' AND type = 'P')
   DROP PROCEDURE eliminaProyecto
GO

CREATE PROCEDURE eliminaProyecto
       @unumero NUMERIC(5,0)
AS
	DELETE FROM Proyectos WHERE numero = @unumero
GO

EXECUTE eliminaProyecto 5020

select * from Proyectos

--PROCEDIMIENTOS PROVEEDORES
--Procedimiento creaProveedor
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaProveedor' AND type = 'P')
   DROP PROCEDURE creaProveedor
GO

CREATE PROCEDURE creaProveedor
       @uRFC CHAR(13),
       @uRazonSocial VARCHAR(50)
AS
	INSERT INTO Proveedores VALUES(@uRFC, @uRazonSocial)
GO

EXECUTE creaProveedor 'IIII800101','Razon prueba'

select * from Proveedores

--Procedimiento modificaProveedor
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'modificaProveedor' AND type = 'P')
   DROP PROCEDURE modificaProveedor
GO

CREATE PROCEDURE modificaProveedor
	   @uRFC CHAR(13),
       @uRazonSocial VARCHAR(50)
AS
	UPDATE Proveedores SET RFC = @uRFC, RazonSocial = @uRazonSocial
	WHERE RFC = @uRFC 
GO

EXECUTE modificaProveedor 'IIII800101','Razon prueba 1'

select * from Proveedores

--Procedimiento eliminaProveedor
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'eliminaProveedor' AND type = 'P')
   DROP PROCEDURE eliminaProveedor
GO

CREATE PROCEDURE eliminaProveedor
       @uRFC CHAR(13)
AS
	DELETE FROM Proveedores WHERE  RFC = @uRFC
GO

EXECUTE eliminaProveedor 'IIII800101'

select * from Proveedores

--PROCEDIMIENTOS ENTREGAN
--Procedimiento creaEntrega
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaEntrega' AND type = 'P')
   DROP PROCEDURE creaEntrega
GO

CREATE PROCEDURE creaEntrega
	   @uclave NUMERIC(5,0),
       @uRFC char(13),
       @unumero NUMERIC(5,0),
	   @ufecha DATETIME,
	   @ucantidad NUMERIC(8,2)
AS
	INSERT INTO Entregan VALUES(@uclave, @uRFC, @unumero, @ufecha, @ucantidad)
GO

EXECUTE creaEntrega 1430, 'DDDD800101', 5008, '11-MAY-2000', 333

select * from Entregan

--Procedimiento modificaEntrega
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'modificaEntrega' AND type = 'P')
   DROP PROCEDURE modificaEntrega
GO

CREATE PROCEDURE modificaEntrega
	   @uclave NUMERIC(5,0),
       @uRFC char(13),
       @unumero NUMERIC(5,0),
	   @ufecha DATETIME,
	   @ucantidad NUMERIC(8,2)
AS
	UPDATE Entregan SET clave = @uclave, RFC = @uRFC, numero = @unumero, fecha = @ufecha, cantidad = @ucantidad
	WHERE  clave = @uclave
GO

EXECUTE modificaEntrega 1430, 'DDDD800101', 5108, '11-MAY-2000', 666

select * from Entregan

--Procedimiento eliminaEntrega
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'eliminaEntrega' AND type = 'P')
   DROP PROCEDURE eliminaEntrega
GO

CREATE PROCEDURE eliminaEntrega
       @uclave NUMERIC(5,0)
AS
	DELETE FROM Entregan WHERE clave = @uclave
GO

EXECUTE eliminaEntrega 1430

select * from Entregan



/* ##Parte 2## */

IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'queryMaterial' AND type = 'P')
	DROP PROCEDURE queryMaterial
GO



CREATE PROCEDURE queryMaterial
     @udescripcion VARCHAR(50),
     @ucosto NUMERIC(8,2)

AS
   SELECT * FROM Materiales WHERE descripcion
    LIKE '%'+@udescripcion+'%' AND costo > @ucosto
GO

EXECUTE queryMaterial 'Lad',20