USE master
GO
CREATE DATABASE [DB_Tickets]
GO
USE [DB_Tickets]
GO
/****** Object:  User [ADMIN123]    Script Date: 22/2/2024 5:10:04 ******/
CREATE USER [ADMIN123] FOR LOGIN [ADMIN123] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ADMIN123]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ADMIN123]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ADMIN123]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ADMIN123]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ADMIN123]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ADMIN123]
GO
/****** Object:  Schema [Acce]    Script Date: 22/2/2024 5:10:04 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Gene]    Script Date: 22/2/2024 5:10:04 ******/
CREATE SCHEMA [Gene]
GO
/****** Object:  Schema [Teat]    Script Date: 22/2/2024 5:10:04 ******/
CREATE SCHEMA [Teat]
GO
/****** Object:  Table [Acce].[tbBitacoraSecciones]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbBitacoraSecciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [money] NULL,
	[SalaTeatroID] [int] NULL,
	[Estado] [bit] NULL,
	[Cambio] [char](1) NULL,
	[FechaCambio] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuarios](
	[Usro_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usro_Usuario] [varchar](20) NOT NULL,
	[Prsn_Id] [int] NOT NULL,
	[Usro_Creacion] [int] NOT NULL,
	[Usro_FechaCreacion] [datetime] NOT NULL,
	[Usro_Modifica] [int] NULL,
	[Usro_FechaModificacion] [datetime] NULL,
	[Usro_Estado] [bit] NOT NULL,
	[Usro_clave] [varbinary](64) NULL,
	[Ciud_Id] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Usro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gene].[tbCiudades]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gene].[tbCiudades](
	[Ciud_Id] [varchar](4) NOT NULL,
	[Ciud_Descripcion] [varchar](50) NOT NULL,
	[Estd_Id] [varchar](2) NOT NULL,
	[Ciud_Creacion] [int] NOT NULL,
	[Ciud_FechaCreacion] [datetime] NOT NULL,
	[Ciud_Modifica] [int] NULL,
	[Ciud_FechaModificacion] [datetime] NULL,
	[Ciud_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ciud_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gene].[tbEstados]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gene].[tbEstados](
	[Estd_Id] [varchar](2) NOT NULL,
	[Estd_Descripcion] [varchar](50) NOT NULL,
	[Estd_Creacion] [int] NOT NULL,
	[Estd_FechaCreacion] [datetime] NOT NULL,
	[Estd_Modifica] [int] NULL,
	[Estd_FechaModificacion] [datetime] NULL,
	[Estd_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Estd_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gene].[tbEstadosCiviles]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gene].[tbEstadosCiviles](
	[EsCi_Id] [int] IDENTITY(1,1) NOT NULL,
	[EsCi_Descripcion] [varchar](20) NOT NULL,
	[EsCi_Creacion] [int] NOT NULL,
	[EsCi_FechaCreacion] [datetime] NOT NULL,
	[EsCi_Modifica] [int] NULL,
	[EsCi_FechaModificacion] [datetime] NULL,
	[EsCi_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EsCi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gene].[tbPersonas]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gene].[tbPersonas](
	[Prsn_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prsn_Nombre] [varchar](20) NOT NULL,
	[Prsn_Apellido] [varchar](20) NOT NULL,
	[Prsn_Sexo] [char](1) NOT NULL,
	[Prsn_FechaNacimiento] [datetime] NOT NULL,
	[EsCi_Id] [int] NOT NULL,
	[Prsn_Creacion] [int] NOT NULL,
	[Prsn_FechaCreacion] [datetime] NOT NULL,
	[Prsn_Modifica] [int] NULL,
	[Prsn_FechaModificacion] [datetime] NULL,
	[Prsn_Estado] [bit] NOT NULL,
	[Prsn_Identidad] [varchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[Prsn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbAsientos]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbAsientos](
	[Asnt_Id] [int] IDENTITY(1,1) NOT NULL,
	[Asnt_Descripcion] [varchar](20) NOT NULL,
	[Secc_Id] [int] NOT NULL,
	[Asnt_Creacion] [int] NOT NULL,
	[Asnt_FechaCreacion] [datetime] NOT NULL,
	[Asnt_Modifica] [int] NULL,
	[Asnt_FechaModificacion] [datetime] NULL,
	[Asnt_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Asnt_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbAsientosPorSalas]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbAsientosPorSalas](
	[AsSa_Id] [int] IDENTITY(1,1) NOT NULL,
	[Asnt_Id] [int] NOT NULL,
	[SaTe_Id] [int] NOT NULL,
	[AsSa_Creacion] [int] NOT NULL,
	[AsSa_FechaCreacion] [datetime] NOT NULL,
	[AsSa_Modifica] [int] NULL,
	[AsSa_FechaModificacion] [datetime] NULL,
	[AsSa_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AsSa_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbBoletos]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbBoletos](
	[Blts_Id] [int] IDENTITY(1,1) NOT NULL,
	[Blts_Codigo] [varchar](8) NOT NULL,
	[VtDe_Id] [int] NOT NULL,
	[Asnt_Id] [int] NOT NULL,
	[Blts_Creacion] [int] NOT NULL,
	[Blts_FechaCreacion] [datetime] NOT NULL,
	[Blts_Modifica] [int] NULL,
	[Blts_FechaModificacion] [datetime] NULL,
	[Blts_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Blts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbEmpleados]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbEmpleados](
	[Empl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Empl_Puesto] [varchar](30) NOT NULL,
	[Empl_Salario] [money] NOT NULL,
	[Prsn_Id] [int] NOT NULL,
	[Empl_Creacion] [int] NOT NULL,
	[Empl_FechaCreacion] [datetime] NOT NULL,
	[Empl_Modifica] [int] NULL,
	[Empl_FechaModificacion] [datetime] NULL,
	[Empl_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbFunciones]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbFunciones](
	[Fncs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fncs_Fecha] [datetime] NOT NULL,
	[Obrs_Id] [int] NOT NULL,
	[Fncs_Creacion] [int] NOT NULL,
	[Fncs_FechaCreacion] [datetime] NOT NULL,
	[Fncs_Modifica] [int] NULL,
	[Fncs_FechaModificacion] [datetime] NULL,
	[Fncs_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Fncs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbObras]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbObras](
	[Obrs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Obrs_Descripcion] [varchar](50) NOT NULL,
	[Obrs_Creacion] [int] NOT NULL,
	[Obrs_FechaCreacion] [datetime] NOT NULL,
	[Obrs_Modifica] [int] NULL,
	[Obrs_FechaModificacion] [datetime] NULL,
	[Obrs_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Obrs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbParticipantes]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbParticipantes](
	[Prtp_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prtp_Rol] [varchar](20) NOT NULL,
	[Obrs_Id] [int] NOT NULL,
	[Prsn_Id] [int] NOT NULL,
	[Prtp_Creacion] [int] NOT NULL,
	[Prtp_FechaCreacion] [datetime] NOT NULL,
	[Prtp_Modifica] [int] NULL,
	[Prtp_FechaModificacion] [datetime] NULL,
	[Prtp_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prtp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbSalas]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbSalas](
	[Sala_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sala_Descripcion] [varchar](50) NOT NULL,
	[Fncs_Id] [int] NOT NULL,
	[Sala_Creacion] [int] NOT NULL,
	[Sala_FechaCreacion] [datetime] NOT NULL,
	[Sala_Modifica] [int] NULL,
	[Sala_FechaModificacion] [datetime] NULL,
	[Sala_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sala_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbSalasPorTeatros]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbSalasPorTeatros](
	[SaTe_Id] [int] IDENTITY(1,1) NOT NULL,
	[Teat_Id] [int] NOT NULL,
	[Sala_Id] [int] NOT NULL,
	[SaTe_Creacion] [int] NOT NULL,
	[SaTe_FechaCreacion] [datetime] NOT NULL,
	[SaTe_Modifica] [int] NULL,
	[SaTe_FechaModificacion] [datetime] NULL,
	[SaTe_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaTe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbSecciones]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbSecciones](
	[Secc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Secc_Descripcion] [varchar](20) NOT NULL,
	[Secc_Precio] [money] NOT NULL,
	[SaTe_Id] [int] NOT NULL,
	[Secc_Creacion] [int] NOT NULL,
	[Secc_FechaCreacion] [datetime] NOT NULL,
	[Secc_Modifica] [int] NULL,
	[Secc_FechaModificacion] [datetime] NULL,
	[Secc_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Secc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbTeatros]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbTeatros](
	[Teat_Id] [int] IDENTITY(1,1) NOT NULL,
	[Teat_Descripcion] [varchar](50) NOT NULL,
	[Ciud_Id] [varchar](4) NOT NULL,
	[Teat_Creacion] [int] NOT NULL,
	[Teat_FechaCreacion] [datetime] NOT NULL,
	[Teat_Modifica] [int] NULL,
	[Teat_FechaModificacion] [datetime] NULL,
	[Teat_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Teat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbVentasDetalle]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbVentasDetalle](
	[VtDe_Id] [int] IDENTITY(1,1) NOT NULL,
	[VtDe_Cantidad] [int] NOT NULL,
	[Vnts_Id] [int] NOT NULL,
	[Secc_Id] [int] NOT NULL,
	[Fncs_Id] [int] NOT NULL,
	[VtDe_Creacion] [int] NOT NULL,
	[VtDe_FechaCreacion] [datetime] NOT NULL,
	[VtDe_Modifica] [int] NULL,
	[VtDe_FechaModificacion] [datetime] NULL,
	[VtDe_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VtDe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Teat].[tbVentasEncabezado]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Teat].[tbVentasEncabezado](
	[Vnts_Id] [int] IDENTITY(1,1) NOT NULL,
	[Vnts_Fecha] [datetime] NOT NULL,
	[Vnts_Creacion] [int] NOT NULL,
	[Vnts_FechaCreacion] [datetime] NOT NULL,
	[Vnts_Modifica] [int] NULL,
	[Vnts_FechaModificacion] [datetime] NULL,
	[Vnts_Estado] [bit] NOT NULL,
	[Prsn_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Vnts_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usro_Id], [Usro_Usuario], [Prsn_Id], [Usro_Creacion], [Usro_FechaCreacion], [Usro_Modifica], [Usro_FechaModificacion], [Usro_Estado], [Usro_clave], [Ciud_Id]) VALUES (1, N'kevin', 1, 1, CAST(N'2024-02-15T02:00:12.887' AS DateTime), 1, CAST(N'2024-02-18T19:48:59.120' AS DateTime), 1, 0x5DFE55879638E99CC14A1D4730238936207B92050EF3CD24AE64D52D773084485B55B00F835A076BDC8F8C307AB5EB183EAF332867A2B6F47557D913234F2973, N'0801')
INSERT [Acce].[tbUsuarios] ([Usro_Id], [Usro_Usuario], [Prsn_Id], [Usro_Creacion], [Usro_FechaCreacion], [Usro_Modifica], [Usro_FechaModificacion], [Usro_Estado], [Usro_clave], [Ciud_Id]) VALUES (2, N'Dany', 2, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1, 0xC124D64192147446D05957F5A4F0A2A22842C2FB017825F6F32D5327B3602379C8D06691C49EBAAD92E4FF463C2BBEA42859A57686633EC1608FCDAF448C7556, N'0501')
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0101', N'La Ceiba', N'01', 1, CAST(N'2024-02-13T11:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0301', N'Comayagua', N'03', 1, CAST(N'2024-02-13T14:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0404', N'Copan Ruinas', N'04', 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0501', N'San Pedro Sula', N'05', 1, CAST(N'2024-02-13T10:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0601', N'Choluteca', N'06', 1, CAST(N'2024-02-13T13:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'0801', N'Tegucigalpa', N'08', 1, CAST(N'2024-02-13T08:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'1001', N'La Esperanza', N'10', 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'1101', N'Roatán', N'11', 1, CAST(N'2024-02-13T19:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'1301', N'Gracias', N'13', 1, CAST(N'2024-02-13T22:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbCiudades] ([Ciud_Id], [Ciud_Descripcion], [Estd_Id], [Ciud_Creacion], [Ciud_FechaCreacion], [Ciud_Modifica], [Ciud_FechaModificacion], [Ciud_Estado]) VALUES (N'1601', N'Santa Barbara', N'16', 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'01', N'Atlantida', 1, CAST(N'2024-02-13T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'03', N'Comayagua', 1, CAST(N'2024-02-13T10:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'04', N'Copán', 1, CAST(N'2024-02-13T12:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'05', N'Cortes', 1, CAST(N'2024-02-13T09:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'06', N'Choluteca', 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'08', N'Francisco Morazan', 1, CAST(N'2024-02-13T08:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'10', N'Intibucá', 1, CAST(N'2024-02-13T19:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'11', N'Islas de la Bahía', 1, CAST(N'2024-02-13T21:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'13', N'Lempira', 1, CAST(N'2024-02-13T16:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'16', N'Santa Barbara', 1, CAST(N'2024-02-13T18:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'18', N'adios', 1, CAST(N'2024-02-15T04:05:25.697' AS DateTime), 1, CAST(N'2024-02-16T01:28:46.570' AS DateTime), 1)
INSERT [Gene].[tbEstados] ([Estd_Id], [Estd_Descripcion], [Estd_Creacion], [Estd_FechaCreacion], [Estd_Modifica], [Estd_FechaModificacion], [Estd_Estado]) VALUES (N'19', N'adios', 1, CAST(N'2024-02-16T01:28:52.317' AS DateTime), 1, CAST(N'2024-02-16T01:29:07.180' AS DateTime), 1)
GO
SET IDENTITY_INSERT [Gene].[tbEstadosCiviles] ON 

INSERT [Gene].[tbEstadosCiviles] ([EsCi_Id], [EsCi_Descripcion], [EsCi_Creacion], [EsCi_FechaCreacion], [EsCi_Modifica], [EsCi_FechaModificacion], [EsCi_Estado]) VALUES (1, N'Soltero(a)', 1, CAST(N'2024-02-15T02:00:12.930' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstadosCiviles] ([EsCi_Id], [EsCi_Descripcion], [EsCi_Creacion], [EsCi_FechaCreacion], [EsCi_Modifica], [EsCi_FechaModificacion], [EsCi_Estado]) VALUES (2, N'Casado(a)', 1, CAST(N'2024-02-15T02:00:12.930' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstadosCiviles] ([EsCi_Id], [EsCi_Descripcion], [EsCi_Creacion], [EsCi_FechaCreacion], [EsCi_Modifica], [EsCi_FechaModificacion], [EsCi_Estado]) VALUES (3, N'Divorciado(a)', 1, CAST(N'2024-02-15T02:00:12.930' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstadosCiviles] ([EsCi_Id], [EsCi_Descripcion], [EsCi_Creacion], [EsCi_FechaCreacion], [EsCi_Modifica], [EsCi_FechaModificacion], [EsCi_Estado]) VALUES (4, N'Viudo(a)', 1, CAST(N'2024-02-15T02:00:12.930' AS DateTime), NULL, NULL, 1)
INSERT [Gene].[tbEstadosCiviles] ([EsCi_Id], [EsCi_Descripcion], [EsCi_Creacion], [EsCi_FechaCreacion], [EsCi_Modifica], [EsCi_FechaModificacion], [EsCi_Estado]) VALUES (5, N'Union Libre', 1, CAST(N'2024-02-15T02:00:12.930' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gene].[tbEstadosCiviles] OFF
GO
SET IDENTITY_INSERT [Gene].[tbPersonas] ON 

INSERT [Gene].[tbPersonas] ([Prsn_Id], [Prsn_Nombre], [Prsn_Apellido], [Prsn_Sexo], [Prsn_FechaNacimiento], [EsCi_Id], [Prsn_Creacion], [Prsn_FechaCreacion], [Prsn_Modifica], [Prsn_FechaModificacion], [Prsn_Estado], [Prsn_Identidad]) VALUES (1, N'Kevin', N'Mata', N'M', CAST(N'2001-06-25T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-02-15T02:00:12.940' AS DateTime), NULL, NULL, 1, N'0801200120525')
INSERT [Gene].[tbPersonas] ([Prsn_Id], [Prsn_Nombre], [Prsn_Apellido], [Prsn_Sexo], [Prsn_FechaNacimiento], [EsCi_Id], [Prsn_Creacion], [Prsn_FechaCreacion], [Prsn_Modifica], [Prsn_FechaModificacion], [Prsn_Estado], [Prsn_Identidad]) VALUES (2, N'Dany', N'Franco', N'M', CAST(N'2005-05-15T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1, N'0501200530221')
INSERT [Gene].[tbPersonas] ([Prsn_Id], [Prsn_Nombre], [Prsn_Apellido], [Prsn_Sexo], [Prsn_FechaNacimiento], [EsCi_Id], [Prsn_Creacion], [Prsn_FechaCreacion], [Prsn_Modifica], [Prsn_FechaModificacion], [Prsn_Estado], [Prsn_Identidad]) VALUES (3, N'María', N'López', N'F', CAST(N'1985-08-22T00:00:00.000' AS DateTime), 2, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1, N'0404200232224')
INSERT [Gene].[tbPersonas] ([Prsn_Id], [Prsn_Nombre], [Prsn_Apellido], [Prsn_Sexo], [Prsn_FechaNacimiento], [EsCi_Id], [Prsn_Creacion], [Prsn_FechaCreacion], [Prsn_Modifica], [Prsn_FechaModificacion], [Prsn_Estado], [Prsn_Identidad]) VALUES (4, N'Carlos', N'González', N'M', CAST(N'1995-03-10T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1, N'1601200004299')
SET IDENTITY_INSERT [Gene].[tbPersonas] OFF
GO
SET IDENTITY_INSERT [Teat].[tbAsientos] ON 

INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (1, N'Asiento A1', 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (2, N'Asiento B2', 1, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (3, N'Asiento C3', 2, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (4, N'Asiento D4', 2, 1, CAST(N'2024-02-13T18:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (5, N'Asiento E5', 3, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (6, N'Asiento F6', 3, 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (7, N'Asiento G7', 4, 1, CAST(N'2024-02-13T21:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (8, N'Asiento H8', 4, 1, CAST(N'2024-02-13T22:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (9, N'Asiento J9', 5, 1, CAST(N'2024-02-13T21:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientos] ([Asnt_Id], [Asnt_Descripcion], [Secc_Id], [Asnt_Creacion], [Asnt_FechaCreacion], [Asnt_Modifica], [Asnt_FechaModificacion], [Asnt_Estado]) VALUES (10, N'Asiento K10', 5, 1, CAST(N'2024-02-13T22:30:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbAsientos] OFF
GO
SET IDENTITY_INSERT [Teat].[tbAsientosPorSalas] ON 

INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (1, 1, 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (2, 2, 1, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (3, 3, 2, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (4, 4, 2, 1, CAST(N'2024-02-13T18:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (5, 5, 3, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (6, 6, 3, 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (7, 7, 4, 1, CAST(N'2024-02-13T21:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (8, 8, 4, 1, CAST(N'2024-02-13T22:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (9, 9, 5, 1, CAST(N'2024-02-13T21:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbAsientosPorSalas] ([AsSa_Id], [Asnt_Id], [SaTe_Id], [AsSa_Creacion], [AsSa_FechaCreacion], [AsSa_Modifica], [AsSa_FechaModificacion], [AsSa_Estado]) VALUES (10, 10, 5, 1, CAST(N'2024-02-13T22:30:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbAsientosPorSalas] OFF
GO
SET IDENTITY_INSERT [Teat].[tbBoletos] ON 

INSERT [Teat].[tbBoletos] ([Blts_Id], [Blts_Codigo], [VtDe_Id], [Asnt_Id], [Blts_Creacion], [Blts_FechaCreacion], [Blts_Modifica], [Blts_FechaModificacion], [Blts_Estado]) VALUES (1, N'B0001ABC', 1, 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbBoletos] ([Blts_Id], [Blts_Codigo], [VtDe_Id], [Asnt_Id], [Blts_Creacion], [Blts_FechaCreacion], [Blts_Modifica], [Blts_FechaModificacion], [Blts_Estado]) VALUES (2, N'B0002DEF', 2, 2, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbBoletos] ([Blts_Id], [Blts_Codigo], [VtDe_Id], [Asnt_Id], [Blts_Creacion], [Blts_FechaCreacion], [Blts_Modifica], [Blts_FechaModificacion], [Blts_Estado]) VALUES (3, N'B0003GHI', 3, 3, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbBoletos] ([Blts_Id], [Blts_Codigo], [VtDe_Id], [Asnt_Id], [Blts_Creacion], [Blts_FechaCreacion], [Blts_Modifica], [Blts_FechaModificacion], [Blts_Estado]) VALUES (4, N'B0004JKL', 4, 4, 1, CAST(N'2024-02-13T18:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbBoletos] ([Blts_Id], [Blts_Codigo], [VtDe_Id], [Asnt_Id], [Blts_Creacion], [Blts_FechaCreacion], [Blts_Modifica], [Blts_FechaModificacion], [Blts_Estado]) VALUES (5, N'B0005MNO', 5, 5, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbBoletos] OFF
GO
SET IDENTITY_INSERT [Teat].[tbEmpleados] ON 

INSERT [Teat].[tbEmpleados] ([Empl_Id], [Empl_Puesto], [Empl_Salario], [Prsn_Id], [Empl_Creacion], [Empl_FechaCreacion], [Empl_Modifica], [Empl_FechaModificacion], [Empl_Estado]) VALUES (1, N'Asistente', 35000.0000, 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbEmpleados] ([Empl_Id], [Empl_Puesto], [Empl_Salario], [Prsn_Id], [Empl_Creacion], [Empl_FechaCreacion], [Empl_Modifica], [Empl_FechaModificacion], [Empl_Estado]) VALUES (2, N'Gerente', 50000.0000, 2, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbEmpleados] ([Empl_Id], [Empl_Puesto], [Empl_Salario], [Prsn_Id], [Empl_Creacion], [Empl_FechaCreacion], [Empl_Modifica], [Empl_FechaModificacion], [Empl_Estado]) VALUES (3, N'Cajero', 40000.0000, 3, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Teat].[tbFunciones] ON 

INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (1, CAST(N'2024-02-14T15:00:00.000' AS DateTime), 1, 1, CAST(N'2024-02-13T08:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (2, CAST(N'2024-02-14T18:00:00.000' AS DateTime), 2, 1, CAST(N'2024-02-13T10:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (3, CAST(N'2024-02-15T14:30:00.000' AS DateTime), 3, 1, CAST(N'2024-02-13T11:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (4, CAST(N'2024-02-15T17:30:00.000' AS DateTime), 4, 1, CAST(N'2024-02-13T13:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (5, CAST(N'2024-02-16T16:00:00.000' AS DateTime), 5, 1, CAST(N'2024-02-13T14:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (6, CAST(N'2024-02-16T19:00:00.000' AS DateTime), 6, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (7, CAST(N'2024-02-17T18:30:00.000' AS DateTime), 7, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (8, CAST(N'2024-02-17T21:00:00.000' AS DateTime), 8, 1, CAST(N'2024-02-13T19:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (9, CAST(N'2024-02-18T20:30:00.000' AS DateTime), 9, 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (10, CAST(N'2024-02-18T23:00:00.000' AS DateTime), 10, 1, CAST(N'2024-02-13T22:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbFunciones] ([Fncs_Id], [Fncs_Fecha], [Obrs_Id], [Fncs_Creacion], [Fncs_FechaCreacion], [Fncs_Modifica], [Fncs_FechaModificacion], [Fncs_Estado]) VALUES (11, CAST(N'2024-02-12T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-02-15T04:36:59.477' AS DateTime), 1, CAST(N'2024-02-16T02:46:59.363' AS DateTime), 1)
SET IDENTITY_INSERT [Teat].[tbFunciones] OFF
GO
SET IDENTITY_INSERT [Teat].[tbObras] ON 

INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (1, N'Romeo y Julieta', 1, CAST(N'2024-02-13T08:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (2, N'Hamlet', 1, CAST(N'2024-02-13T10:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (3, N'La Odisea', 1, CAST(N'2024-02-13T11:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (4, N'Don Quijote', 1, CAST(N'2024-02-13T13:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (5, N'Cien años de soledad', 1, CAST(N'2024-02-13T14:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (6, N'El Gran Gatsby', 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (7, N'Los Miserables', 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (8, N'El Fantasma', 1, CAST(N'2024-02-13T19:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (9, N'1984', 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (10, N'La Divina Comedia', 1, CAST(N'2024-02-13T22:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (11, N'pedrito', 1, CAST(N'2024-02-15T04:43:45.790' AS DateTime), 1, CAST(N'2024-02-16T00:39:20.593' AS DateTime), 1)
INSERT [Teat].[tbObras] ([Obrs_Id], [Obrs_Descripcion], [Obrs_Creacion], [Obrs_FechaCreacion], [Obrs_Modifica], [Obrs_FechaModificacion], [Obrs_Estado]) VALUES (12, N'rosa', 1, CAST(N'2024-02-15T23:07:13.247' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbObras] OFF
GO
SET IDENTITY_INSERT [Teat].[tbParticipantes] ON 

INSERT [Teat].[tbParticipantes] ([Prtp_Id], [Prtp_Rol], [Obrs_Id], [Prsn_Id], [Prtp_Creacion], [Prtp_FechaCreacion], [Prtp_Modifica], [Prtp_FechaModificacion], [Prtp_Estado]) VALUES (1, N'Actor', 1, 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbParticipantes] ([Prtp_Id], [Prtp_Rol], [Obrs_Id], [Prsn_Id], [Prtp_Creacion], [Prtp_FechaCreacion], [Prtp_Modifica], [Prtp_FechaModificacion], [Prtp_Estado]) VALUES (2, N'Actor', 1, 2, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbParticipantes] ([Prtp_Id], [Prtp_Rol], [Obrs_Id], [Prsn_Id], [Prtp_Creacion], [Prtp_FechaCreacion], [Prtp_Modifica], [Prtp_FechaModificacion], [Prtp_Estado]) VALUES (3, N'Director', 1, 3, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbParticipantes] OFF
GO
SET IDENTITY_INSERT [Teat].[tbSalas] ON 

INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (1, N'Sala Principal', 1, 1, CAST(N'2024-02-13T08:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (2, N'Sala A', 2, 1, CAST(N'2024-02-13T10:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (3, N'Gran Sala', 3, 1, CAST(N'2024-02-13T11:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (4, N'Sala de Actuaciones', 4, 1, CAST(N'2024-02-13T13:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (5, N'Teatro 5D', 5, 1, CAST(N'2024-02-13T14:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (6, N'Sala Ópera', 6, 1, CAST(N'2024-02-13T16:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (7, N'Pequeña Sala', 7, 1, CAST(N'2024-02-13T17:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (8, N'Sala de Proyecciones', 8, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (9, N'Anfiteatro', 9, 1, CAST(N'2024-02-13T20:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalas] ([Sala_Id], [Sala_Descripcion], [Fncs_Id], [Sala_Creacion], [Sala_FechaCreacion], [Sala_Modifica], [Sala_FechaModificacion], [Sala_Estado]) VALUES (10, N'Sala VIP', 10, 1, CAST(N'2024-02-13T22:15:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbSalas] OFF
GO
SET IDENTITY_INSERT [Teat].[tbSalasPorTeatros] ON 

INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (1, 1, 1, 1, CAST(N'2024-02-13T08:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (2, 2, 2, 1, CAST(N'2024-02-13T10:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (3, 3, 3, 1, CAST(N'2024-02-13T11:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (4, 4, 4, 1, CAST(N'2024-02-13T13:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (5, 5, 5, 1, CAST(N'2024-02-13T14:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (6, 6, 6, 1, CAST(N'2024-02-13T16:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (7, 7, 7, 1, CAST(N'2024-02-13T17:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (8, 8, 8, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (9, 9, 9, 1, CAST(N'2024-02-13T20:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSalasPorTeatros] ([SaTe_Id], [Teat_Id], [Sala_Id], [SaTe_Creacion], [SaTe_FechaCreacion], [SaTe_Modifica], [SaTe_FechaModificacion], [SaTe_Estado]) VALUES (10, 10, 10, 1, CAST(N'2024-02-13T22:15:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbSalasPorTeatros] OFF
GO
SET IDENTITY_INSERT [Teat].[tbSecciones] ON 

INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (1, N'VIP', 100.0000, 1, 1, CAST(N'2024-02-13T08:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (2, N'General', 50.0000, 2, 1, CAST(N'2024-02-13T10:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (3, N'Premium', 75.0000, 3, 1, CAST(N'2024-02-13T11:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (4, N'Balcony', 60.0000, 4, 1, CAST(N'2024-02-13T13:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (5, N'Front Row', 120.0000, 5, 1, CAST(N'2024-02-13T14:45:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbSecciones] ([Secc_Id], [Secc_Descripcion], [Secc_Precio], [SaTe_Id], [Secc_Creacion], [Secc_FechaCreacion], [Secc_Modifica], [Secc_FechaModificacion], [Secc_Estado]) VALUES (6, N'old', 120.0000, 2, 1, CAST(N'2024-02-15T02:11:30.717' AS DateTime), 1, CAST(N'2024-02-16T03:44:30.000' AS DateTime), 1)
SET IDENTITY_INSERT [Teat].[tbSecciones] OFF
GO
SET IDENTITY_INSERT [Teat].[tbTeatros] ON 

INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (1, N'Teatro Nacional', N'0801', 1, CAST(N'2024-02-13T08:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (2, N'Teatro La Fragua', N'0501', 1, CAST(N'2024-02-13T10:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (3, N'Teatro Jose Francisc', N'0301', 1, CAST(N'2024-02-13T11:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (4, N'Teatro Roma', N'0601', 1, CAST(N'2024-02-13T13:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (5, N'Teatro Memorias del ', N'0301', 1, CAST(N'2024-02-13T14:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (6, N'Teatro Rubén Darío', N'0404', 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (7, N'Teatro Nacional Manu', N'1001', 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (8, N'Teatro La Concordia', N'1101', 1, CAST(N'2024-02-13T19:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (9, N'Teatro Miguel Calix', N'1601', 1, CAST(N'2024-02-13T20:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (10, N'Teatro Roatan', N'1301', 1, CAST(N'2024-02-13T22:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (13, N'teatrito', N'0801', 1, CAST(N'2024-02-15T03:47:37.373' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbTeatros] ([Teat_Id], [Teat_Descripcion], [Ciud_Id], [Teat_Creacion], [Teat_FechaCreacion], [Teat_Modifica], [Teat_FechaModificacion], [Teat_Estado]) VALUES (14, N'mi teatro', N'1301', 1, CAST(N'2024-02-15T23:50:14.123' AS DateTime), 1, CAST(N'2024-02-16T02:13:54.343' AS DateTime), 1)
SET IDENTITY_INSERT [Teat].[tbTeatros] OFF
GO
SET IDENTITY_INSERT [Teat].[tbVentasDetalle] ON 

INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (1, 2, 1, 1, 1, 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (2, 3, 2, 2, 2, 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (3, 1, 3, 3, 3, 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (4, 2, 4, 1, 1, 1, CAST(N'2024-02-13T18:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (5, 3, 5, 2, 2, 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Teat].[tbVentasDetalle] ([VtDe_Id], [VtDe_Cantidad], [Vnts_Id], [Secc_Id], [Fncs_Id], [VtDe_Creacion], [VtDe_FechaCreacion], [VtDe_Modifica], [VtDe_FechaModificacion], [VtDe_Estado]) VALUES (8, 1, 11, 5, 10, 1, CAST(N'2024-02-21T08:33:44.243' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Teat].[tbVentasDetalle] OFF
GO
SET IDENTITY_INSERT [Teat].[tbVentasEncabezado] ON 

INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), 1, CAST(N'2024-02-13T15:30:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (2, CAST(N'2024-02-13T16:00:00.000' AS DateTime), 1, CAST(N'2024-02-13T16:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (3, CAST(N'2024-02-13T17:30:00.000' AS DateTime), 1, CAST(N'2024-02-13T17:30:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (4, CAST(N'2024-02-13T18:00:00.000' AS DateTime), 1, CAST(N'2024-02-13T18:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (5, CAST(N'2024-02-13T19:15:00.000' AS DateTime), 1, CAST(N'2024-02-13T19:15:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (6, CAST(N'2024-02-21T07:53:42.700' AS DateTime), 1, CAST(N'2024-02-21T07:53:42.700' AS DateTime), NULL, NULL, 1, 1)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (7, CAST(N'2024-02-21T08:09:36.917' AS DateTime), 1, CAST(N'2024-02-21T08:09:36.917' AS DateTime), NULL, NULL, 1, 1)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (8, CAST(N'2024-02-21T08:11:45.850' AS DateTime), 1, CAST(N'2024-02-21T08:11:45.850' AS DateTime), NULL, NULL, 1, 3)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (9, CAST(N'2024-02-21T08:17:59.257' AS DateTime), 1, CAST(N'2024-02-21T08:18:04.427' AS DateTime), NULL, NULL, 1, 3)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (10, CAST(N'2024-02-21T08:28:59.813' AS DateTime), 1, CAST(N'2024-02-21T08:29:00.477' AS DateTime), NULL, NULL, 1, 3)
INSERT [Teat].[tbVentasEncabezado] ([Vnts_Id], [Vnts_Fecha], [Vnts_Creacion], [Vnts_FechaCreacion], [Vnts_Modifica], [Vnts_FechaModificacion], [Vnts_Estado], [Prsn_Id]) VALUES (11, CAST(N'2024-02-21T08:33:02.340' AS DateTime), 1, CAST(N'2024-02-21T08:33:02.653' AS DateTime), NULL, NULL, 1, 3)
SET IDENTITY_INSERT [Teat].[tbVentasEncabezado] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbBoleto__2D6D594D0DF93CA8]    Script Date: 22/2/2024 5:10:04 ******/
ALTER TABLE [Teat].[tbBoletos] ADD UNIQUE NONCLUSTERED 
(
	[Blts_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbCiudades_Ciud_Id] FOREIGN KEY([Ciud_Id])
REFERENCES [Gene].[tbCiudades] ([Ciud_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbCiudades_Ciud_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbPersonas_Prsn_Id] FOREIGN KEY([Prsn_Id])
REFERENCES [Gene].[tbPersonas] ([Prsn_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbPersonas_Prsn_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usro_Creacion] FOREIGN KEY([Usro_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usro_Creacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usro_Modifica] FOREIGN KEY([Usro_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usro_Modifica]
GO
ALTER TABLE [Gene].[tbCiudades]  WITH CHECK ADD  CONSTRAINT [FK_tbCiudades_tbEstados_Estd_Id] FOREIGN KEY([Estd_Id])
REFERENCES [Gene].[tbEstados] ([Estd_Id])
GO
ALTER TABLE [Gene].[tbCiudades] CHECK CONSTRAINT [FK_tbCiudades_tbEstados_Estd_Id]
GO
ALTER TABLE [Gene].[tbCiudades]  WITH CHECK ADD  CONSTRAINT [FK_tbCiudades_tbUsuarios_Ciud_Creacion] FOREIGN KEY([Ciud_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbCiudades] CHECK CONSTRAINT [FK_tbCiudades_tbUsuarios_Ciud_Creacion]
GO
ALTER TABLE [Gene].[tbCiudades]  WITH CHECK ADD  CONSTRAINT [FK_tbCiudades_tbUsuarios_Ciud_Modifica] FOREIGN KEY([Ciud_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbCiudades] CHECK CONSTRAINT [FK_tbCiudades_tbUsuarios_Ciud_Modifica]
GO
ALTER TABLE [Gene].[tbEstados]  WITH CHECK ADD  CONSTRAINT [FK_tbEstados_tbUsuarios_Estd_Creacion] FOREIGN KEY([Estd_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbEstados] CHECK CONSTRAINT [FK_tbEstados_tbUsuarios_Estd_Creacion]
GO
ALTER TABLE [Gene].[tbEstados]  WITH CHECK ADD  CONSTRAINT [FK_tbEstados_tbUsuarios_Estd_Modifica] FOREIGN KEY([Estd_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbEstados] CHECK CONSTRAINT [FK_tbEstados_tbUsuarios_Estd_Modifica]
GO
ALTER TABLE [Gene].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Ciud_Creacion] FOREIGN KEY([EsCi_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Ciud_Creacion]
GO
ALTER TABLE [Gene].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Ciud_Modifica] FOREIGN KEY([EsCi_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Ciud_Modifica]
GO
ALTER TABLE [Gene].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [FK_tbPersonas_tbEstadosCiviles_EsCi_Id] FOREIGN KEY([EsCi_Id])
REFERENCES [Gene].[tbEstadosCiviles] ([EsCi_Id])
GO
ALTER TABLE [Gene].[tbPersonas] CHECK CONSTRAINT [FK_tbPersonas_tbEstadosCiviles_EsCi_Id]
GO
ALTER TABLE [Gene].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [FK_tbPersonas_tbUsuarios_Prsn_Creacion] FOREIGN KEY([Prsn_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbPersonas] CHECK CONSTRAINT [FK_tbPersonas_tbUsuarios_Prsn_Creacion]
GO
ALTER TABLE [Gene].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [FK_tbPersonas_tbUsuarios_Prsn_Modifica] FOREIGN KEY([Prsn_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Gene].[tbPersonas] CHECK CONSTRAINT [FK_tbPersonas_tbUsuarios_Prsn_Modifica]
GO
ALTER TABLE [Teat].[tbAsientos]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientos_tbSecciones_Secc_Id] FOREIGN KEY([Secc_Id])
REFERENCES [Teat].[tbSecciones] ([Secc_Id])
GO
ALTER TABLE [Teat].[tbAsientos] CHECK CONSTRAINT [FK_tbAsientos_tbSecciones_Secc_Id]
GO
ALTER TABLE [Teat].[tbAsientos]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientos_tbUsuarios_Asnt_Creacion] FOREIGN KEY([Asnt_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbAsientos] CHECK CONSTRAINT [FK_tbAsientos_tbUsuarios_Asnt_Creacion]
GO
ALTER TABLE [Teat].[tbAsientos]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientos_tbUsuarios_Asnt_Modifica] FOREIGN KEY([Asnt_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbAsientos] CHECK CONSTRAINT [FK_tbAsientos_tbUsuarios_Asnt_Modifica]
GO
ALTER TABLE [Teat].[tbAsientosPorSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientosPorSalas_tbAsientos_Asnt_Id] FOREIGN KEY([Asnt_Id])
REFERENCES [Teat].[tbAsientos] ([Asnt_Id])
GO
ALTER TABLE [Teat].[tbAsientosPorSalas] CHECK CONSTRAINT [FK_tbAsientosPorSalas_tbAsientos_Asnt_Id]
GO
ALTER TABLE [Teat].[tbAsientosPorSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientosPorSalas_tbSalasPorTeatros_SaTe_Id] FOREIGN KEY([SaTe_Id])
REFERENCES [Teat].[tbSalasPorTeatros] ([SaTe_Id])
GO
ALTER TABLE [Teat].[tbAsientosPorSalas] CHECK CONSTRAINT [FK_tbAsientosPorSalas_tbSalasPorTeatros_SaTe_Id]
GO
ALTER TABLE [Teat].[tbAsientosPorSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientosPorSalas_tbUsuarios_AsSa_Creacion] FOREIGN KEY([AsSa_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbAsientosPorSalas] CHECK CONSTRAINT [FK_tbAsientosPorSalas_tbUsuarios_AsSa_Creacion]
GO
ALTER TABLE [Teat].[tbAsientosPorSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbAsientosPorSalas_tbUsuarios_AsSa_Modifica] FOREIGN KEY([AsSa_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbAsientosPorSalas] CHECK CONSTRAINT [FK_tbAsientosPorSalas_tbUsuarios_AsSa_Modifica]
GO
ALTER TABLE [Teat].[tbBoletos]  WITH CHECK ADD  CONSTRAINT [FK_tbBoletos_tbAsientos_Asnt_Id] FOREIGN KEY([Asnt_Id])
REFERENCES [Teat].[tbAsientos] ([Asnt_Id])
GO
ALTER TABLE [Teat].[tbBoletos] CHECK CONSTRAINT [FK_tbBoletos_tbAsientos_Asnt_Id]
GO
ALTER TABLE [Teat].[tbBoletos]  WITH CHECK ADD  CONSTRAINT [FK_tbBoletos_tbUsuarios_Blts_Creacion] FOREIGN KEY([Blts_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbBoletos] CHECK CONSTRAINT [FK_tbBoletos_tbUsuarios_Blts_Creacion]
GO
ALTER TABLE [Teat].[tbBoletos]  WITH CHECK ADD  CONSTRAINT [FK_tbBoletos_tbUsuarios_Blts_Modifica] FOREIGN KEY([Blts_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbBoletos] CHECK CONSTRAINT [FK_tbBoletos_tbUsuarios_Blts_Modifica]
GO
ALTER TABLE [Teat].[tbBoletos]  WITH CHECK ADD  CONSTRAINT [FK_tbBoletos_tbVentasDetalle_VtDe_Id] FOREIGN KEY([VtDe_Id])
REFERENCES [Teat].[tbVentasDetalle] ([VtDe_Id])
GO
ALTER TABLE [Teat].[tbBoletos] CHECK CONSTRAINT [FK_tbBoletos_tbVentasDetalle_VtDe_Id]
GO
ALTER TABLE [Teat].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbPersonas_Prsn_Id] FOREIGN KEY([Prsn_Id])
REFERENCES [Gene].[tbPersonas] ([Prsn_Id])
GO
ALTER TABLE [Teat].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbPersonas_Prsn_Id]
GO
ALTER TABLE [Teat].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Creacion] FOREIGN KEY([Empl_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Creacion]
GO
ALTER TABLE [Teat].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Modifica] FOREIGN KEY([Empl_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Modifica]
GO
ALTER TABLE [Teat].[tbFunciones]  WITH CHECK ADD  CONSTRAINT [FK_tbFunciones_tbObras_Obrs_Id] FOREIGN KEY([Obrs_Id])
REFERENCES [Teat].[tbObras] ([Obrs_Id])
GO
ALTER TABLE [Teat].[tbFunciones] CHECK CONSTRAINT [FK_tbFunciones_tbObras_Obrs_Id]
GO
ALTER TABLE [Teat].[tbFunciones]  WITH CHECK ADD  CONSTRAINT [FK_tbFunciones_tbUsuarios_Fncs_Creacion] FOREIGN KEY([Fncs_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbFunciones] CHECK CONSTRAINT [FK_tbFunciones_tbUsuarios_Fncs_Creacion]
GO
ALTER TABLE [Teat].[tbFunciones]  WITH CHECK ADD  CONSTRAINT [FK_tbFunciones_tbUsuarios_Fncs_Modifica] FOREIGN KEY([Fncs_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbFunciones] CHECK CONSTRAINT [FK_tbFunciones_tbUsuarios_Fncs_Modifica]
GO
ALTER TABLE [Teat].[tbObras]  WITH CHECK ADD  CONSTRAINT [FK_tbObras_tbUsuarios_Obrs_Creacion] FOREIGN KEY([Obrs_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbObras] CHECK CONSTRAINT [FK_tbObras_tbUsuarios_Obrs_Creacion]
GO
ALTER TABLE [Teat].[tbObras]  WITH CHECK ADD  CONSTRAINT [FK_tbObras_tbUsuarios_Obrs_Modifica] FOREIGN KEY([Obrs_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbObras] CHECK CONSTRAINT [FK_tbObras_tbUsuarios_Obrs_Modifica]
GO
ALTER TABLE [Teat].[tbParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_tbParticipantes_tbObras_Obrs_Id] FOREIGN KEY([Obrs_Id])
REFERENCES [Teat].[tbObras] ([Obrs_Id])
GO
ALTER TABLE [Teat].[tbParticipantes] CHECK CONSTRAINT [FK_tbParticipantes_tbObras_Obrs_Id]
GO
ALTER TABLE [Teat].[tbParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_tbParticipantes_tbPersonas_Prsn_Id] FOREIGN KEY([Prsn_Id])
REFERENCES [Gene].[tbPersonas] ([Prsn_Id])
GO
ALTER TABLE [Teat].[tbParticipantes] CHECK CONSTRAINT [FK_tbParticipantes_tbPersonas_Prsn_Id]
GO
ALTER TABLE [Teat].[tbParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_tbParticipantes_tbUsuarios_Prtp_Creacion] FOREIGN KEY([Prtp_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbParticipantes] CHECK CONSTRAINT [FK_tbParticipantes_tbUsuarios_Prtp_Creacion]
GO
ALTER TABLE [Teat].[tbParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_tbParticipantes_tbUsuarios_Prtp_Modifica] FOREIGN KEY([Prtp_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbParticipantes] CHECK CONSTRAINT [FK_tbParticipantes_tbUsuarios_Prtp_Modifica]
GO
ALTER TABLE [Teat].[tbSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbSalas_tbFunciones_Fncs_Id] FOREIGN KEY([Fncs_Id])
REFERENCES [Teat].[tbFunciones] ([Fncs_Id])
GO
ALTER TABLE [Teat].[tbSalas] CHECK CONSTRAINT [FK_tbSalas_tbFunciones_Fncs_Id]
GO
ALTER TABLE [Teat].[tbSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbSalas_tbUsuarios_Sala_Creacion] FOREIGN KEY([Sala_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSalas] CHECK CONSTRAINT [FK_tbSalas_tbUsuarios_Sala_Creacion]
GO
ALTER TABLE [Teat].[tbSalas]  WITH CHECK ADD  CONSTRAINT [FK_tbSalas_tbUsuarios_Sala_Modifica] FOREIGN KEY([Sala_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSalas] CHECK CONSTRAINT [FK_tbSalas_tbUsuarios_Sala_Modifica]
GO
ALTER TABLE [Teat].[tbSalasPorTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbSalasPorTeatros_tbSalas_Sala_Id] FOREIGN KEY([Sala_Id])
REFERENCES [Teat].[tbSalas] ([Sala_Id])
GO
ALTER TABLE [Teat].[tbSalasPorTeatros] CHECK CONSTRAINT [FK_tbSalasPorTeatros_tbSalas_Sala_Id]
GO
ALTER TABLE [Teat].[tbSalasPorTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbSalasPorTeatros_tbTeatros_Teat_Id] FOREIGN KEY([Teat_Id])
REFERENCES [Teat].[tbTeatros] ([Teat_Id])
GO
ALTER TABLE [Teat].[tbSalasPorTeatros] CHECK CONSTRAINT [FK_tbSalasPorTeatros_tbTeatros_Teat_Id]
GO
ALTER TABLE [Teat].[tbSalasPorTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbSalasPorTeatros_tbUsuarios_SaTe_Creacion] FOREIGN KEY([SaTe_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSalasPorTeatros] CHECK CONSTRAINT [FK_tbSalasPorTeatros_tbUsuarios_SaTe_Creacion]
GO
ALTER TABLE [Teat].[tbSalasPorTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbSalasPorTeatros_tbUsuarios_SaTe_Modifica] FOREIGN KEY([SaTe_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSalasPorTeatros] CHECK CONSTRAINT [FK_tbSalasPorTeatros_tbUsuarios_SaTe_Modifica]
GO
ALTER TABLE [Teat].[tbSecciones]  WITH CHECK ADD  CONSTRAINT [FK_tbSecciones_tbSalasPorTeatros_SaTe_Id] FOREIGN KEY([SaTe_Id])
REFERENCES [Teat].[tbSalasPorTeatros] ([SaTe_Id])
GO
ALTER TABLE [Teat].[tbSecciones] CHECK CONSTRAINT [FK_tbSecciones_tbSalasPorTeatros_SaTe_Id]
GO
ALTER TABLE [Teat].[tbSecciones]  WITH CHECK ADD  CONSTRAINT [FK_tbSecciones_tbUsuarios_Secc_Creacion] FOREIGN KEY([Secc_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSecciones] CHECK CONSTRAINT [FK_tbSecciones_tbUsuarios_Secc_Creacion]
GO
ALTER TABLE [Teat].[tbSecciones]  WITH CHECK ADD  CONSTRAINT [FK_tbSecciones_tbUsuarios_Secc_Modifica] FOREIGN KEY([Secc_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbSecciones] CHECK CONSTRAINT [FK_tbSecciones_tbUsuarios_Secc_Modifica]
GO
ALTER TABLE [Teat].[tbTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbTeatatros_tbUsuarios_Teat_Creacion] FOREIGN KEY([Teat_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbTeatros] CHECK CONSTRAINT [FK_tbTeatatros_tbUsuarios_Teat_Creacion]
GO
ALTER TABLE [Teat].[tbTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbTeatatros_tbUsuarios_Teat_Modifica] FOREIGN KEY([Teat_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbTeatros] CHECK CONSTRAINT [FK_tbTeatatros_tbUsuarios_Teat_Modifica]
GO
ALTER TABLE [Teat].[tbTeatros]  WITH CHECK ADD  CONSTRAINT [FK_tbTeatros_tbCiudades_Ciud_Id] FOREIGN KEY([Ciud_Id])
REFERENCES [Gene].[tbCiudades] ([Ciud_Id])
GO
ALTER TABLE [Teat].[tbTeatros] CHECK CONSTRAINT [FK_tbTeatros_tbCiudades_Ciud_Id]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbFunciones_Fncs_Id] FOREIGN KEY([Fncs_Id])
REFERENCES [Teat].[tbFunciones] ([Fncs_Id])
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbFunciones_Fncs_Id]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbSecciones_Secc_Id] FOREIGN KEY([Secc_Id])
REFERENCES [Teat].[tbSecciones] ([Secc_Id])
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbSecciones_Secc_Id]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_VtDe_Creacion] FOREIGN KEY([VtDe_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_VtDe_Creacion]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_VtDe_Modifica] FOREIGN KEY([VtDe_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_VtDe_Modifica]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbVentasEncabezado_Vnts_Id] FOREIGN KEY([Vnts_Id])
REFERENCES [Teat].[tbVentasEncabezado] ([Vnts_Id])
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbVentasEncabezado_Vnts_Id]
GO
ALTER TABLE [Teat].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbPersonas_Prsn_Id] FOREIGN KEY([Prsn_Id])
REFERENCES [Gene].[tbPersonas] ([Prsn_Id])
GO
ALTER TABLE [Teat].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbPersonas_Prsn_Id]
GO
ALTER TABLE [Teat].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Vnts_Creacion] FOREIGN KEY([Vnts_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Vnts_Creacion]
GO
ALTER TABLE [Teat].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Vnts_Modifica] FOREIGN KEY([Vnts_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usro_Id])
GO
ALTER TABLE [Teat].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Vnts_Modifica]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [CK_tbUsuarios_Usro_Estado] CHECK  (([Usro_Estado]=(1) OR [Usro_Estado]=(0)))
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [CK_tbUsuarios_Usro_Estado]
GO
ALTER TABLE [Gene].[tbCiudades]  WITH CHECK ADD  CONSTRAINT [CK_tbCiudades_Ciud_Estado] CHECK  (([Ciud_Estado]=(1) OR [Ciud_Estado]=(0)))
GO
ALTER TABLE [Gene].[tbCiudades] CHECK CONSTRAINT [CK_tbCiudades_Ciud_Estado]
GO
ALTER TABLE [Gene].[tbEstados]  WITH CHECK ADD  CONSTRAINT [CK_tbEstados_Estd_Estado] CHECK  (([Estd_Estado]=(1) OR [Estd_Estado]=(0)))
GO
ALTER TABLE [Gene].[tbEstados] CHECK CONSTRAINT [CK_tbEstados_Estd_Estado]
GO
ALTER TABLE [Gene].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [CK_tbEstadosCiviles_EsCi_Estado] CHECK  (([EsCi_Estado]=(1) OR [EsCi_Estado]=(0)))
GO
ALTER TABLE [Gene].[tbEstadosCiviles] CHECK CONSTRAINT [CK_tbEstadosCiviles_EsCi_Estado]
GO
ALTER TABLE [Gene].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_Prsn_Estado] CHECK  (([Prsn_Estado]=(1) OR [Prsn_Estado]=(0)))
GO
ALTER TABLE [Gene].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_Prsn_Estado]
GO
ALTER TABLE [Gene].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_Prsn_Sexo] CHECK  (([Prsn_Sexo]='M' OR [Prsn_Sexo]='F'))
GO
ALTER TABLE [Gene].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_Prsn_Sexo]
GO
ALTER TABLE [Teat].[tbAsientos]  WITH CHECK ADD  CONSTRAINT [CK_tbAsientos_Asnt_Estado] CHECK  (([Asnt_Estado]=(1) OR [Asnt_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbAsientos] CHECK CONSTRAINT [CK_tbAsientos_Asnt_Estado]
GO
ALTER TABLE [Teat].[tbAsientosPorSalas]  WITH CHECK ADD  CONSTRAINT [CK_tbAsientosPorSalas_AsSa_Estado] CHECK  (([AsSa_Estado]=(1) OR [AsSa_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbAsientosPorSalas] CHECK CONSTRAINT [CK_tbAsientosPorSalas_AsSa_Estado]
GO
ALTER TABLE [Teat].[tbBoletos]  WITH CHECK ADD  CONSTRAINT [CK_tbBoletos_Blts_Estado] CHECK  (([Blts_Estado]=(1) OR [Blts_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbBoletos] CHECK CONSTRAINT [CK_tbBoletos_Blts_Estado]
GO
ALTER TABLE [Teat].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [CK_tbEmpledos_Empl_Estado] CHECK  (([Empl_Estado]=(1) OR [Empl_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbEmpleados] CHECK CONSTRAINT [CK_tbEmpledos_Empl_Estado]
GO
ALTER TABLE [Teat].[tbFunciones]  WITH CHECK ADD  CONSTRAINT [CK_tbFunciones_Fncs_Estado] CHECK  (([Fncs_Estado]=(1) OR [Fncs_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbFunciones] CHECK CONSTRAINT [CK_tbFunciones_Fncs_Estado]
GO
ALTER TABLE [Teat].[tbObras]  WITH CHECK ADD  CONSTRAINT [CK_tbObras_Obrs_Estado] CHECK  (([Obrs_Estado]=(1) OR [Obrs_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbObras] CHECK CONSTRAINT [CK_tbObras_Obrs_Estado]
GO
ALTER TABLE [Teat].[tbParticipantes]  WITH CHECK ADD  CONSTRAINT [CK_tbParticipantes_Prtp_Estado] CHECK  (([Prtp_Estado]=(1) OR [Prtp_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbParticipantes] CHECK CONSTRAINT [CK_tbParticipantes_Prtp_Estado]
GO
ALTER TABLE [Teat].[tbSalas]  WITH CHECK ADD  CONSTRAINT [CK_tbSalas_Sala_Estado] CHECK  (([Sala_Estado]=(1) OR [Sala_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbSalas] CHECK CONSTRAINT [CK_tbSalas_Sala_Estado]
GO
ALTER TABLE [Teat].[tbSalasPorTeatros]  WITH CHECK ADD  CONSTRAINT [CK_tbSalasPorTeatros_SaTe_Estado] CHECK  (([SaTe_Estado]=(1) OR [SaTe_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbSalasPorTeatros] CHECK CONSTRAINT [CK_tbSalasPorTeatros_SaTe_Estado]
GO
ALTER TABLE [Teat].[tbSecciones]  WITH CHECK ADD  CONSTRAINT [CK_tbSecciones_Secc_Estado] CHECK  (([Secc_Estado]=(1) OR [Secc_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbSecciones] CHECK CONSTRAINT [CK_tbSecciones_Secc_Estado]
GO
ALTER TABLE [Teat].[tbTeatros]  WITH CHECK ADD  CONSTRAINT [CK_tbTeatros_Teat_Estado] CHECK  (([Teat_Estado]=(1) OR [Teat_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbTeatros] CHECK CONSTRAINT [CK_tbTeatros_Teat_Estado]
GO
ALTER TABLE [Teat].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [CK_tbVentasEncabezado_VtDe_Estado] CHECK  (([VtDe_Estado]=(1) OR [VtDe_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbVentasDetalle] CHECK CONSTRAINT [CK_tbVentasEncabezado_VtDe_Estado]
GO
ALTER TABLE [Teat].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [CK_tbVentasEncabezado_Vnts_Estado] CHECK  (([Vnts_Estado]=(1) OR [Vnts_Estado]=(0)))
GO
ALTER TABLE [Teat].[tbVentasEncabezado] CHECK CONSTRAINT [CK_tbVentasEncabezado_Vnts_Estado]
GO
/****** Object:  StoredProcedure [Acce].[sp_UsuarioActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- UPDATE
CREATE PROCEDURE [Acce].[sp_UsuarioActualizar]
    @Usro_Id INT,
    @Usro_Usuario VARCHAR(20),
    @Usro_Clave VARCHAR(20),
    @Prsn_Id INT,
	@Ciud_Id VARCHAR(2),
    @Usro_Modifica INT,
    @Usro_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Acce.tbUsuarios
    SET
        Usro_Usuario = @Usro_Usuario,
        Usro_Clave = HASHBYTES('SHA2_512', @Usro_Clave),
        Prsn_Id = @Prsn_Id,
		Ciud_Id = @Ciud_Id,
        Usro_Modifica = @Usro_Modifica,
        Usro_FechaModificacion = @Usro_FechaModificacion
    WHERE Usro_Id = @Usro_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_UsuarioBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INICIO DE PROCEDIMIINETOS ALMACENADOS
--PROCEDIMIENTOS ALMACENADOS DE USUARIOS
--SELECT
CREATE PROCEDURE [Acce].[sp_UsuarioBuscar]
@Usro_Id INT
AS
BEGIN
    SELECT
        u.Usro_Id AS ID,
        u.Usro_Usuario AS USUARIO,
        u.Usro_Clave AS CLAVE,
		P.prsn_Id AS NOMBRE_ID,
        CONCAT(p.Prsn_Nombre,' ', p.Prsn_Apellido) AS NOMBRE
    FROM Acce.tbUsuarios AS u
    JOIN Gene.tbPersonas AS p ON u.prsn_id = p.prsn_id
    WHERE u.Usro_Estado = 1 AND u.Usro_Id = @Usro_Id;
END;

GO
/****** Object:  StoredProcedure [Acce].[sp_UsuarioEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_UsuarioEliminar]
    @Usro_Id INT
AS
BEGIN
    UPDATE Acce.tbUsuarios 
	SET Usro_Estado = 0
    WHERE Usro_Id = @Usro_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_UsuarioInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_UsuarioInsertar]
    @Usro_Usuario VARCHAR(20),
    @Usro_Clave VARCHAR(20),
    @Prsn_Id INT,
	@Ciud_Id VARCHAR(4),
    @Usro_Creacion INT,
    @Usro_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Acce.tbUsuarios (Usro_Usuario, Usro_Clave, Prsn_Id, Ciud_Id, Usro_Creacion, Usro_FechaCreacion, Usro_Estado)
    VALUES (@Usro_Usuario, HASHBYTES('SHA2_512', @Usro_Clave), @Prsn_Id, @Ciud_Id, @Usro_Creacion, @Usro_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_UsuarioObtenerNombre]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA CONSEGUIR EL NOMBRE DE USUARIO
CREATE PROCEDURE [Acce].[sp_UsuarioObtenerNombre]
  @Usro_Usuario VARCHAR(20),
  @Usro_Clave VARCHAR(20)
AS
BEGIN
SELECT Usro_Id, 
CONCAT(Prsn.Prsn_Nombre, ' ', Prsn.Prsn_Apellido) AS NOMBRE,
Ciud_Id
FROM Acce.tbUsuarios AS Usro
INNER JOIN Gene.tbPersonas AS Prsn ON Prsn.Prsn_Id = Usro.Prsn_Id
WHERE Usro.Usro_Usuario = @Usro_Usuario AND Usro.Usro_Clave = HASHBYTES('SHA2_512', @Usro_Clave) AND Usro.Usro_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_UsuariosMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Acce].[sp_UsuariosMostrar]
AS
BEGIN
SELECT Usro_Id AS ID,
CONCAT(p.Prsn_Nombre,' ', p.Prsn_Apellido) AS NOMBRE,
Usro_Usuario AS USUARIO,
Usro_Clave AS CLAVE
FROM Acce.tbUsuarios u
JOIN Gene.tbPersonas p ON u.Prsn_Id = p.Prsn_Id
WHERE Usro_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_CiudadActualizar]
    @Ciud_Id VARCHAR(4),
    @Ciud_Descripcion VARCHAR(20),
    @Estd_Id VARCHAR(2),
    @Ciud_Modifica INT,
    @Ciud_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Gene.tbCiudades
    SET Ciud_Descripcion = @Ciud_Descripcion,
        Estd_Id = @Estd_Id,
        Ciud_Modifica = @Ciud_Modifica,
        Ciud_FechaModificacion = @Ciud_FechaModificacion
    WHERE Ciud_Id = @Ciud_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_CiudadBuscar]
@id int
AS
BEGIN
SELECT Ciud_Id AS ID, Ciud_Descripcion, Estd_Id
FROM Gene.tbCiudades
WHERE Ciud_Estado = 1 and Ciud_Id = @id
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_CiudadEliminar]
    @Ciud_Id INT
AS
BEGIN
    UPDATE Gene.tbCiudades
	SET Ciud_Estado = 0
    WHERE Ciud_Id = @Ciud_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadesDdl]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_CiudadesDdl]
@Estd_Id INT
AS
BEGIN
SELECT Ciud_Id AS ID, Ciud_Descripcion
FROM Gene.tbCiudades c
JOIN Gene.tbEstados  e ON e.Estd_Id = c.Estd_Id
WHERE Ciud_Estado = 1 AND c.Estd_Id = @Estd_Id
ORDER BY Ciud_Descripcion
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadesMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_CiudadesMostrar]
AS
BEGIN
SELECT Ciud_Id AS ID, Ciud_Descripcion, c.Estd_Id AS Estd_Id, e.Estd_Descripcion AS Estd_Descripcion
FROM Gene.tbCiudades c
JOIN  Gene.tbEstados e ON c.Estd_Id = e.Estd_Id
WHERE Ciud_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_CiudadInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS DE CIUDADES


CREATE PROCEDURE [Gene].[sp_CiudadInsertar]
    @Ciud_Id VARCHAR(4), 
    @Ciud_Descripcion VARCHAR(20),
    @Estd_Id VARCHAR(2),
    @Ciud_Creacion INT,
    @Ciud_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Gene.tbCiudades (Ciud_Id, Ciud_Descripcion, Estd_Id, Ciud_Creacion, Ciud_FechaCreacion, Ciud_Estado)
    VALUES (@Ciud_Id, @Ciud_Descripcion, @Estd_Id, @Ciud_Creacion, @Ciud_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadoActualizar]
    @Estd_Id VARCHAR(2),
    @Estd_Descripcion VARCHAR(20),
    @Estd_Modifica INT,
    @Estd_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Gene.tbEstados
    SET Estd_Descripcion = @Estd_Descripcion,
        Estd_Modifica = @Estd_Modifica,
        Estd_FechaModificacion = @Estd_FechaModificacion
    WHERE Estd_Id = @Estd_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadoBuscar]
@id int
AS
BEGIN
SELECT Estd_Id AS ID, Estd_Descripcion
FROM Gene.tbEstados
WHERE Estd_Estado = 1 AND Estd_Id = @id
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoCivilActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadoCivilActualizar]
    @EsCi_Id INT,
    @EsCi_Descripcion CHAR,
    @EsCi_Modifica INT,
    @EsCi_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Gene.tbEstadosCiviles
    SET EsCi_Descripcion = @EsCi_Descripcion,
        EsCi_Modifica = @EsCi_Modifica,
        EsCi_FechaModificacion = @EsCi_FechaModificacion
    WHERE EsCi_Id = @EsCi_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoCivilEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadoCivilEliminar]
    @EsCi_Id INT
AS
BEGIN
    UPDATE Gene.tbEstadosCiviles
    SET EsCi_Estado = 0
	WHERE EsCi_Id = @EsCi_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoCivilInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT
CREATE PROCEDURE [Gene].[sp_EstadoCivilInsertar]
    @EsCi_Descripcion CHAR,
    @EsCi_Creacion INT,
    @EsCi_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Gene.tbEstadosCiviles (EsCi_Descripcion, EsCi_Creacion, EsCi_FechaCreacion, EsCi_Estado)
    VALUES (@EsCi_Descripcion, @EsCi_Creacion, @EsCi_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadoEliminar]
    @Estd_Id INT
AS
BEGIN
    UPDATE Gene.tbEstados
	SET Estd_Estado = 0
    WHERE Estd_Id = @Estd_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadoInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gene].[sp_EstadoInsertar]
    @Estd_Id VARCHAR(2),
    @Estd_Descripcion VARCHAR(20),
    @Estd_Creacion INT,
    @Estd_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Gene.tbEstados (Estd_Id, Estd_Descripcion, Estd_Creacion, Estd_FechaCreacion, Estd_Estado)
    VALUES (@Estd_Id, @Estd_Descripcion, @Estd_Creacion, @Estd_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadosBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA ESTADOS
--SELECT
CREATE PROCEDURE [Gene].[sp_EstadosBuscar]
AS
BEGIN
    SELECT Estd_Id, Estd_Descripcion, CONCAT(P.Prsn_Nombre, ' ', P.Prsn_Apellido) AS Creador, Estd_FechaCreacion, CONCAT(P2.Prsn_Nombre, ' ', P2.Prsn_Apellido) AS Modificador, CASE WHEN Estd_FechaModificacion IS NULL THEN ''  END AS [Fecha Modificacion]
    FROM Gene.tbEstados AS es
    JOIN Acce.tbUsuarios AS u ON es.Estd_Creacion = u.Usro_Id
    JOIN Gene.tbPersonas AS p ON u.prsn_id = p.prsn_id
    LEFT JOIN Acce.tbUsuarios AS u2 ON es.Estd_Modifica = u2.Usro_Id
    LEFT JOIN Gene.tbPersonas AS p2 ON u2.prsn_id = p2.prsn_id
    WHERE Estd_Estado = 1;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadosCivilBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadosCivilBuscar]
@id int
AS
BEGIN
SELECT Esci_Id AS ID, EsCi_Descripcion
FROM Gene.tbEstadosCiviles
WHERE EsCi_Estado = 1 and EsCi_Id = @id
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadosCivilesMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadosCivilesMostrar]
AS
BEGIN
SELECT Esci_Id AS ID, EsCi_Descripcion
FROM Gene.tbEstadosCiviles
WHERE EsCi_Estado = 1
order by EsCi_Descripcion
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_EstadosMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_EstadosMostrar]
AS
BEGIN
SELECT Estd_Id AS ID, Estd_Descripcion
FROM Gene.tbEstados
WHERE Estd_Estado = 1
ORDER BY Estd_Descripcion
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonaActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_PersonaActualizar]
    @Prsn_Id INT,
    @Prsn_Nombre VARCHAR(20),
    @Prsn_Apellido VARCHAR(20),
    @Prsn_Sexo CHAR(1),
    @Prsn_FechaNacimiento DATETIME,
    @EsCi_Id INT,
    @Prsn_Modifica INT,
    @Prsn_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Gene.tbPersonas
    SET Prsn_Nombre = @Prsn_Nombre,
        Prsn_Apellido = @Prsn_Apellido,
        Prsn_Sexo = @Prsn_Sexo,
        Prsn_FechaNacimiento = @Prsn_FechaNacimiento,
        EsCi_Id = @EsCi_Id,
        Prsn_Modifica = @Prsn_Modifica,
        Prsn_FechaModificacion = @Prsn_FechaModificacion
    WHERE Prsn_Id = @Prsn_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonaBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Gene].[sp_PersonaBuscar]
@id int
AS
BEGIN
SELECT Prsn_Id AS ID,
Prsn_Nombre,
Prsn_Apellido,
Prsn_Sexo,
Prsn_FechaNacimiento,
p.EsCi_Id AS EsCi_Id,
ec.EsCi_Descripcion AS EsCi_Descripcion
FROM Gene.tbPersonas p
join Gene.tbEstadosCiviles ec on p.EsCi_Id = ec.EsCi_Id 
WHERE Prsn_Estado = 1 and Prsn_Id =@id
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonaEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_PersonaEliminar]
    @Prsn_Id INT
AS
BEGIN
    UPDATE Gene.tbPersonas
    SET Prsn_Estado = 0
	WHERE Prsn_Id = @Prsn_Id;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonaInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT
CREATE PROCEDURE [Gene].[sp_PersonaInsertar]
    @Prsn_Nombre VARCHAR(20),
    @Prsn_Apellido VARCHAR(20),
    @Prsn_Sexo CHAR(1),
    @Prsn_FechaNacimiento DATETIME,
    @EsCi_Id INT,
    @Prsn_Creacion INT,
    @Prsn_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Gene.tbPersonas (Prsn_Nombre, Prsn_Apellido, Prsn_Sexo, Prsn_FechaNacimiento, EsCi_Id, Prsn_Creacion, Prsn_FechaCreacion, Prsn_Estado)
    VALUES (@Prsn_Nombre, @Prsn_Apellido, @Prsn_Sexo, @Prsn_FechaNacimiento, @EsCi_Id, @Prsn_Creacion, @Prsn_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonasBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS DE PERSONAS
--SELECT
CREATE PROCEDURE [Gene].[sp_PersonasBuscar]
AS
BEGIN
    SELECT
        p.Prsn_Id,
        p.Prsn_Nombre,
        p.Prsn_Apellido,
        p.Prsn_Sexo,
        p.Prsn_FechaNacimiento,
        ec.EsCi_Descripcion,
        CONCAT(P2.Prsn_Nombre,' ', P2.Prsn_Apellido) AS Creador,
        p.Prsn_FechaCreacion,
        CONCAT(P3.Prsn_Nombre,' ', P3.Prsn_Apellido) AS Modificador,
        CASE WHEN p.Prsn_FechaModificacion IS NULL THEN ''  END AS [Fecha Modificacion]
    FROM Gene.tbPersonas AS p
    JOIN Gene.tbEstadosCiviles AS ec ON p.EsCi_Id = ec.EsCi_Id
    JOIN Acce.tbUsuarios AS u ON p.Prsn_Creacion = u.Usro_Id
    JOIN Gene.tbPersonas AS P2 ON u.prsn_id = P2.prsn_id
    LEFT JOIN Acce.tbUsuarios AS u2 ON p.Prsn_Modifica = u2.Usro_Id
    LEFT JOIN Gene.tbPersonas AS P3 ON u2.prsn_id = P3.prsn_id
    WHERE p.Prsn_Estado = 1;
END;
GO
/****** Object:  StoredProcedure [Gene].[sp_PersonasMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gene].[sp_PersonasMostrar]
AS
BEGIN
SELECT Prsn_Id AS ID,
Prsn_Identidad,
CONCAT(Prsn_Nombre,' ', Prsn_Apellido) AS Nombre,
Prsn_Sexo,
ec.EsCi_Descripcion as EsCi_Descripcion,
Prsn_FechaNacimiento
FROM Gene.tbPersonas p
JOIN Gene.tbEstadosCiviles ec ON ec.EsCi_Id = p.EsCi_Id
WHERE Prsn_Estado = 1
order by Nombre
END;
GO
/****** Object:  StoredProcedure [Teat].[SalasPorTeatroMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[SalasPorTeatroMostrar]
AS
BEGIN
select s.Sala_Id AS ID,
s.Sala_Descripcion,
t.Teat_Id,
t.Teat_Descripcion
from Teat.tbTeatros t
JOIN Gene.tbCiudades c ON t.Ciud_Id = c.Ciud_Id
JOIN Teat.tbSalasPorTeatros st ON st.Teat_Id = t.Teat_Id
JOIN Teat.tbSalas s ON s.Sala_Id = st.Sala_Id
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_AsientoActualizar]
    @Asnt_Id INT,
    @Asnt_Descripcion VARCHAR(20),
    @Secc_Id INT,
    @Asnt_Modifica INT,
    @Asnt_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbAsientos
    SET Asnt_Descripcion = @Asnt_Descripcion,
        Secc_Id = @Secc_Id,
        Asnt_Modifica = @Asnt_Modifica,
        Asnt_FechaModificacion = @Asnt_FechaModificacion
    WHERE Asnt_Id = @Asnt_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_AsientoEliminar]
    @Asnt_Id INT
AS
BEGIN
    UPDATE Teat.tbAsientos
    SET Asnt_Estado =  0
	WHERE Asnt_Id = @Asnt_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA ASIENTOS
CREATE PROCEDURE [Teat].[sp_AsientoInsertar]
    @Asnt_Descripcion VARCHAR(20),
    @Secc_Id INT,
    @Asnt_Creacion INT,
    @Asnt_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbAsientos (Asnt_Descripcion, Secc_Id, Asnt_Creacion, Asnt_FechaCreacion, Asnt_Estado)
    VALUES (@Asnt_Descripcion, @Secc_Id, @Asnt_Creacion, @Asnt_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoPorSalaActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_AsientoPorSalaActualizar]
    @AsSa_Id INT,
    @Asnt_Id INT,
    @SaTe_Id INT,
    @AsSa_Modifica INT,
    @AsSa_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbAsientosPorSalas
    SET Asnt_Id = @Asnt_Id,
        SaTe_Id = @SaTe_Id,
        AsSa_Modifica = @AsSa_Modifica,
        AsSa_FechaModificacion = @AsSa_FechaModificacion
    WHERE AsSa_Id = @AsSa_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoPorSalaEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_AsientoPorSalaEliminar]
    @AsSa_Id INT
AS
BEGIN
    UPDATE Teat.tbAsientosPorSalas
    SET AsSa_Estado  = 0
	WHERE AsSa_Id = @AsSa_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientoPorSalaInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA ASIENTOS POR SALA
CREATE PROCEDURE [Teat].[sp_AsientoPorSalaInsertar]
    @Asnt_Id INT,
    @SaTe_Id INT,
    @AsSa_Creacion INT,
    @AsSa_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbAsientosPorSalas (Asnt_Id, SaTe_Id, AsSa_Creacion, AsSa_FechaCreacion, AsSa_Estado)
    VALUES (@Asnt_Id, @SaTe_Id, @AsSa_Creacion, @AsSa_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_AsientosPorSalasMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_AsientosPorSalasMostrar]
AS
BEGIN
SELECT asa.AsSa_Id AS ID,
a.Asnt_Id,
a.Asnt_Descripcion,
s.Sala_Id,
s.Sala_Descripcion
FROM Teat.tbSalas s
JOIN Teat.tbSalasPorTeatros sate ON sate.Sala_Id = s.Sala_Id
JOIN Teat.tbAsientosPorSalas asa ON asa.SaTe_Id = sate.SaTe_Id
JOIN Teat.tbAsientos a ON a.Asnt_Id = asa.AsSa_Id
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_BoletoActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_BoletoActualizar]
    @Blts_Id INT,
    @Blts_Codigo VARCHAR(8),
    @VtDe_Id INT,
    @Asnt_Id INT,
    @Blts_Modifica INT,
    @Blts_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbBoletos
    SET Blts_Codigo = @Blts_Codigo,
        VtDe_Id = @VtDe_Id,
        Asnt_Id = @Asnt_Id,
        Blts_Modifica = @Blts_Modifica,
        Blts_FechaModificacion = @Blts_FechaModificacion
    WHERE Blts_Id = @Blts_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_BoletoEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_BoletoEliminar]
    @Blts_Id INT
AS
BEGIN
    update Teat.tbBoletos
    set Blts_Estado = 0
	WHERE Blts_Id = @Blts_Id;
END;

GO
/****** Object:  StoredProcedure [Teat].[sp_BoletoInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA BOLETOS
CREATE PROCEDURE [Teat].[sp_BoletoInsertar]
    @Blts_Codigo VARCHAR(8),
    @VtDe_Id INT,
    @Asnt_Id INT,
    @Blts_Creacion INT,
    @Blts_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbBoletos (Blts_Codigo, VtDe_Id, Asnt_Id, Blts_Creacion, Blts_FechaCreacion, Blts_Estado)
    VALUES (@Blts_Codigo, @VtDe_Id, @Asnt_Id, @Blts_Creacion, @Blts_FechaCreacion,  1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadoActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_EmpleadoActualizar]
    @Empl_Id INT,
    @Empl_Puesto VARCHAR(30),
    @Empl_Salario MONEY,
    @Prsn_Id INT,
    @Empl_Modifica INT,
    @Empl_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbEmpleados
    SET Empl_Puesto = @Empl_Puesto,
        Empl_Salario = @Empl_Salario,
        Prsn_Id = @Prsn_Id,
        Empl_Modifica = @Empl_Modifica,
        Empl_FechaModificacion = @Empl_FechaModificacion
    WHERE Empl_Id = @Empl_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadoEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_EmpleadoEliminar]
    @Empl_Id INT
AS
BEGIN
    update Teat.tbEmpleados
    set Empl_Estado = 0
	WHERE Empl_Id = @Empl_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadoInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_EmpleadoInsertar]
    @Empl_Puesto VARCHAR(30),
    @Empl_Salario MONEY,
    @Prsn_Id INT,
    @Empl_Creacion INT,
    @Empl_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbEmpleados (Empl_Puesto, Empl_Salario, Prsn_Id, Empl_Creacion, Empl_FechaCreacion, Empl_Estado)
    VALUES (@Empl_Puesto, @Empl_Salario, @Prsn_Id, @Empl_Creacion, @Empl_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadosBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS DE EMPLEADOS
--SELECT
CREATE PROCEDURE [Teat].[sp_EmpleadosBuscar]
@id int
AS
BEGIN
    SELECT
        Empl_Id AS ID,
        Empl_Puesto,
        Empl_Salario,
		p.Prsn_Id AS Prsn_Id
    FROM Teat.tbEmpleados AS e
    JOIN Gene.tbPersonas AS p ON e.Prsn_Id = p.Prsn_Id
    WHERE e.Empl_Estado = 1 and e.Empl_Id = @id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadosDdl]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_EmpleadosDdl]
AS
BEGIN
SELECT p.Prsn_Id AS ID,
CONCAT(Prsn_Nombre,' ',Prsn_Apellido) AS NOMBRE
FROM Gene.tbPersonas p
JOIN Teat.tbEmpleados e on e.Prsn_Id = p.Prsn_Id
WHERE Prsn_Estado = 1 
ORDER BY CONCAT(Prsn_Nombre,' ',Prsn_Apellido)
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_EmpleadosMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_EmpleadosMostrar]
AS
BEGIN
    SELECT
        Empl_Id AS ID,
		p.Prsn_Id AS Prsn_Id,
		CONCAT(Prsn_Nombre,' ',Prsn_Apellido) AS NOMBRE,
        Empl_Puesto,
        Empl_Salario,
		Prsn_Sexo,
		EsCi_Descripcion,
		Prsn_FechaNacimiento
    FROM Teat.tbEmpleados AS e
    JOIN Gene.tbPersonas AS p ON e.Prsn_Id = p.Prsn_Id
	JOIN Gene.tbEstadosCiviles AS ec On ec.EsCi_Id = p.EsCi_Id
    WHERE e.Empl_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FacturaBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_FacturaBuscar]
@ID INT
AS
BEGIN
select ve.Vnts_Id AS ID,
CONCAT(p.Prsn_Nombre, ' ', p.Prsn_Apellido) as Nombre,
vd.VtDe_Cantidad,
o.Obrs_Descripcion,
s.Secc_Descripcion,
s.Secc_Precio,
sl.Sala_Descripcion,
t.Teat_Descripcion,
c.Ciud_Descripcion,
Fncs_Fecha
from Teat.tbVentasEncabezado ve
JOIN Gene.tbPersonas p ON p.Prsn_Id = ve.Prsn_Id
JOIN Teat.tbVentasDetalle vd ON vd.Vnts_Id = ve.Vnts_Id
JOIN Teat.tbSecciones s ON s.Secc_Id = vd.Secc_Id
JOIN Teat.tbFunciones f ON f.Fncs_Id = vd.Fncs_Id
JOIN Teat.tbObras o ON o.Obrs_Id = f.Obrs_Id
JOIN Teat.tbSalas sl ON sl.Fncs_Id = f.Fncs_Id
JOIN Teat.tbSalasPorTeatros st ON st.Sala_Id = sl.Sala_Id
JOIN Teat.tbTeatros t ON t.Teat_Id = st.Teat_Id
JOIN Gene.tbCiudades c ON c.Ciud_Id = t.Ciud_Id
WHERE vd.Vnts_Id = @ID
END;

GO
/****** Object:  StoredProcedure [Teat].[sp_FacturasMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_FacturasMostrar]
AS
BEGIN
select ve.Vnts_Id AS ID,
CONCAT(p.Prsn_Nombre, ' ', p.Prsn_Apellido) as Nombre,
vd.VtDe_Cantidad,
o.Obrs_Descripcion,
s.Secc_Descripcion,
s.Secc_Precio,
sl.Sala_Descripcion,
t.Teat_Descripcion,
c.Ciud_Descripcion,
Fncs_Fecha
from Teat.tbVentasEncabezado ve
JOIN Gene.tbPersonas p ON p.Prsn_Id = ve.Prsn_Id
JOIN Teat.tbVentasDetalle vd ON vd.Vnts_Id = ve.Vnts_Id
JOIN Teat.tbSecciones s ON s.Secc_Id = vd.Secc_Id
JOIN Teat.tbFunciones f ON f.Fncs_Id = vd.Fncs_Id
JOIN Teat.tbObras o ON o.Obrs_Id = f.Obrs_Id
JOIN Teat.tbSalas sl ON sl.Fncs_Id = f.Fncs_Id
JOIN Teat.tbSalasPorTeatros st ON st.Sala_Id = sl.Sala_Id
JOIN Teat.tbTeatros t ON t.Teat_Id = st.Teat_Id
JOIN Gene.tbCiudades c ON c.Ciud_Id = t.Ciud_Id
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FuncionActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_FuncionActualizar]
    @Fncs_Id INT,
    @Fncs_Fecha DATETIME,
    @Obrs_Id INT,
    @Fncs_Modifica INT,
    @Fncs_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbFunciones
    SET Fncs_Fecha = @Fncs_Fecha,
        Obrs_Id = @Obrs_Id,
        Fncs_Modifica = @Fncs_Modifica,
        Fncs_FechaModificacion = @Fncs_FechaModificacion
    WHERE Fncs_Id = @Fncs_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FuncionEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_FuncionEliminar]
    @Fncs_Id INT
AS
BEGIN
    update Teat.tbFunciones
    set Fncs_Estado = 0
	WHERE Fncs_Id = @Fncs_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FuncionesDdl]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_FuncionesDdl]
@idTeatro INT
AS
BEGIN
select f.Fncs_Id AS ID,
Obrs_Descripcion,
f.Fncs_Fecha
from Teat.tbFunciones f
JOIN Teat.tbObras o ON o.Obrs_Id = f.Obrs_Id
JOIN Teat.tbSalas s ON s.Fncs_Id = f.Fncs_Id
JOIN Teat.tbSalasPorTeatros st ON st.Sala_Id = s.Sala_Id
JOIN Teat.tbTeatros t ON t.Teat_Id = st.Teat_Id
WHERE Fncs_Estado = 1 AND t.Teat_Id = @idTeatro
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FuncionInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--INSERT
CREATE PROCEDURE [Teat].[sp_FuncionInsertar]
    @Fncs_Fecha DATETIME,
    @Obrs_Id INT,
    @Fncs_Creacion INT,
    @Fncs_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbFunciones (Fncs_Fecha, Obrs_Id, Fncs_Creacion, Fncs_FechaCreacion, Fncs_Estado)
    VALUES (@Fncs_Fecha, @Obrs_Id, @Fncs_Creacion, @Fncs_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_FuncionMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA FUNCIONES
--SELECT
CREATE PROCEDURE [Teat].[sp_FuncionMostrar]
AS
BEGIN
    SELECT Fncs_Id, Fncs_Fecha, Obrs_Descripcion, Fncs_Creacion  , Fncs_FechaCreacion, Fncs_Modifica, Fncs_FechaModificacion
    FROM Teat.tbFunciones fncs
    JOIN Teat.tbObras obrs ON fncs.Obrs_Id = obrs.Obrs_Id
    WHERE Fncs_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ObraActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ObraActualizar]
    @Obrs_Id INT,
    @Obrs_Descripcion VARCHAR(50),
    @Obrs_Modifica INT,
    @Obrs_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbObras
    SET Obrs_Descripcion = @Obrs_Descripcion,
        Obrs_Modifica = @Obrs_Modifica,
        Obrs_FechaModificacion = @Obrs_FechaModificacion
    WHERE Obrs_Id = @Obrs_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ObraBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ObraBuscar]
@id int
AS
BEGIN
SELECT Obrs_Id AS ID, Obrs_Descripcion
FROM Teat.tbObras
WHERE Obrs_Estado = 1 and Obrs_Id = @id
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ObraEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ObraEliminar]
    @Obrs_Id INT
AS
BEGIN
    update Teat.tbObras
    set Obrs_Estado = 0
	WHERE Obrs_Id = @Obrs_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ObraInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA OBRAS
CREATE PROCEDURE [Teat].[sp_ObraInsertar]
    @Obrs_Descripcion VARCHAR(50),
    @Obrs_Creacion INT,
    @Obrs_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbObras (Obrs_Descripcion, Obrs_Creacion, Obrs_FechaCreacion, Obrs_Estado)
    VALUES (@Obrs_Descripcion, @Obrs_Creacion, @Obrs_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ObrasMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ObrasMostrar]
AS
BEGIN
SELECT Obrs_Id AS ID, Obrs_Descripcion
FROM Teat.tbObras
WHERE Obrs_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ParticipanteActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ParticipanteActualizar]
    @Prtp_Id INT,
    @Prtp_Rol VARCHAR(20),
    @Obrs_Id INT,
    @Prsn_Id INT,
    @Prtp_Modifica INT,
    @Prtp_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbParticipantes
    SET Prtp_Rol = @Prtp_Rol,
        Obrs_Id = @Obrs_Id,
        Prsn_Id = @Prsn_Id,
        Prtp_Modifica = @Prtp_Modifica,
        Prtp_FechaModificacion = @Prtp_FechaModificacion
    WHERE Prtp_Id = @Prtp_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ParticipanteEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_ParticipanteEliminar]
    @Prtp_Id INT
AS
BEGIN
    update Teat.tbParticipantes
    set Prtp_Estado = 0
	WHERE Prtp_Id = @Prtp_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_ParticipanteInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMINETOS ALMACENADOS PARA PARTICIPANTES
CREATE PROCEDURE [Teat].[sp_ParticipanteInsertar]
    @Prtp_Rol VARCHAR(20),
    @Obrs_Id INT,
    @Prsn_Id INT,
    @Prtp_Creacion INT,
    @Prtp_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbParticipantes (Prtp_Rol, Obrs_Id, Prsn_Id, Prtp_Creacion, Prtp_FechaCreacion, Prtp_Estado)
    VALUES (@Prtp_Rol, @Obrs_Id, @Prsn_Id, @Prtp_Creacion, @Prtp_FechaCreacion, 1);
END;

GO
/****** Object:  StoredProcedure [Teat].[sp_SalaActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SalaActualizar]
    @Sala_Id INT,
    @Sala_Descripcion VARCHAR(20),
    @Fncs_Id INT,
    @Sala_Modifica INT,
    @Sala_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbSalas
    SET Sala_Descripcion = @Sala_Descripcion,
        Fncs_Id = @Fncs_Id,
        Sala_Modifica = @Sala_Modifica,
        Sala_FechaModificacion = @Sala_FechaModificacion
    WHERE Sala_Id = @Sala_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SalaEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SalaEliminar]
    @Sala_Id INT
AS
BEGIN
    update Teat.tbSalas
    set Sala_Estado = 0
	WHERE Sala_Id = @Sala_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SalaInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA SALAS
CREATE PROCEDURE [Teat].[sp_SalaInsertar]
    @Sala_Descripcion VARCHAR(20),
    @Fncs_Id INT,
    @Sala_Creacion INT,
    @Sala_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbSalas (Sala_Descripcion, Fncs_Id, Sala_Creacion, Sala_FechaCreacion, Sala_Estado)
    VALUES (@Sala_Descripcion, @Fncs_Id, @Sala_Creacion, @Sala_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SalaPorTeatroActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SalaPorTeatroActualizar]
    @SaTe_Id INT,
    @Teat_Id INT,
    @Sala_Id INT,
    @SaTe_Modifica INT,
    @SaTe_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbSalasPorTeatros
    SET Teat_Id = @Teat_Id,
        Sala_Id = @Sala_Id,
        SaTe_Modifica = @SaTe_Modifica,
        SaTe_FechaModificacion = @SaTe_FechaModificacion
    WHERE SaTe_Id = @SaTe_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SalaPorTeatroEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SalaPorTeatroEliminar]
    @SaTe_Id INT
AS
BEGIN
    update Teat.tbSalasPorTeatros
    set SaTe_Estado = 0
	WHERE SaTe_Id = @SaTe_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SalaPorTeatroInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA SALAS POR TEATROS
CREATE PROCEDURE [Teat].[sp_SalaPorTeatroInsertar]
    @Teat_Id INT,
    @Sala_Id INT,
    @SaTe_Creacion INT,
    @SaTe_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbSalasPorTeatros (Teat_Id, Sala_Id, SaTe_Creacion, SaTe_FechaCreacion, SaTe_Estado)
    VALUES (@Teat_Id, @Sala_Id, @SaTe_Creacion, @SaTe_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SeccionActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SeccionActualizar]
    @Secc_Id INT,
    @Secc_Descripcion VARCHAR(20),
    @Secc_Precio MONEY,
    @SaTe_Id INT,
    @Secc_Modifica INT,
    @Secc_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbSecciones
    SET Secc_Descripcion = @Secc_Descripcion,
        Secc_Precio = @Secc_Precio,
        SaTe_Id = @SaTe_Id,
        Secc_Modifica = @Secc_Modifica,
        Secc_FechaModificacion = @Secc_FechaModificacion
    WHERE Secc_Id = @Secc_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SeccionEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SeccionEliminar]
    @Secc_Id INT
AS
BEGIN
    update Teat.tbSecciones
    set Secc_Estado = 0
	WHERE Secc_Id = @Secc_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SeccionesDdl]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_SeccionesDdl]
AS
BEGIN
select Secc_Id as ID,
Secc_Descripcion
from Teat.tbSecciones
WHERE Secc_Estado =  1
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SeccionInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Teat].[sp_SeccionInsertar]
    @Secc_Descripcion VARCHAR(20),
    @Secc_Precio MONEY,
    @SaTe_Id INT,
    @Secc_Creacion INT,
    @Secc_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbSecciones (Secc_Descripcion, Secc_Precio, SaTe_Id, Secc_Creacion, Secc_FechaCreacion, Secc_Estado)
    VALUES (@Secc_Descripcion, @Secc_Precio, @SaTe_Id, @Secc_Creacion, @Secc_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_SeccionMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA SECCIONES
--SELECT
CREATE PROCEDURE [Teat].[sp_SeccionMostrar]
AS
BEGIN
    SELECT secc.Secc_Id,
        secc.Secc_Descripcion,
        secc.Secc_Precio,
        sala.Sala_Descripcion,
        CONCAT(p.Prsn_Nombre, ' ', p.Prsn_Apellido) AS Creador,
        secc.Secc_FechaCreacion,
        secc.Secc_Modifica AS Modificador,
        CASE WHEN secc.Secc_FechaModificacion IS NULL THEN '' END AS [Fecha Modificacion]
    FROM Teat.tbSecciones AS secc
    JOIN Teat.tbSalasPorTeatros AS sate ON secc.SaTe_Id = sate.SaTe_Id
    JOIN Teat.tbSalas AS sala ON sate.Sala_Id = sala.Sala_Id
    JOIN Acce.tbUsuarios AS u ON secc.Secc_Creacion = u.Usro_Id
    JOIN Gene.tbPersonas AS p ON u.Prsn_Id = p.Prsn_Id
    WHERE Secc_Estado = 1;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatroActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_TeatroActualizar]
    @Teat_Id INT,
    @Teat_Descripcion VARCHAR(20),
    @Ciud_Id INT,
    @Teat_Modifica INT,
    @Teat_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbTeatros
    SET Teat_Descripcion = @Teat_Descripcion,
        Ciud_Id = @Ciud_Id,
        Teat_Modifica = @Teat_Modifica,
        Teat_FechaModificacion = @Teat_FechaModificacion
    WHERE Teat_Id = @Teat_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatroBuscar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_TeatroBuscar]
@Id INT
AS
BEGIN
SELECT Teat_Id AS ID, Teat_Descripcion,
c.Ciud_Id AS Ciud_Id,
c.Ciud_Descripcion AS Ciud_Descripcion,
e.Estd_Id AS Estd_Id,
e.Estd_Descripcion AS Estd_Descripcion
FROM Teat.tbTeatros t
join Gene.tbCiudades c on c.Ciud_Id = t.Ciud_Id
join Gene.tbEstados e on e.Estd_Id = c.Estd_Id
WHERE Teat_Estado = 1 AND Teat_Id = @Id
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatroEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_TeatroEliminar]
    @Teat_Id INT
AS
BEGIN
    update Teat.tbTeatros
    set Teat_Estado = 0
	WHERE Teat_Id = @Teat_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatroInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERT
CREATE PROCEDURE [Teat].[sp_TeatroInsertar]
    @Teat_Descripcion VARCHAR(20),
    @Ciud_Id VARCHAR(4),
    @Teat_Creacion INT,
    @Teat_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbTeatros (Teat_Descripcion, Ciud_Id, Teat_Creacion, Teat_FechaCreacion, Teat_Estado)
    VALUES (@Teat_Descripcion, @Ciud_Id, @Teat_Creacion, @Teat_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatrosDdl]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_TeatrosDdl]
@idCiudad INT
AS
BEGIN
SELECT Teat_Id AS ID,
Teat_Descripcion
FROM Teat.tbTeatros
WHERE Teat_Estado = 1 AND Ciud_Id = @idCiudad
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_TeatrosMostrar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_TeatrosMostrar]
AS
BEGIN
SELECT Teat_Id AS ID,
Teat_Descripcion,
c.Ciud_Id AS Ciud_Id,
c.Ciud_Descripcion AS Ciud_Descripcion,
e.Estd_Id AS Estd_Id,
e.Estd_Descripcion AS Estd_Descripcion 
FROM Teat.tbTeatros t
JOIN  Gene.tbCiudades c ON c.Ciud_Id = t.Ciud_Id
JOIN Gene.tbEstados e ON e.Estd_Id = c.Estd_Id
WHERE Teat_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaDetalleActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_VentaDetalleActualizar]
    @VtDe_Id INT,
    @VtDe_Cantidad INT,
    @Vnts_Id INT,
    @Secc_Id INT,
    @Fncs_Id INT,
    @VtDe_Modifica INT,
    @VtDe_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbVentasDetalle
    SET VtDe_Cantidad = @VtDe_Cantidad,
        Vnts_Id = @Vnts_Id,
        Secc_Id = @Secc_Id,
        Fncs_Id = @Fncs_Id,
        VtDe_Modifica = @VtDe_Modifica,
        VtDe_FechaModificacion = @VtDe_FechaModificacion
    WHERE VtDe_Id = @VtDe_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaDetalleEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_VentaDetalleEliminar]
    @VtDe_Id INT
AS
BEGIN
    DELETE FROM Teat.tbVentasDetalle
	WHERE VtDe_Id = @VtDe_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaDetalleInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA VENTAS DETALLE
CREATE PROCEDURE [Teat].[sp_VentaDetalleInsertar]
    @VtDe_Cantidad INT,
    @Vnts_Id INT,
    @Secc_Id INT,
    @Fncs_Id INT,
    @VtDe_Creacion INT,
    @VtDe_FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Teat.tbVentasDetalle (VtDe_Cantidad, Vnts_Id, Secc_Id, Fncs_Id, VtDe_Creacion, VtDe_FechaCreacion, VtDe_Estado)
    VALUES (@VtDe_Cantidad, @Vnts_Id, @Secc_Id, @Fncs_Id, @VtDe_Creacion, @VtDe_FechaCreacion, 1);
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaEncabezadoActualizar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_VentaEncabezadoActualizar]
    @Vnts_Id INT,
    @Vnts_Fecha DATETIME,
    @Vnts_Modifica INT,
    @Vnts_FechaModificacion DATETIME
AS
BEGIN
    UPDATE Teat.tbVentasEncabezado
    SET Vnts_Fecha = @Vnts_Fecha,
        Vnts_Modifica = @Vnts_Modifica,
        Vnts_FechaModificacion = @Vnts_FechaModificacion
    WHERE Vnts_Id = @Vnts_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaEncabezadoEliminar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Teat].[sp_VentaEncabezadoEliminar]
    @Vnts_Id INT
AS
BEGIN
    update Teat.tbVentasEncabezado
    set Vnts_Estado = 0
	WHERE Vnts_Id = @Vnts_Id;
END;
GO
/****** Object:  StoredProcedure [Teat].[sp_VentaEncabezadoInsertar]    Script Date: 22/2/2024 5:10:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTOS ALMACENADOS PARA VENTAS ENCABEZADO
CREATE PROCEDURE [Teat].[sp_VentaEncabezadoInsertar]
	@Prsn_Id INT,
    @Vnts_Fecha DATETIME,
    @Vnts_Creacion INT,
    @Vnts_FechaCreacion DATETIME,
	@id INT OUTPUT
AS
BEGIN
    INSERT INTO Teat.tbVentasEncabezado (Prsn_Id, Vnts_Fecha, Vnts_Creacion, Vnts_FechaCreacion, Vnts_Estado)
    VALUES (@Prsn_Id, @Vnts_Fecha, @Vnts_Creacion, @Vnts_FechaCreacion, 1);
	SET @id = SCOPE_IDENTITY();
END;
GO

--
CREATE TRIGGER tr_BitacoraSecciones_Insertar
ON Teat.tbSecciones
AFTER INSERT
AS
BEGIN
    INSERT INTO tbBitacoraSecciones (Descripcion, Estado, Precio, SalaTeatroID, Cambio, FechaCambio)
    SELECT
        i.Secc_Descripcion,
        i.Secc_Precio,
        i.SaTe_Id,
        i.Secc_Estado,
        'I',
        GETDATE()
    FROM
        inserted i;
END;
GO

CREATE TRIGGER tr_BitacoraSecciones_Actualizar
ON Teat.tbSecciones
AFTER UPDATE
AS
BEGIN
    INSERT INTO tbBitacoraSecciones (Descripcion, Estado, Precio, SalaTeatroID, Cambio, FechaCambio)
    SELECT
        i.Secc_Descripcion,
        i.Secc_Precio,
        i.SaTe_Id,
        i.Secc_Estado,
        'M',
        GETDATE()
    FROM
        inserted i
END;
GO

CREATE TRIGGER tr_BitacoraSecciones_Eliminar
ON Teat.tbSecciones
AFTER DELETE
AS
BEGIN
    INSERT INTO tbBitacoraSecciones (Descripcion, Estado, Precio, SalaTeatroID, Cambio, FechaCambio)
    SELECT
        d.Secc_Descripcion,
        d.Secc_Precio,
        d.SaTe_Id,
        d.Secc_Estado,
        'D',
        GETDATE()
    FROM
        deleted d;
END;