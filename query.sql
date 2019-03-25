USE [PRUE_INNO]

GO


CREATE TABLE Solicitud_Head(
	ID_Solicitud varchar(8) NOT NULL primary key,
	ID_User varchar(8) not null,
	ID_Ejecutivo varchar(8) not null,
	Fecha datetime NOT NULL,
	RazonSocial nvarchar(100) NOT NULL,
	Correo nvarchar(100) NOT NULL,
	Telefono varchar(20) NOT NULL,
	Pais int NOT NULL,
	Puerto varchar(8) NOT NULL,
	Archivo varchar(1000) NULL,
)

go


CREATE TABLE Solicitud_Dtl(
	ID_Producto [varchar](8) NOT NULL primary key,
	ID_Solicitud [varchar](8) NOT NULL,
	
	
	[Producto] [varchar](65) NOT NULL,
	[Aleacion] [varchar](30) NOT NULL,
	[Temple] [varchar](10) NOT NULL,
	[Norma] [varchar](20) NOT NULL,
	[CantidadRequerida] [decimal](19, 3) NOT NULL,
	[Potencial] [decimal](19, 3) NOT NULL,
	[Diametro] [decimal](19, 3) NULL,
	[Ancho] [decimal](19, 3) NULL,
	[Espesor] [decimal](19, 3) NULL,
	[Longitud] [decimal](19, 3) NULL,
	[Embalaje] [varchar](25) NULL,
	[UsoFinal] [varchar](50) NULL,
	Factible bit not null,
	Cotizacion bit not null,
	Confirmacion bit not null
)

go

ALTER TABLE Solicitud_Dtl
ADD CONSTRAINT FK_solicitudDtl_Head
FOREIGN KEY (ID_Solicitud) REFERENCES Solicitud_Head(ID_Solicitud);


go

create table Calidad_factibilidad(
	ID_Producto [varchar](8) NOT NULL,
	Fecha datetime not null,
	IDUser varchar(8) not null
)

ALTER TABLE Calidad_factibilidad
ADD CONSTRAINT FK_SoloicitudDTl_Calidad
FOREIGN KEY (ID_Producto) REFERENCES Solicitud_Dtl(ID_Producto);

go 

create table Ingenieria_pasos(
	ID_Producto varchar(8) NOT NULL,
	ID_User varchar(8) not null,
	Nro_Paso int not null,
	ID_Maquinaria varchar(8) not null,
	Fecha datetime not null,
	diametro_descp varchar(25)
)

ALTER TABLE Ingenieria_pasos
ADD CONSTRAINT FK_Calidad_Ingenieria
FOREIGN KEY (ID_Producto) REFERENCES Solicitud_Dtl(ID_Producto);
