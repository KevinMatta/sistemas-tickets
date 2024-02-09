USE master 
GO 
CREATE DATABASE DB_Tickes 
GO 
USE DB_Tickes 
GO
CREATE SCHEMA Gene 
GO
CREATE SCHEMA Teat 
GO
CREATE SCHEMA Acce --(Acceso)AQUI VA LA TABLA USUARIOS
GO
--PRIMERO SE DEBE CREAR LA TABLA USUARIOS SIN REFERENCIAS,
CREATE TABLE
	Acce.tbUsuarios (
		Usro_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Usro_Rol VARCHAR(20),
		Prsn_Id INT,
		Usro_Creacion INT, --NOT NULL,
		Usro_FechaCreacion DATE NOT NULL,
		Usro_Modifica INT,
		Usro_Estado BIT,
		--CONSTRAINT FK_tbUsuarios_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas(Prsn_Id),
		-- CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Creacion FOREIGN KEY (Usro_Creacion) REFERENCES Acce.tbUsuarios(Usro_Id),
		-- CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Modifica FOREIGN KEY (Usro_Modifica) REFERENCES Acce.tbUsuarios(Usro_Id)
	);

GO
-- --INSERT #1 DEL ADMIN
--FALTARIA AGREGAR LOS VALORES DE LOS CAMPOS Prsn_Id
INSERT INTO
	Acce.tbUsuarios (
		Usro_Rol,
		Prsn_Id,
		Usro_Creacion,
		Usro_FechaCreacion,
		Usro_Estado
	)
VALUES
	('Admin', 1, 1, GETDATE (), 1);

