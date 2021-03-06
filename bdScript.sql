USE [master]
GO
/****** Object:  Database [DBCANVIERO]    Script Date: 22/03/2022 11:54:05 a. m. ******/
CREATE DATABASE [DBCANVIERO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCANVIERO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBCANVIERO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCANVIERO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBCANVIERO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBCANVIERO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCANVIERO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCANVIERO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCANVIERO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCANVIERO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCANVIERO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCANVIERO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCANVIERO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBCANVIERO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCANVIERO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCANVIERO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCANVIERO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCANVIERO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCANVIERO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCANVIERO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCANVIERO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCANVIERO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCANVIERO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCANVIERO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCANVIERO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCANVIERO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCANVIERO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCANVIERO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCANVIERO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCANVIERO] SET RECOVERY FULL 
GO
ALTER DATABASE [DBCANVIERO] SET  MULTI_USER 
GO
ALTER DATABASE [DBCANVIERO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCANVIERO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCANVIERO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCANVIERO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCANVIERO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBCANVIERO', N'ON'
GO
ALTER DATABASE [DBCANVIERO] SET QUERY_STORE = OFF
GO
USE [DBCANVIERO]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](60) NULL,
	[Marca] [nvarchar](60) NULL,
	[Nombre] [nvarchar](60) NULL,
	[Precio] [nvarchar](60) NULL,
	[Estado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoIdentidad] [varchar](10) NULL,
	[Nombres] [varchar](60) NULL,
	[Telefono] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Ciudad] [varchar](60) NULL,
	[FechaRegistro] [datetime] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Producto]    Script Date: 22/03/2022 11:54:05 a. m. ******/
CREATE NONCLUSTERED INDEX [IDX_Producto] ON [dbo].[PRODUCTO]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Usuario]    Script Date: 22/03/2022 11:54:05 a. m. ******/
CREATE NONCLUSTERED INDEX [IDX_Usuario] ON [dbo].[USUARIO]
(
	[Nombres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
/****** Object:  StoredProcedure [dbo].[usp_producto_eliminar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_producto_eliminar](
@idproducto int
)
as
begin

delete from PRODUCTO where IdProducto = @idproducto

end

GO
/****** Object:  StoredProcedure [dbo].[usp_producto_eliminarLogicamente]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_producto_eliminarLogicamente](
@idproducto int
)
as
begin

update PRODUCTO
set estado=0
where IdProducto = @idproducto

end

GO
/****** Object:  StoredProcedure [dbo].[usp_producto_listar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_producto_listar]
as
begin

select [IdProducto]
      ,[Codigo]
      ,[Marca]
      ,[Nombre]
      ,[Precio]
      ,[Estado]
      ,[FechaRegistro]
      ,[FechaActualizacion] 
	  from PRODUCTO 
	  where estado =1
end


GO
/****** Object:  StoredProcedure [dbo].[usp_producto_listar_pag]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_producto_listar_pag]
 @sortColumn VARCHAR(50)
    ,@sortOrder VARCHAR(50)
    ,@OffsetValue INT
    ,@PagingSize INT
as
begin

select [IdProducto]
      ,[Codigo]
      ,[Marca]
      ,[Nombre]
      ,[Precio]
      ,[Estado]
      ,[FechaRegistro]
      ,[FechaActualizacion] 
	  from PRODUCTO 
	  where estado =1
	  ORDER BY CASE WHEN @sortOrder <> 'ASC' THEN '' WHEN @sortColumn  = 'IdProducto' THEN IdProducto END ASC ,CASE WHEN @sortOrder <> 'Desc' THEN '' WHEN @sortColumn = 'IdProducto' THEN IdProducto END DESC  OFFSET @OffsetValue ROWS FETCH NEXT @PagingSize ROWS ONLY
end


GO
/****** Object:  StoredProcedure [dbo].[usp_producto_modificar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_producto_modificar](
@idproducto int,
@marca varchar(60),
@nombre varchar(60),
@precio varchar(60),
@estado varchar(60)
)
as
begin

update [PRODUCTO] set 
Marca = @marca,
Nombre = @nombre,
Precio = @precio,
Estado = @estado
where IdProducto = @idproducto

end

GO
/****** Object:  StoredProcedure [dbo].[usp_producto_obtener]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_producto_obtener](@idproducto int)
as
begin

select * from PRODUCTO where IdProducto = @idproducto
end

GO
/****** Object:  StoredProcedure [dbo].[usp_producto_registrar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_producto_registrar](
@codigo varchar(60),
@marca varchar(60),
@nombre varchar(60),
@precio varchar(60),
@estado varchar(60)
)
as
begin

insert into [PRODUCTO]
           ([Codigo]
           ,[Marca]
           ,[Nombre]
           ,[Precio]
           ,[Estado]
			)
     values
           (@codigo
           ,@marca
           ,@nombre
           ,@precio
           ,@estado
           )
end


GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_eliminar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_usuario_eliminar](
@idusuario int
)
as
begin

delete from usuario where IdUsuario = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_eliminarLogicamente]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_usuario_eliminarLogicamente](
@idusuario int
)
as
begin

update usuario
set estado=0
where IdUsuario = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_listar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_usuario_listar]
as
begin

select [IdUsuario]
      ,[DocumentoIdentidad]
      ,[Nombres]
      ,[Telefono]
      ,[Correo]
      ,[Ciudad]
      ,[FechaRegistro]
      ,[estado] from usuario where estado =1
end

 
GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_listar_pag]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_usuario_listar_pag]
 @sortColumn VARCHAR(50)
    ,@sortOrder VARCHAR(50)
    ,@OffsetValue INT
    ,@PagingSize INT
as
begin

select [IdUsuario]
      ,[DocumentoIdentidad]
      ,[Nombres]
      ,[Telefono]
      ,[Correo]
      ,[Ciudad]
      ,[FechaRegistro]
      ,[estado] from usuario where estado =1
ORDER BY CASE WHEN @sortOrder <> 'ASC' THEN '' WHEN @sortColumn  = 'IdUsuario' THEN IdUsuario END ASC ,CASE WHEN @sortOrder <> 'Desc' THEN '' WHEN @sortColumn = 'IdUsuario' THEN IdUsuario END DESC  OFFSET @OffsetValue ROWS FETCH NEXT @PagingSize ROWS ONLY
end

 
GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_modificar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_usuario_modificar](
@idusuario int,
@documentoidentidad varchar(10),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60),
@estado int
)
as
begin

update USUARIO set 
DocumentoIdentidad = @documentoidentidad,
Nombres = @nombres,
Telefono = @telefono,
Correo = @correo,
Ciudad = @ciudad,
Estado=@estado
where IdUsuario = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_obtener]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_usuario_obtener](@idusuario int)
as
begin

select * from usuario where IdUsuario = @idusuario
end

GO
/****** Object:  StoredProcedure [dbo].[usp_usuario_registrar]    Script Date: 22/03/2022 11:54:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_usuario_registrar](
@documentoidentidad varchar(10),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60)
)
as
begin

insert into USUARIO(DocumentoIdentidad,Nombres,Telefono,Correo,Ciudad)
values
(
@documentoidentidad,
@nombres,
@telefono,
@correo,
@ciudad
)

end


GO
USE [master]
GO
ALTER DATABASE [DBCANVIERO] SET  READ_WRITE 
GO
