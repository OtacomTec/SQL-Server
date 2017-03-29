CREATE DATABASE [BDRetaguarda]  ON (NAME = N'BDOtica_Data', FILENAME = N'C:\Arquivos de programas\Microsoft SQL Server\MSSQL\data\BDRetaguarda_Data.MDF' , SIZE = 712, FILEGROWTH = 50%) LOG ON (NAME = N'BDOtica_Log', FILENAME = N'C:\Arquivos de programas\Microsoft SQL Server\MSSQL\data\BDRetaguarda_Log.LDF' , SIZE = 1280, FILEGROWTH = 100%)
 COLLATE Latin1_General_CI_AS
GO

exec sp_dboption N'BDRetaguarda', N'autoclose', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'bulkcopy', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'trunc. log', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'torn page detection', N'true'
GO

exec sp_dboption N'BDRetaguarda', N'read only', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'dbo use', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'single', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'autoshrink', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'ANSI null default', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'recursive triggers', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'ANSI nulls', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'concat null yields null', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'cursor close on commit', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'default to local cursor', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'quoted identifier', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'ANSI warnings', N'false'
GO

exec sp_dboption N'BDRetaguarda', N'auto create statistics', N'true'
GO

exec sp_dboption N'BDRetaguarda', N'auto update statistics', N'true'
GO

if( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
	exec sp_dboption N'BDRetaguarda', N'db chaining', N'false'
GO

use [BDRetaguarda]
GO

CREATE TABLE [dbo].[TBProgramas] (
	[PKId_TBProgramas] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[FKID_Menu] [int] NOT NULL ,
	[DFDescricao_TBProgramas] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL ,
	[DFOrdem_Programas] [numeric](18, 0) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TBProgramas] WITH NOCHECK ADD 
	CONSTRAINT [PK_TBProgramas] PRIMARY KEY  CLUSTERED 
	(
		[PKId_TBProgramas]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

