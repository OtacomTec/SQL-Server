/*
   terça-feira, 22 de novembro de 2005 10:57:01
   User: 
   Server: ONLYTECH-02
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
CREATE TABLE dbo.Tmp_TBSinief
	(
	PKId_TBSinief int NOT NULL IDENTITY (1, 1),
	DFNumero_CTRC_TBSinief int NULL,
	DFSerie_CTRC_TBSinief char(3) NULL,
	DFSubserie_CTRC_TBSinief char(2) NULL,
	DFModelo_CTRC_TBSinief char(2) NULL,
	DFData_emissao_ctrc_TBSinief smalldatetime NULL,
	DFCodigo_operacao_TBSinief int NULL,
	DFValor_ctrc_TBSinief nvarchar(15) NULL,
	DFAliquota_ctrc_TBSinief money NULL,
	FKCodigo_TBEmpresa int NULL,
	DFCnpj_destinatario_TBSinief nvarchar(20) NULL,
	DFCnpj_Emitente_Nota_Fiscal_TBSinief nvarchar(20) NULL,
	DFCif_fob_TBSinief char(3) NULL,
	DFNumero_Nota_Fiscal_TBSinief int NULL,
	DFComplemento_Frete_TBSinief char(1) NULL,
	DFIndicativo_operacao_TBSinief int NULL,
	DFData_Nota_Fiscal_TBSinief smalldatetime NULL,
	DFIndicativo_Nota_Fiscal_TBSinief char(1) NULL,
	DFNumero_Transporte_TBSinief nvarchar(10) NULL,
	DFTipo_Transporte_TBSinief char(1) NULL,
	DFUf_origem_TBSinief char(2) NULL,
	DFIndicativo_regime_especial_TBSinief char(1) NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_TBSinief ON
GO
IF EXISTS(SELECT * FROM dbo.TBSinief)
	 EXEC('INSERT INTO dbo.Tmp_TBSinief (PKId_TBSinief, DFNumero_CTRC_TBSinief, DFSerie_CTRC_TBSinief, DFSubserie_CTRC_TBSinief, DFModelo_CTRC_TBSinief, DFData_emissao_ctrc_TBSinief, DFCodigo_operacao_TBSinief, DFValor_ctrc_TBSinief, DFAliquota_ctrc_TBSinief, FKCodigo_TBEmpresa, DFCnpj_destinatario_TBSinief, DFCnpj_Emitente_Nota_Fiscal_TBSinief, DFCif_fob_TBSinief, DFNumero_Nota_Fiscal_TBSinief, DFComplemento_Frete_TBSinief)
		SELECT PKId_TBSinief, DFNumero_CTRC_TBSinief, DFSerie_CTRC_TBSinief, DFSubserie_CTRC_TBSinief, DFModelo_CTRC_TBSinief, DFData_emissao_ctrc_TBSinief, DFCodigo_operacao_TBSinief, CONVERT(nvarchar(15), DFValor_ctrc_TBSinief), DFAliquota_ctrc_TBSinief, FKCodigo_TBEmpresa, DFCnpj_destinatario_TBSinief, DFCnpj_Emitente_Nota_Fiscal_TBSinief, DFCif_fob_TBSinief, DFNumero_Nota_Fiscal_TBSinief, DFComplemento_Frete_TBSinief FROM dbo.TBSinief TABLOCKX')
GO
SET IDENTITY_INSERT dbo.Tmp_TBSinief OFF
GO
DROP TABLE dbo.TBSinief
GO
EXECUTE sp_rename N'dbo.Tmp_TBSinief', N'TBSinief', 'OBJECT'
GO
ALTER TABLE dbo.TBSinief ADD CONSTRAINT
	PK__TBSinief__5CDB8F35 PRIMARY KEY CLUSTERED 
	(
	PKId_TBSinief
	) ON [PRIMARY]

GO
COMMIT
