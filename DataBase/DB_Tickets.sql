USE master 
GO 
CREATE DATABASE DB_Tickets 
GO 
USE DB_Tickets 
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
    Usro_Usuario VARCHAR(20) NOT NULL,
    Usro_Clave VARCHAR(20) NOT NULL,
		Prsn_Id INT NOT NULL,
		Usro_Creacion INT NOT NULL, 
		Usro_FechaCreacion DATETIME NOT NULL,
		Usro_Modifica INT,
    Usro_FechaModificacion DATETIME,
		Usro_Estado BIT NOT NULL,
    CONSTRAINT CK_tbUsuarios_Usro_Estado CHECK ( Usro_Estado IN (0,1))
	);

GO
-- --INSERT #1 DEL ADMIN
--FALTARIA AGREGAR LOS VALORES DE LOS CAMPOS Prsn_Id
INSERT INTO
	Acce.tbUsuarios (
		Usro_Rol,
    Usro_Usuario,
    Usro_Clave,
		Prsn_Id,
		Usro_Creacion,
		Usro_FechaCreacion,
		Usro_Estado
	)
VALUES
	('Admin', 'Admin', 'Admin', 1, 1, GETDATE(), 1);

GO
-- AGREGAMOS LOS CONSTRAINTS PARA Usro_Creacion, Usro_Modifica
ALTER TABLE Acce.tbUsuarios ADD 
CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Creacion FOREIGN KEY (Usro_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
CONSTRAINT FK_tbUsuarios_tbUsuarios_Usro_Modifica FOREIGN KEY (Usro_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id);

GO
CREATE TABLE
	Gene.tbEstadosCiviles (
		EsCi_Id INT IDENTITY (1, 1) PRIMARY KEY,
		EsCi_Descripcion CHAR(1) NOT NULL,
		EsCi_Creacion INT NOT NULL,
		EsCi_FechaCreacion DATETIME NOT NULL,
		EsCi_Modifica INT,
    EsCi_FechaModificacion DATETIME,
		EsCi_Estado BIT NOT NULL,
		CONSTRAINT CK_tbEstadosCiviles_EsCi_Descripcion CHECK (EsCi_Descripcion IN ('S', 'C', 'D', 'V', 'U')),
    CONSTRAINT CK_tbEstadosCiviles_EsCi_Estado CHECK ( EsCi_Estado IN (0,1)),
		CONSTRAINT FK_tbEstadosCiviles_tbUsuarios_Ciud_Creacion FOREIGN KEY (EsCi_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEstadosCiviles_tbUsuarios_Ciud_Modifica FOREIGN KEY (EsCi_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbPersonas (
		Prsn_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Prsn_Nombre VARCHAR(20) NOT NULL,
		Prsn_Apellido VARCHAR(20) NOT NULL,
		Prsn_Sexo CHAR(1) NOT NULL,
		Prsn_FechaNacimiento DATETIME NOT NULL,
		EsCi_Id INT NOT NULL,
		Prsn_Creacion INT NOT NULL,
		Prsn_FechaCreacion DATETIME NOT NULL,
		Prsn_Modifica INT,
    Prsn_FechaModificacion DATETIME,
		Prsn_Estado BIT NOT NULL,
		CONSTRAINT CK_tbPersonas_Prsn_Sexo CHECK (Prsn_Sexo IN ('F', 'M')),
		CONSTRAINT FK_tbPersonas_tbEstadosCiviles_EsCi_Id FOREIGN KEY (EsCi_Id) REFERENCES Gene.tbEstadosCiviles (EsCi_Id),
    CONSTRAINT CK_tbPersonas_Prsn_Estado CHECK ( Prsn_Estado IN (0,1)),
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
CONSTRAINT FK_tbUsuarios_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id)

GO
CREATE TABLE
	Teat.tbEmpleados (
		Empl_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Empl_Puesto VARCHAR(30) NOT NULL,
		Empl_Salario MONEY NOT NULL,
		Prsn_Id INT NOT NULL,
		Empl_Creacion INT NOT NULL,
		Empl_FechaCreacion DATETIME NOT NULL,
		Empl_Modifica INT,
    Empl_FechaModificacion DATETIME NOT NULL,
		Empl_Estado BIT NOT NULL,
		CONSTRAINT FK_tbEmpleados_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id),
    CONSTRAINT CK_tbEmpledos_Empl_Estado CHECK ( Empl_Estado IN (0,1)),
		CONSTRAINT FK_tbEmpleados_tbUsuarios_Empl_Creacion FOREIGN KEY (Empl_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEmpleados_tbUsuarios_Empl_Modifica FOREIGN KEY (Empl_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbEstados (
		Estd_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Estd_Descripcion VARCHAR(20) NOT NULL,
		--auditoria
		Estd_Creacion INT NOT NULL,
		Estd_FechaCreacion DATETIME NOT NULL,
		Estd_Modifica INT,
    Estd_FechaModificacion DATETIME,
		Estd_Estado BIT NOT NULL,
    CONSTRAINT CK_tbEstados_Estd_Estado CHECK ( Estd_Estado IN (0,1)),
		CONSTRAINT FK_tbEstados_tbUsuarios_Estd_Creacion FOREIGN KEY (Estd_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbEstados_tbUsuarios_Estd_Modifica FOREIGN KEY (Estd_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Gene.tbCiudades (
		Ciud_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Ciud_Descripcion VARCHAR(20) NOT NULL,
		Estd_Id INT NOT NULL,
		--auditoria
		Ciud_Creacion INT NOT NULL,
		Ciud_FechaCreacion DATETIME NOT NULL,
		Ciud_Modifica INT,
    Ciud_FechaModificacion DATETIME,
		Ciud_Estado BIT NOT NULL,
		CONSTRAINT FK_tbCiudades_tbEstados_Estd_Id FOREIGN KEY (Estd_Id) REFERENCES Gene.tbEstados (Estd_Id),
    CONSTRAINT CK_tbCiudades_Ciud_Estado CHECK ( Ciud_Estado IN (0,1)),
		CONSTRAINT FK_tbCiudades_tbUsuarios_Ciud_Creacion FOREIGN KEY (Ciud_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbCiudades_tbUsuarios_Ciud_Modifica FOREIGN KEY (Ciud_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbObras (
		Obrs_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Obrs_Descripcion VARCHAR(20) NOT NULL,
		--auditoria
		Obrs_Creacion INT NOT NULL,
		Obrs_FechaCreacion DATETIME NOT NULL,
		Obrs_Modifica INT,
    Obrs_FechaModificacion DATETIME,
		Obrs_Estado BIT NOT NULL,
    CONSTRAINT CK_tbObras_Obrs_Estado CHECK ( Obrs_Estado IN (0,1)),
		CONSTRAINT FK_tbObras_tbUsuarios_Obrs_Creacion FOREIGN KEY (Obrs_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbObras_tbUsuarios_Obrs_Modifica FOREIGN KEY (Obrs_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbParticipantes (
		Prtp_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Prtp_Rol VARCHAR(20) NOT NULL,
		Obrs_Id INT NOT NULL,
		Prsn_Id INT NOT NULL,
		--auditoria
		Prtp_Creacion INT NOT NULL,
		Prtp_FechaCreacion DATETIME NOT NULL,
		Prtp_Modifica INT,
    Prtp_FechaModificacion DATETIME,
		Prtp_Estado BIT NOT NULL,
		CONSTRAINT FK_tbParticipantes_tbPersonas_Prsn_Id FOREIGN KEY (Prsn_Id) REFERENCES Gene.tbPersonas (Prsn_Id),
		CONSTRAINT FK_tbParticipantes_tbObras_Obrs_Id FOREIGN KEY (Obrs_Id) REFERENCES Teat.tbObras (Obrs_Id),
    CONSTRAINT CK_tbParticipantes_Prtp_Estado CHECK ( Prtp_Estado IN (0,1)),
		CONSTRAINT FK_tbParticipantes_tbUsuarios_Prtp_Creacion FOREIGN KEY (Prtp_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbParticipantes_tbUsuarios_Prtp_Modifica FOREIGN KEY (Prtp_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbFunciones (
		Fncs_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Fncs_Fecha DATETIME NOT NULL,
		Obrs_Id INT NOT NULL,
		--auditoria
		Fncs_Creacion INT NOT NULL,
		Fncs_FechaCreacion DATETIME NOT NULL,
		Fncs_Modifica INT,
    Fncs_FechaModificacion DATETIME,
		Fncs_Estado BIT NOT NULL,
		CONSTRAINT FK_tbFunciones_tbObras_Obrs_Id FOREIGN KEY (Obrs_Id) REFERENCES Teat.tbObras (Obrs_Id),
    CONSTRAINT CK_tbFunciones_Fncs_Estado CHECK ( Fncs_Estado IN (0,1)),
		CONSTRAINT FK_tbFunciones_tbUsuarios_Fncs_Creacion FOREIGN KEY (Fncs_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbFunciones_tbUsuarios_Fncs_Modifica FOREIGN KEY (Fncs_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbTeatros (
		Teat_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Teat_Descripcion VARCHAR(20) NOT NULL,
		Ciud_Id INT NOT NULL,
		--auditoria
		Teat_Creacion INT NOT NULL,
		Teat_FechaCreacion DATETIME NOT NULL,
		Teat_Modifica INT,
    Teat_FechaModificacion DATETIME,
		Teat_Estado BIT NOT NULL,
		CONSTRAINT FK_tbTeatros_tbCiudades_Ciud_Id FOREIGN KEY (Ciud_Id) REFERENCES Gene.tbCiudades (Ciud_Id),
    CONSTRAINT CK_tbTeatros_Teat_Estado CHECK ( Teat_Estado IN (0,1)),
		CONSTRAINT FK_tbTeatatros_tbUsuarios_Teat_Creacion FOREIGN KEY (Teat_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbTeatatros_tbUsuarios_Teat_Modifica FOREIGN KEY (Teat_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSalas (
		Sala_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Sala_Descripcion VARCHAR(20) NOT NULL,
		Fncs_Id INT NOT NULL,
		--auditoria
		Sala_Creacion INT NOT NULL,
		Sala_FechaCreacion DATETIME NOT NULL,
		Sala_Modifica INT,
    Sala_FechaModificacion DATETIME,
		Sala_Estado BIT NOT NULL,
		CONSTRAINT FK_tbSalas_tbFunciones_Fncs_Id FOREIGN KEY (Fncs_Id) REFERENCES Teat.tbFunciones (Fncs_Id),
    CONSTRAINT CK_tbSalas_Sala_Estado CHECK ( Sala_Estado IN (0,1)),
		CONSTRAINT FK_tbSalas_tbUsuarios_Sala_Creacion FOREIGN KEY (Sala_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSalas_tbUsuarios_Sala_Modifica FOREIGN KEY (Sala_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSalasPorTeatros (
		SaTe_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Teat_Id INT NOT NULL,
		Sala_Id INT NOT NULL,
		--auditoria
		SaTe_Creacion INT NOT NULL,
		SaTe_FechaCreacion DATETIME NOT NULL,
		SaTe_Modifica INT,
    SaTe_FechaModificacion DATETIME,
		SaTe_Estado BIT NOT NULL,
		CONSTRAINT FK_tbSalasPorTeatros_tbTeatros_Teat_Id FOREIGN KEY (Teat_Id) REFERENCES Teat.tbTeatros (Teat_Id),
		CONSTRAINT FK_tbSalasPorTeatros_tbSalas_Sala_Id FOREIGN KEY (Sala_Id) REFERENCES Teat.tbSalas (Sala_Id),
    CONSTRAINT CK_tbSalasPorTeatros_SaTe_Estado CHECK ( SaTe_Estado IN (0,1)),
		CONSTRAINT FK_tbSalasPorTeatros_tbUsuarios_SaTe_Creacion FOREIGN KEY (SaTe_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSalasPorTeatros_tbUsuarios_SaTe_Modifica FOREIGN KEY (SaTe_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbSecciones (
		Secc_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Secc_Descripcion VARCHAR(20) NOT NULL,
    Secc_Precio MONEY NOT NULL,
		SaTe_Id INT NOT NULL,
		--auditoria
		Secc_Creacion INT NOT NULL,
		Secc_FechaCreacion DATETIME NOT NULL,
		Secc_Modifica INT,
    Secc_FechaModificacion DATETIME,
		Secc_Estado BIT NOT NULL,
		CONSTRAINT FK_tbSecciones_tbSalasPorTeatros_SaTe_Id FOREIGN KEY (SaTe_Id) REFERENCES Teat.tbSalasPorTeatros (SaTe_Id),
    CONSTRAINT CK_tbSecciones_Secc_Estado CHECK ( Secc_Estado IN (0,1)),
		CONSTRAINT FK_tbSecciones_tbUsuarios_Secc_Creacion FOREIGN KEY (Secc_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbSecciones_tbUsuarios_Secc_Modifica FOREIGN KEY (Secc_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbAsientos (
		Asnt_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Asnt_Descripcion VARCHAR(20) NOT NULL,
		Secc_Id INT NOT NULL,
		--auditoria
		Asnt_Creacion INT NOT NULL,
		Asnt_FechaCreacion DATETIME NOT NULL,
		Asnt_Modifica INT,
    Asnt_FechaModificacion DATETIME,
		Asnt_Estado BIT NOT NULL,
		CONSTRAINT FK_tbAsientos_tbSecciones_Secc_Id FOREIGN KEY (Secc_Id) REFERENCES Teat.tbSecciones (Secc_Id),
    CONSTRAINT CK_tbAsientos_Asnt_Estado CHECK ( Asnt_Estado IN (0,1)),
		CONSTRAINT FK_tbAsientos_tbUsuarios_Asnt_Creacion FOREIGN KEY (Asnt_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbAsientos_tbUsuarios_Asnt_Modifica FOREIGN KEY (Asnt_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbAsientosPorSalas (
		AsSa_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Asnt_Id INT NOT NULL,
		SaTe_Id INT NOT NULL,
		--auditoria
		AsSa_Creacion INT NOT NULL,
		AsSa_FechaCreacion DATETIME NOT NULL,
		AsSa_Modifica INT,
    AsSa_FechaModificacion DATETIME,
		AsSa_Estado BIT NOT NULL,
		CONSTRAINT FK_tbAsientosPorSalas_tbAsientos_Asnt_Id FOREIGN KEY (Asnt_Id) REFERENCES Teat.tbAsientos (Asnt_Id),
		CONSTRAINT FK_tbAsientosPorSalas_tbSalasPorTeatros_SaTe_Id FOREIGN KEY (SaTe_Id) REFERENCES Teat.tbSalasPorTeatros (SaTe_Id),
    CONSTRAINT CK_tbAsientosPorSalas_AsSa_Estado CHECK ( AsSa_Estado IN (0,1)),
		CONSTRAINT FK_tbAsientosPorSalas_tbUsuarios_AsSa_Creacion FOREIGN KEY (AsSa_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbAsientosPorSalas_tbUsuarios_AsSa_Modifica FOREIGN KEY (AsSa_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbVentasEncabezado (
		Vnts_Id INT IDENTITY (1, 1) PRIMARY KEY,
		Vnts_Fecha DATETIME NOT NULL,
		--auditoria
		Vnts_Creacion INT NOT NULL,
		Vnts_FechaCreacion DATETIME NOT NULL,
		Vnts_Modifica INT,
    Vnts_FechaModificacion DATETIME,
		Vnts_Estado BIT NOT NULL,
    CONSTRAINT CK_tbVentasEncabezado_Vnts_Estado CHECK ( Vnts_Estado IN (0,1)),
		CONSTRAINT FK_tbVentasEncabezado_tbUsuarios_Vnts_Creacion FOREIGN KEY (Vnts_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbVentasEncabezado_tbUsuarios_Vnts_Modifica FOREIGN KEY (Vnts_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
	Teat.tbVentasDetalle (
		VtDe_Id INT IDENTITY (1, 1) PRIMARY KEY,
    VtDe_Cantidad INT NOT NULL,
		Vnts_Id INT NOT NULL,
		Secc_Id INT NOT NULL,
		Fncs_Id INT NOT NULL,
		--auditoria
		VtDe_Creacion INT NOT NULL,
		VtDe_FechaCreacion DATETIME NOT NULL,
		VtDe_Modifica INT,
    VtDe_FechaModificacion DATETIME,
		VtDe_Estado BIT NOT NULL,
		CONSTRAINT FK_tbVentasDetalle_tbVentasEncabezado_Vnts_Id FOREIGN KEY (Vnts_Id) REFERENCES Teat.tbVentasEncabezado (Vnts_Id),
		CONSTRAINT FK_tbVentasDetalle_tbSecciones_Secc_Id FOREIGN KEY (Secc_Id) REFERENCES Teat.tbSecciones (Secc_Id),
		CONSTRAINT FK_tbVentasDetalle_tbFunciones_Fncs_Id FOREIGN KEY (Fncs_Id) REFERENCES Teat.tbFunciones (Fncs_Id),
    CONSTRAINT CK_tbVentasEncabezado_VtDe_Estado CHECK ( VtDe_Estado IN (0,1)),
		CONSTRAINT FK_tbVentasDetalle_tbUsuarios_VtDe_Creacion FOREIGN KEY (VtDe_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
		CONSTRAINT FK_tbVentasDetalle_tbUsuarios_VtDe_Modifica FOREIGN KEY (VtDe_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
	);

GO
CREATE TABLE
  Teat.tbBoletos (
    Blts_Id INT IDENTITY (1, 1) PRIMARY KEY,
    Blts_Codigo VARCHAR(8) UNIQUE NOT NULL,
    VtDe_Id INT NOT NULL,
    Asnt_Id INT NOT NULL,
    --auditoria
    Blts_Creacion INT NOT NULL,
    Blts_FechaCreacion DATETIME NOT NULL,
    Blts_Modifica INT,
    Blts_FechaModificacion DATETIME,
    Blts_Estado BIT NOT NULL,
    CONSTRAINT FK_tbBoletos_tbVentasDetalle_VtDe_Id FOREIGN KEY (VtDe_Id) REFERENCES Teat.tbVentasDetalle (VtDe_Id),
    CONSTRAINT FK_tbBoletos_tbAsientos_Asnt_Id FOREIGN KEY (Asnt_Id) REFERENCES Teat.tbAsientos (Asnt_Id),
    CONSTRAINT CK_tbBoletos_Blts_Estado CHECK ( Blts_Estado IN (0,1)),
    CONSTRAINT FK_tbBoletos_tbUsuarios_Blts_Creacion FOREIGN KEY (Blts_Creacion) REFERENCES Acce.tbUsuarios (Usro_Id),
    CONSTRAINT FK_tbBoletos_tbUsuarios_Blts_Modifica FOREIGN KEY (Blts_Modifica) REFERENCES Acce.tbUsuarios (Usro_Id)
  );
GO
--INICIO DE PROCEDIMIINETOS ALMACENADOS
--PROCEDIMIENTOS ALMACENADOS DE USUARIOS
CREATE PROCEDURE Acce.sp_InsertarUsuario
    @Usro_Rol VARCHAR(20),
    @Usro_Usuario VARCHAR(20),
    @Usro_Clave VARCHAR(20),
    @Prsn_Id INT,
    @Usro_Creacion INT,
    @Usro_FechaCreacion DATETIME,
    @Usro_Modifica INT,
    @Usro_FechaModificacion DATETIME,
    @Usro_Estado BIT
AS
BEGIN
    INSERT INTO Acce.tbUsuarios (Usro_Rol, Usro_Usuario, Usro_Clave, Prsn_Id, Usro_Creacion, Usro_FechaCreacion, Usro_Modifica, Usro_FechaModificacion, Usro_Estado)
    VALUES (@Usro_Rol, @Usro_Usuario, @Usro_Clave, @Prsn_Id, @Usro_Creacion, @Usro_FechaCreacion, @Usro_Modifica, @Usro_FechaModificacion, @Usro_Estado);
END;
GO -- UPDATE
CREATE PROCEDURE Acce.sp_ActualizarUsuario
    @Usro_Id INT,
    @Usro_Usuario VARCHAR(20),
    @Usro_Clave VARCHAR(20),
    @Usro_Rol VARCHAR(20),
    @Prsn_Id INT,
    @Usro_Modifica INT,
    @Usro_FechaModificacion DATETIME,
    @Usro_Estado BIT
AS
BEGIN
    UPDATE Acce.tbUsuarios
    SET Usro_Rol = @Usro_Rol,
        Usro_Usuario = @Usro_Usuario,
        Usro_Clave = @Usro_Clave,
        Prsn_Id = @Prsn_Id,
        Usro_Modifica = @Usro_Modifica,
        Usro_FechaModificacion = @Usro_FechaModificacion,
        Usro_Estado = @Usro_Estado
    WHERE Usro_Id = @Usro_Id;
END;
GO --DELETE
CREATE PROCEDURE Acce.sp_EliminarUsuario
    @Usro_Id INT
AS
BEGIN
    DELETE FROM Acce.tbUsuarios
    WHERE Usro_Id = @Usro_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS DE ESTADO CIVIL
CREATE PROCEDURE Gene.sp_InsertarEstadoCivil
    @EsCi_Descripcion CHAR,
    @EsCi_Creacion INT,
    @EsCi_FechaCreacion DATETIME,
    @EsCi_Modifica INT,
    @EsCi_FechaModificacion DATETIME,
    @EsCi_Estado BIT
AS
BEGIN
    INSERT INTO Gene.tbEstadosCiviles (EsCi_Descripcion, EsCi_Creacion, EsCi_FechaCreacion, EsCi_Modifica, EsCi_FechaModificacion, EsCi_Estado)
    VALUES (@EsCi_Descripcion, @EsCi_Creacion, @EsCi_FechaCreacion, @EsCi_Modifica, @EsCi_FechaModificacion, @EsCi_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Gene.sp_ActualizarEstadoCivil
    @EsCi_Id INT,
    @EsCi_Descripcion CHAR,
    @EsCi_Modifica INT,
    @EsCi_FechaModificacion DATETIME,
    @EsCi_Estado BIT
AS
BEGIN
    UPDATE Gene.tbEstadosCiviles
    SET EsCi_Descripcion = @EsCi_Descripcion,
        EsCi_Modifica = @EsCi_Modifica,
        EsCi_FechaModificacion = @EsCi_FechaModificacion,
        EsCi_Estado = @EsCi_Estado
    WHERE EsCi_Id = @EsCi_Id;
END;
GO --DELETE
CREATE PROCEDURE Gene.sp_EliminarEstadoCivil
    @EsCi_Id INT
AS
BEGIN
    DELETE FROM Gene.tbEstadosCiviles
    WHERE EsCi_Id = @EsCi_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS DE PERSONAS
CREATE PROCEDURE Gene.sp_InsertarPersona
    @Prsn_Nombre VARCHAR(20),
    @Prsn_Apellido VARCHAR(20),
    @Prsn_Sexo CHAR(1),
    @Prsn_FechaNacimiento DATETIME,
    @EsCi_Id INT,
    @Prsn_Creacion INT,
    @Prsn_FechaCreacion DATETIME,
    @Prsn_Modifica INT,
    @Prsn_FechaModificacion DATETIME,
    @Prsn_Estado BIT
AS
BEGIN
    INSERT INTO Gene.tbPersonas (Prsn_Nombre, Prsn_Apellido, Prsn_Sexo, Prsn_FechaNacimiento, EsCi_Id, Prsn_Creacion, Prsn_FechaCreacion, Prsn_Modifica, Prsn_FechaModificacion, Prsn_Estado)
    VALUES (@Prsn_Nombre, @Prsn_Apellido, @Prsn_Sexo, @Prsn_FechaNacimiento, @EsCi_Id, @Prsn_Creacion, @Prsn_FechaCreacion, @Prsn_Modifica, @Prsn_FechaModificacion, @Prsn_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Gene.sp_ActualizarPersona
    @Prsn_Id INT,
    @Prsn_Nombre VARCHAR(20),
    @Prsn_Apellido VARCHAR(20),
    @Prsn_Sexo CHAR(1),
    @Prsn_FechaNacimiento DATETIME,
    @EsCi_Id INT,
    @Prsn_Modifica INT,
    @Prsn_FechaModificacion DATETIME,
    @Prsn_Estado BIT
AS
BEGIN
    UPDATE Gene.tbPersonas
    SET Prsn_Nombre = @Prsn_Nombre,
        Prsn_Apellido = @Prsn_Apellido,
        Prsn_Sexo = @Prsn_Sexo,
        Prsn_FechaNacimiento = @Prsn_FechaNacimiento,
        EsCi_Id = @EsCi_Id,
        Prsn_Modifica = @Prsn_Modifica,
        Prsn_FechaModificacion = @Prsn_FechaModificacion,
        Prsn_Estado = @Prsn_Estado
    WHERE Prsn_Id = @Prsn_Id;
END;
GO --DELETE
CREATE PROCEDURE Gene.sp_EliminarPersona
    @Prsn_Id INT
AS
BEGIN
    DELETE FROM Gene.tbPersonas
    WHERE Prsn_Id = @Prsn_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS DE EMPLEADOS
CREATE PROCEDURE Teat.sp_InsertarEmpleado
    @Empl_Puesto VARCHAR(30),
    @Empl_Salario MONEY,
    @Prsn_Id INT,
    @Empl_Creacion INT,
    @Empl_FechaCreacion DATETIME,
    @Empl_Modifica INT,
    @Empl_FechaModificacion DATETIME,
    @Empl_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbEmpleados (Empl_Puesto, Empl_Salario, Prsn_Id, Empl_Creacion, Empl_FechaCreacion, Empl_Modifica, Empl_FechaModificacion, Empl_Estado)
    VALUES (@Empl_Puesto, @Empl_Salario, @Prsn_Id, @Empl_Creacion, @Empl_FechaCreacion, @Empl_Modifica, @Empl_FechaModificacion, @Empl_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarEmpleado
    @Empl_Id INT,
    @Empl_Puesto VARCHAR(30),
    @Empl_Salario MONEY,
    @Prsn_Id INT,
    @Empl_Modifica INT,
    @Empl_FechaModificacion DATETIME,
    @Empl_Estado BIT
AS
BEGIN
    UPDATE Teat.tbEmpleados
    SET Empl_Puesto = @Empl_Puesto,
        Empl_Salario = @Empl_Salario,
        Prsn_Id = @Prsn_Id,
        Empl_Modifica = @Empl_Modifica,
        Empl_FechaModificacion = @Empl_FechaModificacion,
        Empl_Estado = @Empl_Estado
    WHERE Empl_Id = @Empl_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarEmpleado
    @Empl_Id INT
AS
BEGIN
    DELETE FROM Teat.tbEmpleados
    WHERE Empl_Id = @Empl_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA ESTADOS
CREATE PROCEDURE Gene.sp_InsertarEstado
    @Estd_Descripcion VARCHAR(20),
    @Estd_Creacion INT,
    @Estd_FechaCreacion DATETIME,
    @Estd_Modifica INT,
    @Estd_FechaModificacion DATETIME,
    @Estd_Estado BIT
AS
BEGIN
    INSERT INTO Gene.tbEstados (Estd_Descripcion, Estd_Creacion, Estd_FechaCreacion, Estd_Modifica, Estd_FechaModificacion, Estd_Estado)
    VALUES (@Estd_Descripcion, @Estd_Creacion, @Estd_FechaCreacion, @Estd_Modifica, @Estd_FechaModificacion, @Estd_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Gene.sp_ActualizarEstado
    @Estd_Id INT,
    @Estd_Descripcion VARCHAR(20),
    @Estd_Modifica INT,
    @Estd_FechaModificacion DATETIME,
    @Estd_Estado BIT
AS
BEGIN
    UPDATE Gene.tbEstados
    SET Estd_Descripcion = @Estd_Descripcion,
        Estd_Modifica = @Estd_Modifica,
        Estd_FechaModificacion = @Estd_FechaModificacion,
        Estd_Estado = @Estd_Estado
    WHERE Estd_Id = @Estd_Id;
END;
GO --DELETE
CREATE PROCEDURE Gene.sp_EliminarEstado
    @Estd_Id INT
AS
BEGIN
    DELETE FROM Gene.tbEstados
    WHERE Estd_Id = @Estd_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS DE CIUDADES
CREATE PROCEDURE Gene.sp_InsertarCiudad
    @Ciud_Descripcion VARCHAR(20),
    @Estd_Id INT,
    @Ciud_Creacion INT,
    @Ciud_FechaCreacion DATETIME,
    @Ciud_Modifica INT,
    @Ciud_FechaModificacion DATETIME,
    @Ciud_Estado BIT
AS
BEGIN
    INSERT INTO Gene.tbCiudades (Ciud_Descripcion, Estd_Id, Ciud_Creacion, Ciud_FechaCreacion, Ciud_Modifica, Ciud_FechaModificacion, Ciud_Estado)
    VALUES (@Ciud_Descripcion, @Estd_Id, @Ciud_Creacion, @Ciud_FechaCreacion, @Ciud_Modifica, @Ciud_FechaModificacion, @Ciud_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Gene.sp_ActualizarCiudad
    @Ciud_Id INT,
    @Ciud_Descripcion VARCHAR(20),
    @Estd_Id INT,
    @Ciud_Modifica INT,
    @Ciud_FechaModificacion DATETIME,
    @Ciud_Estado BIT
AS
BEGIN
    UPDATE Gene.tbCiudades
    SET Ciud_Descripcion = @Ciud_Descripcion,
        Estd_Id = @Estd_Id,
        Ciud_Modifica = @Ciud_Modifica,
        Ciud_FechaModificacion = @Ciud_FechaModificacion,
        Ciud_Estado = @Ciud_Estado
    WHERE Ciud_Id = @Ciud_Id;
END;
GO --DELETE
CREATE PROCEDURE Gene.sp_EliminarCiudad
    @Ciud_Id INT
AS
BEGIN
    DELETE FROM Gene.tbCiudades
    WHERE Ciud_Id = @Ciud_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA OBRAS
CREATE PROCEDURE Teat.sp_InsertarObra
    @Obrs_Descripcion VARCHAR(50),
    @Obrs_Creacion INT,
    @Obrs_FechaCreacion DATETIME,
    @Obrs_Modifica INT,
    @Obrs_FechaModificacion DATETIME,
    @Obrs_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbObras (Obrs_Descripcion, Obrs_Creacion, Obrs_FechaCreacion, Obrs_Modifica, Obrs_FechaModificacion, Obrs_Estado)
    VALUES (@Obrs_Descripcion, @Obrs_Creacion, @Obrs_FechaCreacion, @Obrs_Modifica, @Obrs_FechaModificacion, @Obrs_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarObra
    @Obrs_Id INT,
    @Obrs_Descripcion VARCHAR(50),
    @Obrs_Modifica INT,
    @Obrs_FechaModificacion DATETIME,
    @Obrs_Estado BIT
AS
BEGIN
    UPDATE Teat.tbObras
    SET Obrs_Descripcion = @Obrs_Descripcion,
        Obrs_Modifica = @Obrs_Modifica,
        Obrs_FechaModificacion = @Obrs_FechaModificacion,
        Obrs_Estado = @Obrs_Estado
    WHERE Obrs_Id = @Obrs_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarObra
    @Obrs_Id INT
AS
BEGIN
    DELETE FROM Teat.tbObras
    WHERE Obrs_Id = @Obrs_Id;
END;
GO

--PROCEDIMINETOS ALMACENADOS PARA PARTICIPANTES
CREATE PROCEDURE Teat.sp_InsertarParticipante
    @Prtp_Rol VARCHAR(20),
    @Obrs_Id INT,
    @Prsn_Id INT,
    @Prtp_Creacion INT,
    @Prtp_FechaCreacion DATETIME,
    @Prtp_Modifica INT,
    @Prtp_FechaModificacion DATETIME,
    @Prtp_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbParticipantes (Prtp_Rol, Obrs_Id, Prsn_Id, Prtp_Creacion, Prtp_FechaCreacion, Prtp_Modifica, Prtp_FechaModificacion, Prtp_Estado)
    VALUES (@Prtp_Rol, @Obrs_Id, @Prsn_Id, @Prtp_Creacion, @Prtp_FechaCreacion, @Prtp_Modifica, @Prtp_FechaModificacion, @Prtp_Estado);
END;

GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarParticipante
    @Prtp_Id INT,
    @Prtp_Rol VARCHAR(20),
    @Obrs_Id INT,
    @Prsn_Id INT,
    @Prtp_Modifica INT,
    @Prtp_FechaModificacion DATETIME,
    @Prtp_Estado BIT
AS
BEGIN
    UPDATE Teat.tbParticipantes
    SET Prtp_Rol = @Prtp_Rol,
        Obrs_Id = @Obrs_Id,
        Prsn_Id = @Prsn_Id,
        Prtp_Modifica = @Prtp_Modifica,
        Prtp_FechaModificacion = @Prtp_FechaModificacion,
        Prtp_Estado = @Prtp_Estado
    WHERE Prtp_Id = @Prtp_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarParticipante
    @Prtp_Id INT
AS
BEGIN
    DELETE FROM Teat.tbParticipantes
    WHERE Prtp_Id = @Prtp_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA FUNCIONES
CREATE PROCEDURE Teat.sp_InsertarFuncion
    @Fncs_Fecha DATETIME,
    @Obrs_Id INT,
    @Fncs_Creacion INT,
    @Fncs_FechaCreacion DATETIME,
    @Fncs_Modifica INT,
    @Fncs_FechaModificacion DATETIME,
    @Fncs_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbFunciones (Fncs_Fecha, Obrs_Id, Fncs_Creacion, Fncs_FechaCreacion, Fncs_Modifica, Fncs_FechaModificacion, Fncs_Estado)
    VALUES (@Fncs_Fecha, @Obrs_Id, @Fncs_Creacion, @Fncs_FechaCreacion, @Fncs_Modifica, @Fncs_FechaModificacion, @Fncs_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarFuncion
    @Fncs_Id INT,
    @Fncs_Fecha DATETIME,
    @Obrs_Id INT,
    @Fncs_Modifica INT,
    @Fncs_FechaModificacion DATETIME,
    @Fncs_Estado BIT
AS
BEGIN
    UPDATE Teat.tbFunciones
    SET Fncs_Fecha = @Fncs_Fecha,
        Obrs_Id = @Obrs_Id,
        Fncs_Modifica = @Fncs_Modifica,
        Fncs_FechaModificacion = @Fncs_FechaModificacion,
        Fncs_Estado = @Fncs_Estado
    WHERE Fncs_Id = @Fncs_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarFuncion
    @Fncs_Id INT
AS
BEGIN
    DELETE FROM Teat.tbFunciones
    WHERE Fncs_Id = @Fncs_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA TEATROS
CREATE PROCEDURE Teat.sp_InsertarTeatro
    @Teat_Descripcion VARCHAR(20),
    @Ciud_Id INT,
    @Teat_Creacion INT,
    @Teat_FechaCreacion DATETIME,
    @Teat_Modifica INT,
    @Teat_FechaModificacion DATETIME,
    @Teat_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbTeatros (Teat_Descripcion, Ciud_Id, Teat_Creacion, Teat_FechaCreacion, Teat_Modifica, Teat_FechaModificacion, Teat_Estado)
    VALUES (@Teat_Descripcion, @Ciud_Id, @Teat_Creacion, @Teat_FechaCreacion, @Teat_Modifica, @Teat_FechaModificacion, @Teat_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarTeatro
    @Teat_Id INT,
    @Teat_Descripcion VARCHAR(20),
    @Ciud_Id INT,
    @Teat_Modifica INT,
    @Teat_FechaModificacion DATETIME,
    @Teat_Estado BIT
AS
BEGIN
    UPDATE Teat.tbTeatros
    SET Teat_Descripcion = @Teat_Descripcion,
        Ciud_Id = @Ciud_Id,
        Teat_Modifica = @Teat_Modifica,
        Teat_FechaModificacion = @Teat_FechaModificacion,
        Teat_Estado = @Teat_Estado
    WHERE Teat_Id = @Teat_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarTeatro
    @Teat_Id INT
AS
BEGIN
    DELETE FROM Teat.tbTeatros
    WHERE Teat_Id = @Teat_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA SALAS
CREATE PROCEDURE Teat.sp_InsertarSala
    @Sala_Descripcion VARCHAR(20),
    @Fncs_Id INT,
    @Sala_Creacion INT,
    @Sala_FechaCreacion DATETIME,
    @Sala_Modifica INT,
    @Sala_FechaModificacion DATETIME,
    @Sala_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbSalas (Sala_Descripcion, Fncs_Id, Sala_Creacion, Sala_FechaCreacion, Sala_Modifica, Sala_FechaModificacion, Sala_Estado)
    VALUES (@Sala_Descripcion, @Fncs_Id, @Sala_Creacion, @Sala_FechaCreacion, @Sala_Modifica, @Sala_FechaModificacion, @Sala_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarSala
    @Sala_Id INT,
    @Sala_Descripcion VARCHAR(20),
    @Fncs_Id INT,
    @Sala_Modifica INT,
    @Sala_FechaModificacion DATETIME,
    @Sala_Estado BIT
AS
BEGIN
    UPDATE Teat.tbSalas
    SET Sala_Descripcion = @Sala_Descripcion,
        Fncs_Id = @Fncs_Id,
        Sala_Modifica = @Sala_Modifica,
        Sala_FechaModificacion = @Sala_FechaModificacion,
        Sala_Estado = @Sala_Estado
    WHERE Sala_Id = @Sala_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarSala
    @Sala_Id INT
AS
BEGIN
    DELETE FROM Teat.tbSalas
    WHERE Sala_Id = @Sala_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA SALAS POR TEATROS
CREATE PROCEDURE sp_InsertarSalaPorTeatro
    @Teat_Id INT,
    @Sala_Id INT,
    @SaTe_Creacion INT,
    @SaTe_FechaCreacion DATETIME,
    @SaTe_Modifica INT,
    @SaTe_FechaModificacion DATETIME,
    @SaTe_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbSalasPorTeatros (Teat_Id, Sala_Id, SaTe_Creacion, SaTe_FechaCreacion, SaTe_Modifica, SaTe_FechaModificacion, SaTe_Estado)
    VALUES (@Teat_Id, @Sala_Id, @SaTe_Creacion, @SaTe_FechaCreacion, @SaTe_Modifica, @SaTe_FechaModificacion, @SaTe_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarSalaPorTeatro
    @SaTe_Id INT,
    @Teat_Id INT,
    @Sala_Id INT,
    @SaTe_Modifica INT,
    @SaTe_FechaModificacion DATETIME,
    @SaTe_Estado BIT
AS
BEGIN
    UPDATE Teat.tbSalasPorTeatros
    SET Teat_Id = @Teat_Id,
        Sala_Id = @Sala_Id,
        SaTe_Modifica = @SaTe_Modifica,
        SaTe_FechaModificacion = @SaTe_FechaModificacion,
        SaTe_Estado = @SaTe_Estado
    WHERE SaTe_Id = @SaTe_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarSalaPorTeatro
    @SaTe_Id INT
AS
BEGIN
    DELETE FROM Teat.tbSalasPorTeatros
    WHERE SaTe_Id = @SaTe_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA SECCIONES
CREATE PROCEDURE Teat.sp_InsertarSeccion
    @Secc_Descripcion VARCHAR(20),
    @Secc_Precio MONEY,
    @SaTe_Id INT,
    @Secc_Creacion INT,
    @Secc_FechaCreacion DATETIME,
    @Secc_Modifica INT,
    @Secc_FechaModificacion DATETIME,
    @Secc_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbSecciones (Secc_Descripcion, Secc_Precio, SaTe_Id, Secc_Creacion, Secc_FechaCreacion, Secc_Modifica, Secc_FechaModificacion, Secc_Estado)
    VALUES (@Secc_Descripcion, @Secc_Precio, @SaTe_Id, @Secc_Creacion, @Secc_FechaCreacion, @Secc_Modifica, @Secc_FechaModificacion, @Secc_Estado);
END;
GO--UPDATE
CREATE PROCEDURE Teat.sp_ActualizarSeccion
    @Secc_Id INT,
    @Secc_Descripcion VARCHAR(20),
    @Secc_Precio MONEY,
    @SaTe_Id INT,
    @Secc_Modifica INT,
    @Secc_FechaModificacion DATETIME,
    @Secc_Estado BIT
AS
BEGIN
    UPDATE Teat.tbSecciones
    SET Secc_Descripcion = @Secc_Descripcion,
        Secc_Precio = @Secc_Precio,
        SaTe_Id = @SaTe_Id,
        Secc_Modifica = @Secc_Modifica,
        Secc_FechaModificacion = @Secc_FechaModificacion,
        Secc_Estado = @Secc_Estado
    WHERE Secc_Id = @Secc_Id;
END;
GO--DELETE
CREATE PROCEDURE Teat.sp_EliminarSeccion
    @Secc_Id INT
AS
BEGIN
    DELETE FROM Teat.tbSecciones
    WHERE Secc_Id = @Secc_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA ASIENTOS
CREATE PROCEDURE Teat.sp_InsertarAsiento
    @Asnt_Descripcion VARCHAR(20),
    @Secc_Id INT,
    @Asnt_Creacion INT,
    @Asnt_FechaCreacion DATETIME,
    @Asnt_Modifica INT,
    @Asnt_FechaModificacion DATETIME,
    @Asnt_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbAsientos (Asnt_Descripcion, Secc_Id, Asnt_Creacion, Asnt_FechaCreacion, Asnt_Modifica, Asnt_FechaModificacion, Asnt_Estado)
    VALUES (@Asnt_Descripcion, @Secc_Id, @Asnt_Creacion, @Asnt_FechaCreacion, @Asnt_Modifica, @Asnt_FechaModificacion, @Asnt_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarAsiento
    @Asnt_Id INT,
    @Asnt_Descripcion VARCHAR(20),
    @Secc_Id INT,
    @Asnt_Modifica INT,
    @Asnt_FechaModificacion DATETIME,
    @Asnt_Estado BIT
AS
BEGIN
    UPDATE Teat.tbAsientos
    SET Asnt_Descripcion = @Asnt_Descripcion,
        Secc_Id = @Secc_Id,
        Asnt_Modifica = @Asnt_Modifica,
        Asnt_FechaModificacion = @Asnt_FechaModificacion,
        Asnt_Estado = @Asnt_Estado
    WHERE Asnt_Id = @Asnt_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarAsiento
    @Asnt_Id INT
AS
BEGIN
    DELETE FROM Teat.tbAsientos
    WHERE Asnt_Id = @Asnt_Id;
END;
GO 

--PROCEDIMIENTOS ALMACENADOS PARA ASIENTOS POR SALA
CREATE PROCEDURE Teat.sp_InsertarAsientoPorSala
    @Asnt_Id INT,
    @SaTe_Id INT,
    @AsSa_Creacion INT,
    @AsSa_FechaCreacion DATETIME,
    @AsSa_Modifica INT,
    @AsSa_FechaModificacion DATETIME,
    @AsSa_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbAsientosPorSalas (Asnt_Id, SaTe_Id, AsSa_Creacion, AsSa_FechaCreacion, AsSa_Modifica, AsSa_FechaModificacion, AsSa_Estado)
    VALUES (@Asnt_Id, @SaTe_Id, @AsSa_Creacion, @AsSa_FechaCreacion, @AsSa_Modifica, @AsSa_FechaModificacion, @AsSa_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarAsientoPorSala
    @AsSa_Id INT,
    @Asnt_Id INT,
    @SaTe_Id INT,
    @AsSa_Modifica INT,
    @AsSa_FechaModificacion DATETIME,
    @AsSa_Estado BIT
AS
BEGIN
    UPDATE Teat.tbAsientosPorSalas
    SET Asnt_Id = @Asnt_Id,
        SaTe_Id = @SaTe_Id,
        AsSa_Modifica = @AsSa_Modifica,
        AsSa_FechaModificacion = @AsSa_FechaModificacion, 
        AsSa_Estado = @AsSa_Estado
    WHERE AsSa_Id = @AsSa_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarAsientoPorSala
    @AsSa_Id INT
AS
BEGIN
    DELETE FROM Teat.tbAsientosPorSalas
    WHERE AsSa_Id = @AsSa_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA VENTAS ENCABEZADO
CREATE PROCEDURE Teat.sp_InsertarVentaEncabezado
    @Vnts_Fecha DATETIME,
    @Vnts_Creacion INT,
    @Vnts_FechaCreacion DATETIME,
    @Vnts_Modifica INT,
    @Vnts_FechaModificacion DATETIME,
    @Vnts_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbVentasEncabezado (Vnts_Fecha, Vnts_Creacion, Vnts_FechaCreacion, Vnts_Modifica, Vnts_FechaModificacion, Vnts_Estado)
    VALUES (@Vnts_Fecha, @Vnts_Creacion, @Vnts_FechaCreacion, @Vnts_Modifica, @Vnts_FechaModificacion, @Vnts_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.sp_ActualizarVentaEncabezado
    @Vnts_Id INT,
    @Vnts_Fecha DATETIME,
    @Vnts_Modifica INT,
    @Vnts_FechaModificacion DATETIME,
    @Vnts_Estado BIT
AS
BEGIN
    UPDATE Teat.tbVentasEncabezado
    SET Vnts_Fecha = @Vnts_Fecha,
        Vnts_Modifica = @Vnts_Modifica,
        Vnts_FechaModificacion = @Vnts_FechaModificacion,
        Vnts_Estado = @Vnts_Estado
    WHERE Vnts_Id = @Vnts_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.sp_EliminarVentaEncabezado
    @Vnts_Id INT
AS
BEGIN
    DELETE FROM Teat.tbVentasEncabezado
    WHERE Vnts_Id = @Vnts_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA VENTAS DETALLE
CREATE PROCEDURE Teat.spInsertarVentaDetalle
    @VtDe_Cantidad INT,
    @Vnts_Id INT,
    @Secc_Id INT,
    @Fncs_Id INT,
    @VtDe_Creacion INT,
    @VtDe_FechaCreacion DATETIME,
    @VtDe_Modifica INT,
    @VtDe_FechaModificacion DATETIME,
    @VtDe_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbVentasDetalle (VtDe_Cantidad, Vnts_Id, Secc_Id, Fncs_Id, VtDe_Creacion, VtDe_FechaCreacion, VtDe_Modifica, VtDe_FechaModificacion, VtDe_Estado)
    VALUES (@VtDe_Cantidad, @Vnts_Id, @Secc_Id, @Fncs_Id, @VtDe_Creacion, @VtDe_FechaCreacion, @VtDe_Modifica, @VtDe_FechaModificacion, @VtDe_Estado);
END;
GO --UPDATE
CREATE PROCEDURE spActualizarVentaDetalle
    @VtDe_Id INT,
    @VtDe_Cantidad INT,
    @Vnts_Id INT,
    @Secc_Id INT,
    @Fncs_Id INT,
    @VtDe_Modifica INT,
    @VtDe_FechaModificacion DATETIME,
    @VtDe_Estado BIT
AS
BEGIN
    UPDATE Teat.tbVentasDetalle
    SET VtDe_Cantidad = @VtDe_Cantidad,
        Vnts_Id = @Vnts_Id,
        Secc_Id = @Secc_Id,
        Fncs_Id = @Fncs_Id,
        VtDe_Modifica = @VtDe_Modifica,
        VtDe_FechaModificacion = @VtDe_FechaModificacion,
        VtDe_Estado = @VtDe_Estado
    WHERE VtDe_Id = @VtDe_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.spEliminarVentaDetalle
    @VtDe_Id INT
AS
BEGIN
    DELETE FROM Teat.tbVentasDetalle
    WHERE VtDe_Id = @VtDe_Id;
END;
GO

--PROCEDIMIENTOS ALMACENADOS PARA BOLETOS
CREATE PROCEDURE Teat.spInsertarBoleto
    @Blts_Codigo VARCHAR(8),
    @VtDe_Id INT,
    @Asnt_Id INT,
    @Blts_Creacion INT,
    @Blts_FechaCreacion DATETIME,
    @Blts_Modifica INT,
    @Blts_FechaModificacion DATETIME,
    @Blts_Estado BIT
AS
BEGIN
    INSERT INTO Teat.tbBoletos (Blts_Codigo, VtDe_Id, Asnt_Id, Blts_Creacion, Blts_FechaCreacion, Blts_Modifica, Blts_FechaModificacion, Blts_Estado)
    VALUES (@Blts_Codigo, @VtDe_Id, @Asnt_Id, @Blts_Creacion, @Blts_FechaCreacion, @Blts_Modifica, @Blts_FechaModificacion, @Blts_Estado);
END;
GO --UPDATE
CREATE PROCEDURE Teat.spActualizarBoleto
    @Blts_Id INT,
    @Blts_Codigo VARCHAR(8),
    @VtDe_Id INT,
    @Asnt_Id INT,
    @Blts_Modifica INT,
    @Blts_FechaModificacion DATETIME,
    @Blts_Estado BIT
AS
BEGIN
    UPDATE Teat.tbBoletos
    SET Blts_Codigo = @Blts_Codigo,
        VtDe_Id = @VtDe_Id,
        Asnt_Id = @Asnt_Id,
        Blts_Modifica = @Blts_Modifica,
        Blts_FechaModificacion = @Blts_FechaModificacion,
        Blts_Estado = @Blts_Estado
    WHERE Blts_Id = @Blts_Id;
END;
GO --DELETE
CREATE PROCEDURE Teat.spEliminarBoleto
    @Blts_Id INT
AS
BEGIN
    DELETE FROM Teat.tbBoletos
    WHERE Blts_Id = @Blts_Id;
END;

