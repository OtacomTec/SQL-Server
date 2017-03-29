BEGIN TRANSACTION
/*
 *** IDENTIFICA��O DO SCRIPT ***

 1 - Apartir de 20/12/2005, fica expressamente proibida a cria��o de scripts sem que seja preenchido este cabe�alho
 2 - Obrigatoriamente necess�rio que este paragrafo seja inserido apos um BEGIN TRANSACTION
 3 - Obrigatoriamente o preenchimento das variaveis abaixo(@Nomenclatura,@Observacao,@Data)com valores correspondentes e condizentes
 Att: Marcos

*/

--INICIO CABECALHO

declare @Nomenclatura as nvarchar(20)
declare @Observacao as nvarchar(100)
declare @Data as SMALLDATETIME

SET @Nomenclatura = 'SCP2005-12-22c'
SET @Observacao ='CRIA��O DOS RELACIONAMENTOS DA TABELA TBAcessibilidade_Empresa'
SET @Data = CURRENT_TIMESTAMP


---LIMPEZA DA TABELA
DELETE FROM TBSCRIPT

---INSERCAO DO REGISTRO
INSERT INTO TBSCRIPT(DFNome_TBScript,DFObjetivo_TBScript,DFData_execucao_TBScript)
VALUES(@Nomenclatura,@Observacao,@Data)

---FIM CABECALHO

---INICIO DO SCRIPT
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
COMMIT
BEGIN TRANSACTION
COMMIT
BEGIN TRANSACTION
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.TBAcessibilidade_Empresa
	(
	PKID_TBAcessibilidade_Empresa int NOT NULL,
	FKID_TBPrograma int NULL,
	DFCod_Empresa_envia_TBAcessibilidade_Empresa int NULL,
	DFCod_Empresa_recebe_TBAcessibilidade_Empresa int NULL,
	FKID_Menu int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TBAcessibilidade_Empresa ADD CONSTRAINT
	PK_TBAcessibilidade_Empresa PRIMARY KEY CLUSTERED 
	(
	PKID_TBAcessibilidade_Empresa
	) ON [PRIMARY]

GO
ALTER TABLE dbo.TBAcessibilidade_Empresa ADD CONSTRAINT
	FK_TBAcessibilidade_Empresa_TBMenu FOREIGN KEY
	(
	FKID_Menu
	) REFERENCES dbo.TBMenu
	(
	PKId_TBMenu
	)
GO
ALTER TABLE dbo.TBAcessibilidade_Empresa ADD CONSTRAINT
	FK_TBAcessibilidade_Empresa_TBProgramas FOREIGN KEY
	(
	FKID_TBPrograma
	) REFERENCES dbo.TBProgramas
	(
	PKId_TBProgramas
	)
GO
ALTER TABLE dbo.TBAcessibilidade_Empresa ADD CONSTRAINT
	FK_TBAcessibilidade_Empresa_TBEmpresa FOREIGN KEY
	(
	DFCod_Empresa_envia_TBAcessibilidade_Empresa
	) REFERENCES dbo.TBEmpresa
	(
	PKCodigo_TBEmpresa
	)
GO
ALTER TABLE dbo.TBAcessibilidade_Empresa ADD CONSTRAINT
	FK_TBAcessibilidade_Empresa_TBEmpresa1 FOREIGN KEY
	(
	DFCod_Empresa_recebe_TBAcessibilidade_Empresa
	) REFERENCES dbo.TBEmpresa
	(
	PKCodigo_TBEmpresa
	)
GO
COMMIT
