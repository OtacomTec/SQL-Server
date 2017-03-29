/*
   quarta-feira, 8 de março de 2006 16:17:46
   User: sa
   Server: ONLYTECH-02
   Database: BDPortal
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
CREATE TABLE dbo.Tmp_TBInsumo_portal
	(
	PKCodigo_TBInsumo_portal int NOT NULL,
	DFDescricao_TBInsumo_portal nvarchar(100) NULL,
	DFIntegrado_TBInsumo_portal bit NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBInsumo_portal)
	 EXEC('INSERT INTO dbo.Tmp_TBInsumo_portal (PKCodigo_TBInsumo_portal, DFDescricao_TBInsumo_portal, DFIntegrado_TBInsumo_portal)
		SELECT PKCodigo_TBInsumo_portal, DFDescricao_TBInsumo_portal, DFIntegrado_TBInsumo_portal FROM dbo.TBInsumo_portal TABLOCKX')
GO
DROP TABLE dbo.TBInsumo_portal
GO
EXECUTE sp_rename N'dbo.Tmp_TBInsumo_portal', N'TBInsumo_portal', 'OBJECT'
GO
ALTER TABLE dbo.TBInsumo_portal ADD CONSTRAINT
	PK__TBInsumo_portal__0425A276 PRIMARY KEY CLUSTERED 
	(
	PKCodigo_TBInsumo_portal
	) ON [PRIMARY]

GO
COMMIT
