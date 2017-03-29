/*
   sexta-feira, 28 de abril de 2006 18:13:29
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
ALTER TABLE dbo.TBEstado_icms
	DROP CONSTRAINT FK__TBEstado___FKId___3E723F9C
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBEstado_icms
	(
	PKId_TBEstado_icms int NOT NULL,
	FKId_TBProduto int NOT NULL,
	DFUf_TBEstado_icms char(2) NOT NULL,
	DFPercentual_icms_saida_juridica_TBEstado_icms money NULL,
	DFPercentual_icms_saida_fisica_TBEstado_icms money NULL,
	DFPercentual_icms_entrada_TBEstado_icms money NULL,
	DFPercentual_icms_substituicao_TBEstado_icms money NULL,
	DFTributacao_impressora_fiscal_TBEstado_icms char(3) NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBEstado_icms)
	 EXEC('INSERT INTO dbo.Tmp_TBEstado_icms (PKId_TBEstado_icms, FKId_TBProduto, DFUf_TBEstado_icms, DFPercentual_icms_saida_juridica_TBEstado_icms, DFPercentual_icms_saida_fisica_TBEstado_icms, DFPercentual_icms_entrada_TBEstado_icms, DFPercentual_icms_substituicao_TBEstado_icms)
		SELECT PKId_TBEstado_icms, FKId_TBProduto, DFUf_TBEstado_icms, DFPercentual_icms_saida_juridica_TBEstado_icms, DFPercentual_icms_saida_fisica_TBEstado_icms, DFPercentual_icms_entrada_TBEstado_icms, DFPercentual_icms_substituicao_TBEstado_icms FROM dbo.TBEstado_icms TABLOCKX')
GO
DROP TABLE dbo.TBEstado_icms
GO
EXECUTE sp_rename N'dbo.Tmp_TBEstado_icms', N'TBEstado_icms', 'OBJECT'
GO
ALTER TABLE dbo.TBEstado_icms ADD CONSTRAINT
	PK__TBEstado_icms__1758727B PRIMARY KEY CLUSTERED 
	(
	PKId_TBEstado_icms
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBEstado_icms WITH NOCHECK ADD CONSTRAINT
	FK__TBEstado___FKId___3E723F9C FOREIGN KEY
	(
	FKId_TBProduto
	) REFERENCES dbo.TBProduto
	(
	PKId_TBProduto
	)
GO
COMMIT