GO
-- AGREGAMOS LOS CONSTRAINTS PARA Usro_Creacion, Usro_Modifica
ALTER TABLE Acce.tbUsuarios ADD CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Creacion FOREIGN KEY (Usro_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Modifica FOREIGN KEY (Usro_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id);

GO
ALTER TABLE Acce.tbUsuarios
ALTER COLUMN Usro_Creacion INT NOT NULL;

GO
-- --UPDATE AL Usro_Creacion y le hacemos referencia a si mismo
-- UPDATE Acce.tbUsuarios
-- SET Usro_Crecion = 1
-- WHERE Usro_Id = 1;
-- GO
GO
CREATE TABLE
	Gene.tbEstadosCiviles (
		EsCi_Id INT IDENTITY (1, 1) PRIMARY KEY,
		EsCi_Descripcion CHAR,
		EsCi_Creacion INT NOT NULL,
		EsCi_FechaCreacion DATE NOT NULL,
		EsCi_Modifica INT,
		EsCi_Estado BIT,
		CONSTRAINT CK_tbEstadosCiviles_EsCi_Descripcion CHECK (EsCi_Descripcion IN ('S', 'C', 'D', 'V', 'U')),
		CONSTRAINT FK_tbEstadosCiviles_tbUsuarios_Ciud_Creacion FOREIGN KEY (EsCi_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEstadosCiviles_tbUsuarios_Ciud_Modifica FOREIGN KEY (EsCi_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbPersonas (
		Prsn_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Prsn_Nombre VARCHAR(20),
		Prsn_Apellido VARCHAR(20),
		Prsn_Sexo CHAR(1),
		Prsn_FechaNacimiento DATE,
		EsCi_Id INT,
		Prsn_Creacion INT NOT NULL,
		Prsn_FechaCreacion DATE NOT NULL,
		Prsn_Modifica INT,
		Prsn_Estado BIT,
		CONSTRAINT CK_tbPersonas_Prsn_Sexo CHECK (Prsn_Sexo IN ('F', 'M')),
		CONSTRAINT FK_tbPersonas_tbEstadosCiviles_EsCi_Id FOREIGN KEY (EsCi_Id) REFERENCES Gene.tbEstadosCiviles (EsCi_Id),
		CONSTRAINT FK_tbPersonas_tbUsuarios_Prsn_Creacion FOREIGN KEY (Prsn_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbPersonas_tbUsuarios_Prsn_Modifica FOREIGN KEY (Prsn_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
--AGREGAMOS LOS REGISTROS DE LOS ESTADOS CIVILES PARA AGREGAR EL REGISTROS DE LA PRIMERA PERSONAS
INSERT INTO
	Gene.tbEstadosCiviles (
		EsCi_Descripcion,
		EsCi_Creacion,
		EsCi_FechaCreacion,
		EsCi_Estado
	)
VALUES
	('S', 1, GETDATE (), 1),
	('C', 1, GETDATE (), 1),
	('D', 1, GETDATE (), 1),
	('V', 1, GETDATE (), 1),
	('U', 1, GETDATE (), 1);

GO
--AGREGAMOS EL PRIMER REGISTRO DE LA PERSONA QUE SERA EL ADMINISTRADOR
INSERT INTO
	Gene.tbPersonas (
		Prsn_Nombre,
		Prsn_Apellido,
		Prsn_Sexo,
		Prsn_FechaNacimiento,
		EsCi_Id,
		Prsn_Creacion,
		Prsn_FechaCreacion,
		Prsn_Estado
	)
VALUES
	(
		'Kevin',
		'Mata',
		'M',
		'2001-06-25',
		1,
		1,
		GETDATE (),
		1
	);

GO
--ALTERAMOS LA TABLA USUARIO PARA QUE TENGA REFERENCIA CON LA TABLA PERSONAS
ALTER TABLE Acce.tbUsuarios ADD
-- Prsn_Id INT,
CONSTRAINT FK_tbUsuarios_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id)
-- -- ACTULIZAMOS EL CAMPO QUE QUEDO NULO DE LA TABLA USUARIOS PARA QUE HAGA REFENRENCIA A LA PERSONA
-- UPDATE Acce.tbUsuarios
-- SET Prsn_Id = 1
-- WHERE Usro_Id = 1;
-- CONTINUAMOS CREANDO LAS TABLAS
GO
CREATE TABLE
	Teat.tbEmpleados (
		Empl_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Empl_Puesto VARCHAR(30),
		Empl_Salario INT,
		Prsn_Id INT,
		Empl_Creacion INT NOT NULL,
		Empl_FechaCreacion DATE NOT NULL,
		Empl_Modifica INT,
		Empl_Estado BIT,
		CONSTRAINT FK_tbEmpleados_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id),
		CONSTRAINT FK_tbEmpleados_tbUsuarios_Empl_Creacion FOREIGN KEY (Empl_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEmpleados_tbUsuarios_Empl_Modifica FOREIGN KEY (Empl_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbEstados (
		Estd_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Estd_Descripcion VARCHAR(20),
		--auditoria
		Estd_Creacion INT NOT NULL,
		Estd_FechaCreacion DATE NOT NULL,
		Estd_Modifica INT,
		Estd_Estado BIT,
		CONSTRAINT FK_tbEstados_tbUsuarios_Estd_Creacion FOREIGN KEY (Estd_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEstados_tbUsuarios_Estd_Modifica FOREIGN KEY (Estd_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbCiudades (
		Ciud_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Ciud_Descripcion VARCHAR(20),
		Estd_Id INT,
		--auditoria
		Ciud_Creacion INT NOT NULL,
		Ciud_FechaCreacion DATE NOT NULL,
		Ciud_Modifica INT,
		Ciud_Estado BIT,
		CONSTRAINT FK_tbCiudades_tbEstados_Estd_Id FOREIGN KEY (Estd_Id) REFERENCES Gene.tbEstados (Estd_Id),
		CONSTRAINT FK_tbCiudades_tbUsuarios_Ciud_Creacion FOREIGN KEY (Ciud_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbCiudades_tbUsuarios_Ciud_Modifica FOREIGN KEY (Ciud_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbObras (
		Obrs_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Obrs_Descripcion VARCHAR(20),
		--auditoria
		Obrs_Creacion INT NOT NULL,
		Obrs_FechaCreacion DATE NOT NULL,
		Obrs_Modifica INT,
		Obrs_Estado BIT,
		CONSTRAINT FK_tbObras_tbUsuarios_Obrs_Creacion FOREIGN KEY (Obrs_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbObras_tbUsuarios_Obrs_Modifica FOREIGN KEY (Obrs_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbParticipantes (
		Prtp_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Prtp_Rol VARCHAR(20),
		Obrs_Id INT,
		Prsn_Id INT,
		--auditoria
		Prtp_Creacion INT NOT NULL,
		Prtp_FechaCreacion DATE NOT NULL,
		Prtp_Modifica INT,
		Prtp_Estado BIT,
		CONSTRAINT FK_tbParticipantes_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id),
		CONSTRAINT FK_tbParticipantes_tbObras_Obrs_Id FOREIGN KEY (Obrs_Id) REFERENCES Teat.tbObras (Obrs_Id),
		CONSTRAINT FK_tbParticipantes_tbUsuarios_Prtp_Creacion FOREIGN KEY (Prtp_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbParticipantes_tbUsuarios_Prtp_Modifica FOREIGN KEY (Prtp_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbFunciones (
		Fncs_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Fncs_Fecha DATETIME,
		Obrs_Id INT,
		--auditoria
		GnOb_Creacion INT NOT NULL,
		GnOb_FechaCreacion DATE NOT NULL,
		GnOb_Modifica INT,
		GnOb_Estado BIT,
	);

GO
CREATE TABLE
	Teat.tbTeatros (
		Teat_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Teat_Descripcion VARCHAR(20),
		Ciud_Id INT,
		--auditoria
		Teat_Creacion INT NOT NULL,
		Teat_FechaCreacion DATE NOT NULL,
		Teat_Modifica INT,
		Teat_Estado BIT,
		CONSTRAINT FK_tbTeatros_tbCiudades_Ciud_Id FOREIGN KEY (Ciud_Id) REFERENCES Gene.tbCiudades (Ciud_Id),
		CONSTRAINT FK_tbTeatatros_tbUsuarios_Teat_Creacion FOREIGN KEY (Teat_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbTeatatros_tbUsuarios_Teat_Modifica FOREIGN KEY (Teat_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSalas (
		Sala_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Sala_Descripcion VARCHAR(20),
		Fncs_Id INT,
		--auditoria
		Sala_Creacion INT NOT NULL,
		Sala_FechaCreacion DATE NOT NULL,
		Sala_Modifica INT,
		Sala_Estado BIT,
		CONSTRAINT FK_tbSalas_tbFunciones_Fncs_Id FOREIGN KEY (Fncs_Id) REFERENCES Teat.tbFunciones (Fncs_Id),
		CONSTRAINT FK_tbSalas_tbUsuarios_Sala_Creacion FOREIGN KEY (Sala_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSalas_tbUsuarios_Sala_Modifica FOREIGN KEY (Sala_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSalasPorTeatros (
		SaTe_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Teat_Id INT,
		Sala_Id INT,
		--auditoria
		SaTe_Creacion INT NOT NULL,
		SaTe_FechaCreacion DATE NOT NULL,
		SaTe_Modifica INT,
		SaTe_Estado BIT,
		CONSTRAINT FK_tbSalasPorTeatros_tbTeatros_Teat_Id FOREIGN KEY (Teat_Id) REFERENCES Teat.tbTeatros (Teat_Id),
		CONSTRAINT FK_tbSalasPorTeatros_tbSalas_Sala_Id FOREIGN KEY (Sala_Id) REFERENCES Teat.tbSalas (Sala_Id),
		CONSTRAINT FK_tbSalasPorTeatros_tbUsuarios_SaTe_Creacion FOREIGN KEY (SaTe_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSalasPorTeatros_tbUsuarios_SaTe_Modifica FOREIGN KEY (SaTe_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSecciones (
		Secc_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Secc_Descripcion VARCHAR(20),
		SaTe_Id INT,
		--auditoria
		Secc_Creacion INT NOT NULL,
		Secc_FechaCreacion DATE NOT NULL,
		Secc_Modifica INT,
		Secc_Estado BIT,
		CONSTRAINT FK_tbSecciones_tbSalasPorTeatros_SaTe_Id FOREIGN KEY (SaTe_Id) REFERENCES Teat.tbSalasPorTeatros (SaTe_Id),
		CONSTRAINT FK_tbSecciones_tbUsuarios_Secc_Creacion FOREIGN KEY (Secc_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSecciones_tbUsuarios_Secc_Modifica FOREIGN KEY (Secc_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbPrecios (
		Prco_Id INT IDENTITY (1, 1) PRIMARY KEY,
		--auditoria
		Prco_Creacion INT NOT NULL,
		Prco_FechaCreacion DATE NOT NULL,
		Prco_Modifica INT,
		Prco_Estado BIT,
		CONSTRAINT FK_tbPrecios_tbUsuarios_Prco_Creacion FOREIGN KEY (Prco_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbPrecios_tbUsuarios_Prco_Modifica FOREIGN KEY (Prco_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbAsientos (
		Asnt_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Asnt_Descripcion VARCHAR(20),
		Secc_Id INT,
		Prco_Id INT,
		--auditoria
		Asnt_Creacion INT NOT NULL,
		Asnt_FechaCreacion DATE NOT NULL,
		Asnt_Modifica INT,
		Asnt_Estado BIT,
		CONSTRAINT FK_tbAsientos_tbPrecios_Prco_Id FOREIGN KEY (Prco_Id) REFERENCES Teat.tbPrecios (Prco_Id),
		CONSTRAINT FK_tbAsientos_tbSecciones_Secc_Id FOREIGN KEY (Secc_Id) REFERENCES Teat.tbSecciones (Secc_Id),
		CONSTRAINT FK_tbAsientos_tbUsuarios_Asnt_Creacion FOREIGN KEY (Asnt_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbAsientos_tbUsuarios_Asnt_Modifica FOREIGN KEY (Asnt_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbAsientosPorSalas (
		AsSa_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Asnt_Id INT,
		SaTe_Id INT,
		--auditoria
		AsSa_Creacion INT NOT NULL,
		AsSa_FechaCreacion DATE NOT NULL,
		AsSa_Modifica INT,
		AsSa_Estado BIT,
		CONSTRAINT FK_tbAsientosPorSalas_tbAsientos_Asnt_Id FOREIGN KEY (Asnt_Id) REFERENCES Teat.tbAsientos (Asnt_Id),
		CONSTRAINT FK_tbAsientosPorSalas_tbSalasPorTeatros_SaTe_Id FOREIGN KEY (SaTe_Id) REFERENCES Teat.tbSalasPorTeatros (SaTe_Id),
		CONSTRAINT FK_tbAsientosPorSalas_tbUsuarios_AsSa_Creacion FOREIGN KEY (AsSa_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbAsientosPorSalas_tbUsuarios_AsSa_Modifica FOREIGN KEY (AsSa_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbVentasEncabezado (
		Vnts_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Vnts_Fecha DATETIME,
		--auditoria
		Vnts_Creacion INT NOT NULL,
		Vnts_FechaCreacion DATE NOT NULL,
		Vnts_Modifica INT,
		Vnts_Estado BIT,
		CONSTRAINT FK_tbVentasEncabezado_tbUsuarios_Vnts_Creacion FOREIGN KEY (Vnts_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbVentasEncabezado_tbUsuarios_Vnts_Modifica FOREIGN KEY (Vnts_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	) 
GO
CREATE TABLE
	Teat.tbVentasDetalle (
		VtDe_Id INT IDENTITY (1, 1) PRIMARY KEY,
		VtDe_Boleto VARCHAR(15) UNIQUE,
		Vnts_Id INT,
		Asnt_Id INT,
		Fncs_Id INT,
		CONSTRAINT FK_tbVentasDetalle_tbVentasEncabezado_Vnts_Id FOREIGN KEY (Vnts_Id) REFERENCES Teat.tbVentasEncabezado (Vnts_Id),
		CONSTRAINT FK_tbVentasDetalle_tbAsientos_Asnt_Id FOREIGN KEY (Asnt_Id) REFERENCES Teat.tbAsientos (Asnt_Id),
		CONSTRAINT FK_tbVentasDetalle_tbFunciones_Fncs_Id FOREIGN KEY (Fncs_Id) REFERENCES Teat.tbFunciones (Fncs_Id),
		--auditoria
		VtDe_Creacion INT NOT NULL,
		VtDe_FechaCreacion DATE NOT NULL,
		VtDe_Modifica INT,
		VtDe_Estado BIT,
		CONSTRAINT FK_tbVentasDetalle_tbUsuarios_VtDe_Creacion FOREIGN KEY (VtDe_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbVentasDetalle_tbUsuarios_VtDe_Modifica FOREIGN KEY (VtDe_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	)