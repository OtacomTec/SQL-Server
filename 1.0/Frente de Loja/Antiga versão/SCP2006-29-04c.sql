/*
   sexta-feira, 28 de abril de 2006 16:05:24
   User: sa
   Server: ONLYTECH-02
   Database: BDPDV
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
ALTER TABLE dbo.TBCodigo_barras
	DROP CONSTRAINT FK__TBCodigo___FKId___3D7E1B63
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBCodigo_barras
	(
	PKId_TBCodigo_barras int NOT NULL,
	FKId_TBProduto int NOT NULL,
	IXCodigo_TBCodigo_barras bigint NOT NULL,
	DFUnidade_TBCodigo_barras char(3) NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBCodigo_barras)
	 EXEC('INSERT INTO dbo.Tmp_TBCodigo_barras (PKId_TBCodigo_barras, FKId_TBProduto, IXCodigo_TBCodigo_barras, DFUnidade_TBCodigo_barras)
		SELECT PKId_TBCodigo_barras, FKId_TBProduto, IXCodigo_TBCodigo_barras, DFUnidade_TBCodigo_barras FROM dbo.TBCodigo_barras TABLOCKX')
GO
DROP TABLE dbo.TBCodigo_barras
GO
EXECUTE sp_rename N'dbo.Tmp_TBCodigo_barras', N'TBCodigo_barras', 'OBJECT'
GO
ALTER TABLE dbo.TBCodigo_barras ADD CONSTRAINT
	PK__TBCodigo_barras__1387E197 PRIMARY KEY CLUSTERED 
	(
	PKId_TBCodigo_barras
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBCodigo_barras WITH NOCHECK ADD CONSTRAINT
	FK__TBCodigo___FKId___3D7E1B63 FOREIGN KEY
	(
	FKId_TBProduto
	) REFERENCES dbo.TBProduto
	(
	PKId_TBProduto
	)
GO
COMMIT
