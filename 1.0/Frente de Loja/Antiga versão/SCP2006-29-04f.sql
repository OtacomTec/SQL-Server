/*
   quinta-feira, 27 de abril de 2006 18:48:01
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
CREATE TABLE dbo.Tmp_TBFinalizadora
	(
	PKId_TBFinalizadora int NOT NULL,
	IXCodigo_TBFinalizadora int NOT NULL,
	DFDescricao_TBFinalizadora nvarchar(40) NOT NULL,
	DFModalidade_TBFinalizadora int NOT NULL,
	DFAcrescimo_desconto_TBFinalizadora int NOT NULL,
	DFPercentual_TBFinalizadora money NULL,
	DFDebito_credito_TBFinalizadora bit NULL,
	DFTroco_TBFinalizadora bit NULL,
	DFControle_venda_TBFinalizadora bit NULL,
	DFCodificacao_impressora_fiscal_TBFinalizadora char(3) NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBFinalizadora)
	 EXEC('INSERT INTO dbo.Tmp_TBFinalizadora (PKId_TBFinalizadora, IXCodigo_TBFinalizadora, DFDescricao_TBFinalizadora, DFModalidade_TBFinalizadora, DFAcrescimo_desconto_TBFinalizadora, DFPercentual_TBFinalizadora, DFDebito_credito_TBFinalizadora, DFTroco_TBFinalizadora, DFControle_venda_TBFinalizadora, DFCodificacao_impressora_fiscal_TBFinalizadora)
		SELECT PKId_TBFinalizadora, IXCodigo_TBFinalizadora, DFDescricao_TBFinalizadora, DFModalidade_TBFinalizadora, DFAcrescimo_desconto_TBFinalizadora, DFPercentual_TBFinalizadora, DFDebito_credito_TBFinalizadora, DFTroco_TBFinalizadora, DFControle_venda_TBFinalizadora, DFCodificacao_impressora_fiscal_TBFinalizadora FROM dbo.TBFinalizadora TABLOCKX')
GO
ALTER TABLE dbo.TBOperacao_caixa
	DROP CONSTRAINT FK__TBOperaca__FKId___4BCC3ABA
GO
DROP TABLE dbo.TBFinalizadora
GO
EXECUTE sp_rename N'dbo.Tmp_TBFinalizadora', N'TBFinalizadora', 'OBJECT'
GO
ALTER TABLE dbo.TBFinalizadora ADD CONSTRAINT
	PK__TBFinalizadora__2E3BD7D3 PRIMARY KEY CLUSTERED 
	(
	PKId_TBFinalizadora
	) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.TBOperacao_caixa WITH NOCHECK ADD CONSTRAINT
	FK__TBOperaca__FKId___4BCC3ABA FOREIGN KEY
	(
	FKId_TBFinalizadora
	) REFERENCES dbo.TBFinalizadora
	(
	PKId_TBFinalizadora
	)
GO
COMMIT
