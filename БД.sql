USE [master]
GO
/****** Object:  Database [Абоненты_Старостин]    Script Date: 20.12.2022 11:57:25 ******/
CREATE DATABASE [Абоненты_Старостин]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты_Старостин', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_Старостин.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты_Старостин_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Абоненты_Старостин_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты_Старостин] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты_Старостин].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты_Старостин] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты_Старостин] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты_Старостин] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Абоненты_Старостин] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты_Старостин] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты_Старостин] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты_Старостин] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты_Старостин] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты_Старостин] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты_Старостин] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты_Старостин] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты_Старостин', N'ON'
GO
ALTER DATABASE [Абоненты_Старостин] SET QUERY_STORE = OFF
GO
USE [Абоненты_Старостин]
GO
/****** Object:  Table [dbo].[Абоненты]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абоненты](
	[ID_Абонента] [int] NOT NULL,
	[ФИО] [nvarchar](50) NULL,
	[Адрес] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[ID_Разговора] [int] NOT NULL,
	[ID_Телефона] [bigint] NOT NULL,
	[ID_Тарифа] [int] NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Дата_разговора] [date] NOT NULL,
	[Продолжительность_в_минутах] [int] NOT NULL,
	[Признак_оплаты] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Разговор__B7A0F167F5CA6569] PRIMARY KEY CLUSTERED 
(
	[ID_Разговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тарифы]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тарифы](
	[ID_Тарифа] [int] NOT NULL,
	[Цена_минуты] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефоны]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефоны](
	[ID_Телефона] [bigint] NOT NULL,
	[Номер_договора] [nvarchar](50) NOT NULL,
	[Дата_установки] [date] NOT NULL,
	[ID_Абонента] [int] NOT NULL,
 CONSTRAINT [PK__Телефоны__30FC9561EF6652FA] PRIMARY KEY CLUSTERED 
(
	[ID_Телефона] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Абоненты] ([ID_Абонента], [ФИО], [Адрес]) VALUES (1, N'Орлов Сергей Борисович', N'г.Омск, ул. Мира, 54, 4')
INSERT [dbo].[Абоненты] ([ID_Абонента], [ФИО], [Адрес]) VALUES (3, N'Вавилов Сергей Борисович', N'г.Омск пр. Маркса 34, 23')
INSERT [dbo].[Абоненты] ([ID_Абонента], [ФИО], [Адрес]) VALUES (4, N'Титова Александра Ивановна', N'г.Омск, ул. Ленина, 5,24')
GO
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (1, 3812326789, 1, N'Омск', CAST(N'2021-03-02' AS Date), 12, N'не оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (2, 3812951211, 4, N'Новосибирск', CAST(N'2021-03-02' AS Date), 2, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (3, 3812531178, 3, N'Воронеж', CAST(N'2021-03-08' AS Date), 15, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (4, 3812333490, 3, N'Воронеж', CAST(N'2021-03-08' AS Date), 5, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (5, 3812326789, 5, N'Санкт-Петербург', CAST(N'2021-03-15' AS Date), 10, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (6, 3812531178, 1, N'Омск', CAST(N'2021-03-15' AS Date), 1, N'не оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (7, 3812333490, 1, N'Омск', CAST(N'2021-03-15' AS Date), 10, N'не оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (8, 3812951211, 2, N'Москва', CAST(N'2021-03-15' AS Date), 3, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (9, 3812953412, 3, N'Воронеж', CAST(N'2021-03-23' AS Date), 6, N'оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (10, 3812326789, 3, N'Воронеж', CAST(N'2021-04-01' AS Date), 3, N'не оплачено')
INSERT [dbo].[Разговоры] ([ID_Разговора], [ID_Телефона], [ID_Тарифа], [Город], [Дата_разговора], [Продолжительность_в_минутах], [Признак_оплаты]) VALUES (11, 3812951211, 3, N'Воронеж', CAST(N'2021-04-01' AS Date), 3, N'оплачено')
GO
INSERT [dbo].[Тарифы] ([ID_Тарифа], [Цена_минуты]) VALUES (1, 10)
INSERT [dbo].[Тарифы] ([ID_Тарифа], [Цена_минуты]) VALUES (2, 30)
INSERT [dbo].[Тарифы] ([ID_Тарифа], [Цена_минуты]) VALUES (3, 20)
INSERT [dbo].[Тарифы] ([ID_Тарифа], [Цена_минуты]) VALUES (4, 10)
INSERT [dbo].[Тарифы] ([ID_Тарифа], [Цена_минуты]) VALUES (5, 30)
GO
INSERT [dbo].[Телефоны] ([ID_Телефона], [Номер_договора], [Дата_установки], [ID_Абонента]) VALUES (3812326789, N'2378Ф', CAST(N'1996-01-01' AS Date), 1)
INSERT [dbo].[Телефоны] ([ID_Телефона], [Номер_договора], [Дата_установки], [ID_Абонента]) VALUES (3812333490, N'3465Ф', CAST(N'2012-10-09' AS Date), 4)
INSERT [dbo].[Телефоны] ([ID_Телефона], [Номер_договора], [Дата_установки], [ID_Абонента]) VALUES (3812531178, N'4523В', CAST(N'2004-08-04' AS Date), 1)
INSERT [dbo].[Телефоны] ([ID_Телефона], [Номер_договора], [Дата_установки], [ID_Абонента]) VALUES (3812951211, N'3466Ф', CAST(N'2012-10-09' AS Date), 4)
INSERT [dbo].[Телефоны] ([ID_Телефона], [Номер_договора], [Дата_установки], [ID_Абонента]) VALUES (3812953412, N'99345Р', CAST(N'2013-01-01' AS Date), 3)
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Тарифы] FOREIGN KEY([ID_Тарифа])
REFERENCES [dbo].[Тарифы] ([ID_Тарифа])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Тарифы]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Телефоны] FOREIGN KEY([ID_Телефона])
REFERENCES [dbo].[Телефоны] ([ID_Телефона])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Телефоны]
GO
ALTER TABLE [dbo].[Телефоны]  WITH CHECK ADD  CONSTRAINT [FK_Телефоны_Абоненты] FOREIGN KEY([ID_Абонента])
REFERENCES [dbo].[Абоненты] ([ID_Абонента])
GO
ALTER TABLE [dbo].[Телефоны] CHECK CONSTRAINT [FK_Телефоны_Абоненты]
GO
/****** Object:  StoredProcedure [dbo].[НовАбонент]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[НовАбонент]
@ID_Абонента int,
@ФИО nvarchar(50),
@Адрес nvarchar(50)
AS
Begin
Insert into Абоненты
Values
(
@ID_Абонента, 
@ФИО,
@Адрес
)
end
GO
/****** Object:  StoredProcedure [dbo].[УдалАбонент]    Script Date: 20.12.2022 11:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[УдалАбонент]
@ID_Абонента Int
AS
Begin
delete from Абоненты
Where ID_Абонента = @ID_Абонента
end
GO
USE [master]
GO
ALTER DATABASE [Абоненты_Старостин] SET  READ_WRITE 
GO
