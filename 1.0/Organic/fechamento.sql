if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK__TBEncerra__FKId___02C2D7A9]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TBEncerrante_caixa_posto] DROP CONSTRAINT FK__TBEncerra__FKId___02C2D7A9
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK__TBFechame__FKId___49898EF6]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TBFechamento_caixa_posto_finalizadora] DROP CONSTRAINT FK__TBFechame__FKId___49898EF6
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK__TBFechame__FKId___4A7DB32F]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TBFechamento_caixa_posto_venda_grupo] DROP CONSTRAINT FK__TBFechame__FKId___4A7DB32F
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK__TBFechame__FKId___01CEB370]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TBFechamento_caixa_produto_posto] DROP CONSTRAINT FK__TBFechame__FKId___01CEB370
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TBFechamento_caixa_posto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TBFechamento_caixa_posto]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TBFechamento_caixa_posto_finalizadora]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TBFechamento_caixa_posto_finalizadora]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TBFechamento_caixa_posto_venda_grupo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TBFechamento_caixa_posto_venda_grupo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TBFechamento_caixa_produto_posto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TBFechamento_caixa_produto_posto]
GO

CREATE TABLE [dbo].[TBFechamento_caixa_posto] (
	[PKId_TBFechamento_caixa_posto] [int] IDENTITY (1, 1) NOT NULL ,
	[FKCodigo_TBOperadores_ecf] [int] NOT NULL ,
	[DFData_TBFechamento_caixa_posto] [smalldatetime] NULL ,
	[DFTotal_finalizadoras_TBFechamento_caixa_posto] [money] NULL ,
	[DFTotal_troco_TBFechamento_caixa_posto] [money] NULL ,
	[DFTotal_vendas_grupo_TBFechamento_caixa_posto] [money] NULL ,
	[DFResultado_TBFechamento_caixa_posto] [money] NULL ,
	[DFObservacao_TBFechamento_caixa_posto] [nvarchar] (300) COLLATE Latin1_General_CI_AS NULL ,
	[DFCheque_troco_TBFechamento_caixa_posto] [money] NULL ,
	[DFIntegrado_portal_TBFechamento_caixa_posto] [bit] NULL ,
	[DFIntegrado_filiais_TBFechamento_caixa_posto] [bit] NULL ,
	[DFData_alteracao_TBFechamento_caixa_posto] [smalldatetime] NULL ,
	[DFCodigo_Identificador_TBFechamento_caixa_posto] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TBFechamento_caixa_posto_finalizadora] (
	[PKId_TBFechamento_caixa_posto_finalizadora] [int] IDENTITY (1, 1) NOT NULL ,
	[FKId_TBFinalizadora] [int] NOT NULL ,
	[FKId_TBFechamento_caixa_posto] [int] NOT NULL ,
	[DFValor_total_TBFechamento_caixa_posto_finalizadora] [money] NULL ,
	[DFIntegrado_portal_TBFechamento_caixa_posto_finalizadora] [bit] NULL ,
	[DFIntegrado_filiais_TBFechamento_caixa_posto_finalizadora] [bit] NULL ,
	[DFData_alteracao_TBFechamento_caixa_posto_finalizadora] [smalldatetime] NULL ,
	[DFCodigo_Identificador_TBFechamento_caixa_posto_finalizadora] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TBFechamento_caixa_posto_venda_grupo] (
	[PKId_TBFechamento_caixa_posto_venda_grupo] [int] IDENTITY (1, 1) NOT NULL ,
	[FKCodigo_TBSecao] [int] NOT NULL ,
	[FKId_TBFechamento_caixa_posto] [int] NOT NULL ,
	[DFValor_total_TBFechamento_caixa_posto_venda_grupo] [money] NULL ,
	[DFIntegrado_portal_TBFechamento_caixa_posto_venda_grupo] [bit] NULL ,
	[DFIntegrado_filiais_TBFechamento_caixa_posto_venda_grupo] [bit] NULL ,
	[DFData_alteracao_TBFechamento_caixa_posto_venda_grupo] [smalldatetime] NULL ,
	[DFCodigo_Identificador_TBFechamento_caixa_posto_venda_grupo] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TBFechamento_caixa_produto_posto] (
	[PKIdTBFechamento_caixa_produto_posto] [int] IDENTITY (1, 1) NOT NULL ,
	[FKId_TBFechamento_caixa_posto] [int] NOT NULL ,
	[FKId_TBProduto] [int] NOT NULL ,
	[DFQuantidade_TBFechamento_caixa_produto_posto] [money] NULL ,
	[DFValor_unitario_TBFechamento_caixa_produto_posto] [money] NULL ,
	[DFValor_Total_TBFechamento_caixa_produto_posto] [money] NULL ,
	[DFIntegrado_portal_TBFechamento_caixa_produto_posto] [bit] NULL ,
	[DFIntegrado_filiais_TBFechamento_caixa_produto_posto] [bit] NULL ,
	[DFData_alteracao_TBFechamento_caixa_produto_posto] [smalldatetime] NULL ,
	[DFCodigo_Identificador_TBFechamento_caixa_produto_posto] [int] NULL ,
	[DFTipo_preco_TBfechamento_caixa_produto_posto] [int] NULL 
) ON [PRIMARY]
GO

