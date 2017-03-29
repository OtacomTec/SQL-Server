
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_TBCfop
	(
	PKId_TBCfop int NOT NULL,
	DFCodigo_TBCfop int NOT NULL,
	DFDescricao_TBCfop nvarchar(40) NOT NULL,
	DFEstoque_TBCfop int NULL,
	DFGera_titulo_TBCfop bit NULL,
	DFEmitente_TBCfop bit NOT NULL,
	DFAtualiza_custo_TBCfop bit NOT NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBCfop)
	 EXEC('INSERT INTO dbo.Tmp_TBCfop (PKId_TBCfop, DFCodigo_TBCfop, DFDescricao_TBCfop, DFEstoque_TBCfop, DFGera_titulo_TBCfop, DFEmitente_TBCfop, DFAtualiza_custo_TBCfop)
		SELECT PKId_TBCfop, DFCodigo_TBCfop, DFDescricao_TBCfop, DFEstoque_TBCfop, DFGera_titulo_TBCfop, DFEmitente_TBCfop, DFAtualiza_custo_TBCfop FROM dbo.TBCfop TABLOCKX')
GO
DROP TABLE dbo.TBCfop
GO
EXECUTE sp_rename N'dbo.Tmp_TBCfop', N'TBCfop', 'OBJECT'
GO
ALTER TABLE dbo.TBCfop ADD CONSTRAINT
	PK__TBCfop__320C68B7 PRIMARY KEY CLUSTERED 
	(
	PKId_TBCfop
	) ON [PRIMARY]

GO
COMMIT
