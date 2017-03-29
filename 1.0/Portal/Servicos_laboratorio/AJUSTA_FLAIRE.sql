/*
   segunda-feira, 6 de fevereiro de 2006 19:00:32
   User: 
   Server: ONLYTECH-07
   Database: BDRetaguarda
   Application: MS SQLEM - Data Tools
*/

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.TBVencimento_Pedido
	DROP CONSTRAINT FK__TBVencime__FKId___0A0406BE
GO
ALTER TABLE dbo.TBVencimento_Pedido
	DROP CONSTRAINT FK__TBVencime__FKId___3C0576A6
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBVencimento_Pedido
	(
	PKId_TBVencimento_Pedido int NOT NULL IDENTITY (1, 1),
	FKId_TBPedido int NOT NULL,
	DFData_TBVencimento_Pedido smalldatetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_TBVencimento_Pedido ON
GO
IF EXISTS(SELECT * FROM dbo.TBVencimento_Pedido)
	 EXEC('INSERT INTO dbo.Tmp_TBVencimento_Pedido (PKId_TBVencimento_Pedido, FKId_TBPedido, DFData_TBVencimento_Pedido)
		SELECT PKId_TBVencimento_Pedido, FKId_TBPedido, CONVERT(smalldatetime, DFData_TBVencimento_Pedido) FROM dbo.TBVencimento_Pedido TABLOCKX')
GO
SET IDENTITY_INSERT dbo.Tmp_TBVencimento_Pedido OFF
GO
DROP TABLE dbo.TBVencimento_Pedido
GO
EXECUTE sp_rename N'dbo.Tmp_TBVencimento_Pedido', N'TBVencimento_Pedido', 'OBJECT'
GO
ALTER TABLE dbo.TBVencimento_Pedido ADD CONSTRAINT
	PK__TBVencimento_Ped__3B11526D PRIMARY KEY CLUSTERED 
	(
	PKId_TBVencimento_Pedido
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBVencimento_Pedido WITH NOCHECK ADD CONSTRAINT
	FK__TBVencime__FKId___0A0406BE FOREIGN KEY
	(
	FKId_TBPedido
	) REFERENCES dbo.TBPedido
	(
	PKId_TBPedido
	)
GO
ALTER TABLE dbo.TBVencimento_Pedido WITH NOCHECK ADD CONSTRAINT
	FK__TBVencime__FKId___3C0576A6 FOREIGN KEY
	(
	FKId_TBPedido
	) REFERENCES dbo.TBPedido
	(
	PKId_TBPedido
	)
GO
COMMIT
