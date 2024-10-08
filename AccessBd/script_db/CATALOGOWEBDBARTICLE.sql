use master
go
create database CATALOGO_WEB_DB
go
use CATALOGO_WEB_DB
go
USE [CATALOGO_WEB_DB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MARCAS](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 08/09/2019 10:32:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 08/09/2019 10:32:24 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARTICULOS](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Codigo] [varchar](50) NULL,
    [Nombre] [varchar](50) NULL,
    [Descripcion] [varchar](150) NULL,
    [IdMarca] [int] NULL,
    [IdCategoria] [int] NULL,
    [ImagenUrl] [varchar](1000) NULL,
    [Precio] [money] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
create table USERS(
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [email] [varchar](100) NOT NULL,
    [pass] [varchar](20) NOT NULL,
    [nombre] [varchar](50) NULL,
    [apellido] [varchar](50) NULL,
    [urlImagenPerfil] [varchar](500) NULL,
    [admin] [bit] NOT NULL DEFAULT 0
)
go
create table FAVORITOS(
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [IdUser] [int] NOT NULL,
    [IdArticulo] [int] NOT NULL
)
go
insert into MARCAS values ('Samsung'), ('Apple'), ('Sony'), ('Huawei'), ('Motorola')
insert into CATEGORIAS values ('Celulares'),('Televisores'), ('Media'), ('Audio')
INSERT INTO ARTICULOS VALUES 
('S01', 'Galaxy S10', 'The best from Samsung.', 1, 1, 'https://riiing.com.ar/wp-content/uploads/2023/10/S10-01-1024x1024.png', 69999),
('M03', 'Moto G Play 7th Gen', 'Unbeatable Motorola', 5, 1, 'https://laopinion.com/wp-content/uploads/sites/3/2019/02/moto-g7_na_black_laydown-combo.jpg?quality=80&strip=all', 15699),
('S56', 'Bravia 55', 'Best definition per inch available', 3, 2, 'https://intercompras.com/product_thumb_keepratio_2.php?img=images/product/SONY_KDL-55W950A.jpg&w=650&h=450', 49500),
('A23', 'Apple TV', 'Apple television', 2, 3, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/apple-tv-4k-hero-select-202210_FMT_WHH?wid=640&hei=600&fmt=jpeg&qlt=90&.v=1664896361164', 7850),
('S02', 'Galaxy Note 10', 'The latest version of the Note series', 1, 1, 'https://img.global.news.samsung.com/ar/wp-content/uploads/2019/08/Note10_Auraglow3.jpg', 89999),
('A24', 'iPad Air', 'Powerful and lightweight', 2, 3, 'https://maximstore.com/wp-content/uploads/2022/06/iPad_Air_Wi-Fi_Purple_PDP_Image_Position-1b_MXLA-1.jpg', 54999),
('M04', 'Moto E7', 'Economical and reliable', 5, 1, 'https://m.media-amazon.com/images/I/61A1MU+OOzS._AC_SL1500_.jpg', 8999),
('S57', 'Xperia 1 III', 'Elegant design and high performance', 3, 2, 'https://promart.vteximg.com.br/arquivos/ids/6915620-1000-1000/image-8d6a289448c64808a65035bcc672477b.jpg?v=638175320286230000', 105000),
('A25', 'AirPods Pro', 'Active noise cancellation and superior sound quality', 2, 3, 'https://www.apple.com/v/airpods-pro/k/images/meta/og__eui2mpgzwyaa_overview.png', 25999),
('S59', 'PlayStation 5', 'The next generation of game consoles', 3, 3, 'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2021/08/acabo-escasez-ps5-stock-consola-volvera-normalidad-ano-2429173.jpg?tf=3840x', 64999);

insert into FAVORITOS (iduser,IdArticulo)
values ( 2,1) , (2,5),(2,6),(2,2)

insert into USERS (email, pass, admin) values ('admin@admin.com', 'admin', 1)
insert into USERS (email, pass, admin) values ('user@user.com', 'user', 0)
select * from ARTICULOS