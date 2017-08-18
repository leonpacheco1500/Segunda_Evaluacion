
CREATE TABLE [dbo].[Datos_Personales](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Regimen_Fiscal] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[IdEmpresa] [int]);


CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Facturas_Mes] [varchar](50) NULL,
	[Cheques] [varchar](50) NULL,
	[Activos] [varchar](50) NULL,
	[Sucursales] [varchar](50) NULL,
	[IdNomina] [int]);
 
/****** Object:  Table [dbo].[Nominas]    Script Date: 14/08/2017 09:24:10 p. m. ******/

CREATE TABLE [dbo].[Nominas](
	[IdNomina] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Servicio_Nomina] [varchar](50) NULL,
	[Num_Empleados] [varchar](50) NULL,
	[Frecu_Pago] [varchar](50) NULL);

	alter table Datos_Personales
	add constraint fk_DatosYEmpresa
	foreign key (IdEmpresa) references Empresa (IdEmpresa)
	on update cascade
	on delete cascade
	
	alter table Empresa
	add constraint fk_EmpresaYNomina
	foreign key (IdNomina) references Nominas (IdNomina) 
	on update cascade
	on delete cascade

						 ---------------------------
						 select*from Empresa;
						 select*from Nominas;
						 select*From Datos_Personales;
						 delete from Empresa;
						 delete from Nominas;
						 delete from Datos_Personales;
						 DBCC CHECKIDENT (Empresa, RESEED, 0)
						 DBCC CHECKIDENT (Nominas, RESEED, 0)
						 DBCC CHECKIDENT (Datos_Personales, RESEED, 0)
						
						 select max (IdNomina)from Nominas


						 --------------------------------------------------
SELECT        Datos_Personales.Nombre, Datos_Personales.IdPersona, Datos_Personales.Correo, Datos_Personales.Telefono, Datos_Personales.Regimen_Fiscal, Datos_Personales.Estado, Empresa.Facturas_Mes, 
                         Empresa.Sucursales, Nominas.Num_Empleados, Nominas.Servicio_Nomina
FROM            Datos_Personales INNER JOIN
                         Empresa ON Datos_Personales.IdEmpresa = Empresa.IdEmpresa INNER JOIN
                         Nominas ON Empresa.IdNomina = Nominas.IdNomina