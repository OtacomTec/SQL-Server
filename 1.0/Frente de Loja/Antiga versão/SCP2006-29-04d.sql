/*
   sexta-feira, 28 de abril de 2006 18:07:15
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
ALTER TABLE dbo.TBComposicao_produto
	DROP CONSTRAINT FK__TBComposi__FKId___4242D080
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBComposicao_produto
	(
	PKId_TBComposicao_produto int NOT NULL,
	FKId_TBProduto int NOT NULL,
	DFCodigo_produto_relacionado_TBComposicao_produto int NULL,
	DFQuantidade_baixa_estoque_TBComposicao_produto money NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBComposicao_produto)
	 EXEC('INSERT INTO dbo.Tmp_TBComposicao_produto (PKId_TBComposicao_produto, FKId_TBProduto, DFCodigo_produto_relacionado_TBComposicao_produto, DFQuantidade_baixa_estoque_TBComposicao_produto)
		SELECT PKId_TBComposicao_produto, FKId_TBProduto, DFCodigo_produto_relacionado_TBComposicao_produto, DFQuantidade_baixa_estoque_TBComposicao_produto FROM dbo.TBComposicao_produto TABLOCKX')
GO
DROP TABLE dbo.TBComposicao_produto
GO
EXECUTE sp_rename N'dbo.Tmp_TBComposicao_produto', N'TBComposicao_produto', 'OBJECT'
GO
ALTER TABLE dbo.TBComposicao_produto ADD CONSTRAINT
	PK__TBComposicao_pro__30242045 PRIMARY KEY CLUSTERED 
	(
	PKId_TBComposicao_produto
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBComposicao_produto WITH NOCHECK ADD CONSTRAINT
	FK__TBComposi__FKId___4242D080 FOREIGN KEY
	(
	FKId_TBProduto
	) REFERENCES dbo.TBProduto
	(
	PKId_TBProduto
	)
GO
COMMIT
