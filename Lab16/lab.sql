-- DELETE TABLE =================================================================================
DROP TABLE Entregan
DROP TABLE Materiales
DROP TABLE Proyectos
DROP TABLE Proveedores



-- LOAD DB =====================================================================================
BULK INSERT a1701490.a1701490.[Materiales]
   FROM 'e:\wwwroot\a1701490\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701490.a1701490.[Proveedores]
   FROM 'e:\wwwroot\a1701490\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701490.a1701490.[Proyectos]
   FROM 'e:\wwwroot\a1701490\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1701490.a1701490.[Entregan]
   FROM 'e:\wwwroot\a1701490\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )



-- LOAD DB =================================================================================
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales

CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores

CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos

CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan

CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)



-- QUERIES =================================================================================
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales

CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores

CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos

CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan

CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)

BULK INSERT a1701490.a1701490.[Materiales]
   FROM 'e:\wwwroot\a1701490\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701490.a1701490.[Proveedores]
   FROM 'e:\wwwroot\a1701490\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701490.a1701490.[Proyectos]
   FROM 'e:\wwwroot\a1701490\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1701490.a1701490.[Entregan]
   FROM 'e:\wwwroot\a1701490\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

INSERT INTO Materiales values(1000, 'xxx', 1000)
SELECT * FROM Materiales

Delete from Materiales where Clave = 1000 and Costo = 1000

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
INSERT INTO Materiales values(1000, 'xxx', 1000)

sp_helpconstraint materiales

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Proyectos add constraint llaveProyecto PRIMARY KEY (Numero)

SELECT * FROM Entregan
SELECT * FROM Proveedores
SELECT * FROM Proyectos
SELECT * FROM Materiales

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);

Delete from Entregan where Clave = 0

ALTER TABLE entregan add constraint cfentreganclave
foreign key (clave) references Materiales(clave);

ALTER TABLE entregan add constraint cfentreganrfc
foreign key (rfc) references Proveedores(rfc);

ALTER TABLE entregan add constraint cfentregannumero
foreign key (numero) references Proyectos(numero);

sp_helpconstraint Proveedores
sp_helpconstraint Materiales
sp_helpconstraint Proyectos
sp_helpconstraint Entregan

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);

Delete from Entregan where Cantidad = 0

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;