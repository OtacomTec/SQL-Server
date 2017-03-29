/*
   sexta-feira, 28 de abril de 2006 15:37:43
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
ALTER TABLE dbo.TBProduto
	DROP CONSTRAINT FK__TBProduto__IXCod__36D11DD4
GO
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBProduto
	(
	PKId_TBProduto int NOT NULL,
	IXCodigo_TBEmpresa int NOT NULL,
	IXCodigo_TBProduto int NOT NULL,
	DFDescricao_TBProduto nvarchar(40) NOT NULL,
	DFDescricao_resumida_TBProduto nvarchar(20) NOT NULL,
	DFReferencia_TBProduto nvarchar(30) NULL,
	DFCst_TBProduto char(1) NOT NULL,
	DFCst2_TBProduto char(2) NOT NULL,
	DFUnidade_venda_TBProduto char(3) NOT NULL,
	DFPreco_venda_TBProduto money NOT NULL,
	DFTipo_preco_TBProduto int NOT NULL,
	DFPreco_promocao_TBProduto money NULL,
	[DFData_inicio_promocao-TBProduto] smalldatetime NULL,
	[DFData_fim_promocao-TBProduto] smalldatetime NULL,
	DFUnidade_compra_TBProduto char(3) NOT NULL,
	DFFator_venda_TBProduto int NOT NULL,
	DFFator_compra_TBProduto int NOT NULL,
	DFSuspenso_TBProduto bit NOT NULL,
	DFInativo_TBProduto bit NOT NULL,
	DFBaixa_estoque_TBProduto bit NOT NULL,
	DFPeso_liquido_TBProduto money NULL,
	DFPeso_bruto_TBProduto money NULL,
	DFEstoque_atual_TBProduto money NULL,
	DFPath_imagem_TBProduto nvarchar(100) NULL,
	DFUnidade_varejo_TBProduto char(3) NULL,
	DFFator_varejo_TBProduto int NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBProduto)
	 EXEC('INSERT INTO dbo.Tmp_TBProduto (PKId_TBProduto, IXCodigo_TBEmpresa, IXCodigo_TBProduto, DFDescricao_TBProduto, DFDescricao_resumida_TBProduto, DFReferencia_TBProduto, DFCst_TBProduto, DFCst2_TBProduto, DFUnidade_venda_TBProduto, DFPreco_venda_TBProduto, DFTipo_preco_TBProduto, DFPreco_promocao_TBProduto, [DFData_inicio_promocao-TBProduto], [DFData_fim_promocao-TBProduto], DFUnidade_compra_TBProduto, DFFator_venda_TBProduto, DFFator_compra_TBProduto, DFSuspenso_TBProduto, DFInativo_TBProduto, DFBaixa_estoque_TBProduto, DFPeso_liquido_TBProduto, DFPeso_bruto_TBProduto, DFEstoque_atual_TBProduto, DFPath_imagem_TBProduto, DFUnidade_varejo_TBProduto, DFFator_varejo_TBProduto)
		SELECT PKId_TBProduto, IXCodigo_TBEmpresa, IXCodigo_TBProduto, DFDescricao_TBProduto, DFDescricao_resumida_TBProduto, DFReferencia_TBProduto, DFCst_TBProduto, DFCst2_TBProduto, DFUnidade_venda_TBProduto, DFPreco_venda_TBProduto, DFTipo_preco_TBProduto, DFPreco_promocao_TBProduto, [DFData_inicio_promocao-TBProduto], [DFData_fim_promocao-TBProduto], DFUnidade_compra_TBProduto, DFFator_venda_TBProduto, DFFator_compra_TBProduto, DFSuspenso_TBProduto, DFInativo_TBProduto, DFBaixa_estoque_TBProduto, DFPeso_liquido_TBProduto, DFPeso_bruto_TBProduto, DFEstoque_atual_TBProduto, DFPath_imagem_TBProduto, DFUnidade_varejo_TBProduto, DFFator_varejo_TBProduto FROM dbo.TBProduto TABLOCKX')
GO
ALTER TABLE dbo.TBCodigo_barras
	DROP CONSTRAINT FK__TBCodigo___FKId___3D7E1B63
GO
ALTER TABLE dbo.TBEstado_icms
	DROP CONSTRAINT FK__TBEstado___FKId___3E723F9C
GO
ALTER TABLE dbo.TBOcorrencia_produto
	DROP CONSTRAINT FK__TBOcorren__FKId___405A880E
GO
ALTER TABLE dbo.TBComposicao_produto
	DROP CONSTRAINT FK__TBComposi__FKId___4242D080
GO
ALTER TABLE dbo.TBBomba_bico
	DROP CONSTRAINT FK__TBBomba_b__FKId___6497E884
GO
DROP TABLE dbo.TBProduto
GO
EXECUTE sp_rename N'dbo.Tmp_TBProduto', N'TBProduto', 'OBJECT'
GO
ALTER TABLE dbo.TBProduto ADD CONSTRAINT
	PK__TBProduto__119F9925 PRIMARY KEY CLUSTERED 
	(
	PKId_TBProduto
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBProduto WITH NOCHECK ADD CONSTRAINT
	FK__TBProduto__IXCod__36D11DD4 FOREIGN KEY
	(
	IXCodigo_TBEmpresa
	) REFERENCES dbo.TBEmpresa
	(
	PKCodigo_TBEmpresa
	)
GO
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo.TBBomba_bico WITH NOCHECK ADD CONSTRAINT
	FK__TBBomba_b__FKId___6497E884 FOREIGN KEY
	(
	FKId_TBProduto
	) REFERENCES dbo.TBProduto
	(
	PKId_TBProduto
	)
GO
COMMIT
BEGIN TRANSACTION
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
BEGIN TRANSACTION
ALTER TABLE dbo.TBOcorrencia_produto WITH NOCHECK ADD CONSTRAINT
	FK__TBOcorren__FKId___405A880E FOREIGN KEY
	(
	FKId_TBProduto
	) REFERENCES dbo.TBProduto
	(
	PKId_TBProduto
	)
GO
COMMIT
BEGIN TRANSACTION
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
BEGIN TRANSACTION
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
