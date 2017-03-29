BEGIN TRANSACTION
/*
 *** IDENTIFICAÇÃO DO SCRIPT ***

 1 - Apartir de 20/12/2005, fica expressamente proibida a criação de scripts sem que seja preenchido este cabeçalho
 2 - Obrigatoriamente necessário que este paragrafo seja inserido apos um BEGIN TRANSACTION
 3 - Obrigatoriamente o preenchimento das variaveis abaixo(@Nomenclatura,@Observacao,@Data)com valores correspondentes e condizentes
 Att: Marcos

*/

--INICIO CABECALHO

declare @Nomenclatura as nvarchar(20)
declare @Observacao as nvarchar(100)
declare @Data as SMALLDATETIME

SET @Nomenclatura = 'SCP2005-12-22b'
SET @Observacao ='CRIAÇÃO DE UMA TABELA:TBAcessibilidade_Empresa'
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
COMMIT
