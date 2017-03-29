/*
   quinta-feira, 27 de abril de 2006 18:26:03
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
CREATE TABLE dbo.Tmp_TBCidade_otica
	(
	PKId_TBCidade_otica int NOT NULL,
	IXCodigo_Correios_TBCidade_otica int NULL,
	DFNome_TBCidade_otica nvarchar(40) NOT NULL,
	DFPais_TBCidade_otica char(2) NOT NULL,
	DFUf_TBCidade_otica char(2) NOT NULL,
	DFPopulação_TBCidade_otica int NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBCidade_otica)
	 EXEC('INSERT INTO dbo.Tmp_TBCidade_otica (PKId_TBCidade_otica, IXCodigo_Correios_TBCidade_otica, DFNome_TBCidade_otica, DFPais_TBCidade_otica, DFUf_TBCidade_otica, DFPopulação_TBCidade_otica)
		SELECT PKId_TBCidade_otica, IXCodigo_Correios_TBCidade_otica, DFNome_TBCidade_otica, DFPais_TBCidade_otica, DFUf_TBCidade_otica, DFPopulação_TBCidade_otica FROM dbo.TBCidade_otica TABLOCKX')
GO
DROP TABLE dbo.TBCidade_otica
GO
EXECUTE sp_rename N'dbo.Tmp_TBCidade_otica', N'TBCidade_otica', 'OBJECT'
GO
ALTER TABLE dbo.TBCidade_otica ADD CONSTRAINT
	PK__TBCidade_otica__35DCF99B PRIMARY KEY CLUSTERED 
	(
	PKId_TBCidade_otica
	) ON [PRIMARY]

GO
COMMIT
