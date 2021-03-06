if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TBItens_cupom]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TBItens_cupom]
GO

CREATE TABLE [dbo].[TBItens_cupom] (
	[PKId_TBItens_cupom] [int] IDENTITY (1, 1) NOT NULL ,
	[FKId_TBCupom] [int] NOT NULL ,
	[DFCodigo_TBProduto] [int] NOT NULL ,
	[DFCst1_TBItens_cupom] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL ,
	[DFCst2_TBItens_cupom] [char] (2) COLLATE Latin1_General_CI_AS NOT NULL ,
	[DFQuantidade_TBItens_cupom] [money] NOT NULL ,
	[DFTipo_preco_TBItens_cupom] [int] NOT NULL ,
	[DFPreco_tabela_TBItens_cupom] [money] NOT NULL ,
	[DFPercentual_desconto_TBItens_cupom] [money] NOT NULL ,
	[DFPreco_praticado_TBItens_cupom] [money] NOT NULL ,
	[DFValor_total_tabela_TBItens_cupom] [money] NOT NULL ,
	[DFValor_total_praticado_TBItens_cupom] [money] NOT NULL ,
	[DFPercentual_icms_TBItens_cupom] [money] NOT NULL ,
	[DFValor_total_icms_TBItens_cupom] [money] NOT NULL ,
	[DFUnidade_TBItens_cupom] [char] (3) COLLATE Latin1_General_CI_AS NOT NULL ,
	[DFCusto_real_TBItens_cupom] [money] NOT NULL ,
	[DFCusto_contabil_TBItens_cupom] [money] NOT NULL ,
	[DFCusto_medio_TBItens_cupom] [money] NOT NULL ,
	[DFPeso_liquido_TBItens_cupom] [money] NOT NULL ,
	[DFPeso_bruto_TBItens_cupom] [money] NOT NULL ,
	[DFQuantidade_baixa_estoque_TBItens_cupom] [money] NOT NULL ,
	[DFValor_total_item_TBItens_cupom] [money] NOT NULL ,
	[DFDivisor_baixa_estouqe_TBItens_cupom] [int] NULL ,
	[DFItens_cupom_Registrado_TBItens_cupom] [char] (10) COLLATE Latin1_General_CI_AS NULL ,
	[DFControle_bico_TBItens_cupom] [int] NULL ,
	[DFIntegrado_filiais_TBItens_cupom] [bit] NULL ,
	[DFIntegrado_portal_TBItens_cupom] [bit] NULL ,
	[DFData_alteracao_TBItens_cupom] [smalldatetime] NULL ,
	[DFCodigo_Identificador_TBItens_cupom] [int] NULL 
) ON [PRIMARY]
GO

