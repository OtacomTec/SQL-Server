/*
   segunda-feira, 16 de janeiro de 2006 11:53:13
   User: sa
   Server: ONLYTECH-02
   Database: BDRetaguarda
   Application: MS SQLEM - Data Tools
*/

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

SET @Nomenclatura = 'SCP2006-01-16a'
SET @Observacao = 'setando o campo tipo de preco na tabela tbTipo_frota'
SET @Data = CURRENT_TIMESTAMP


---LIMPEZA DA TABELA

DELETE FROM TBSCRIPT

---INSERCAO DO REGISTRO
INSERT INTO TBSCRIPT(DFNome_TBScript,DFObjetivo_TBScript,DFData_execucao_TBScript)
VALUES(@Nomenclatura,@Observacao,@Data)

---FIM CABECALHO

ALTER TABLE dbo.TBVencimento_Pedido
	DROP CONSTRAINT FK__TBVencime__FKId___4583F3E8
CREATE TABLE dbo.Tmp_TBVencimento_Pedido
	(
	PKId_TBVencimento_Pedido int NOT NULL IDENTITY (1, 1),
	FKId_TBPedido int NOT NULL,
	DFData_TBVencimento_Pedido smalldatetime NULL
	)  ON [PRIMARY]

SET IDENTITY_INSERT dbo.Tmp_TBVencimento_Pedido ON
IF EXISTS(SELECT * FROM dbo.TBVencimento_Pedido)
	 EXEC('INSERT INTO dbo.Tmp_TBVencimento_Pedido (PKId_TBVencimento_Pedido, FKId_TBPedido, DFData_TBVencimento_Pedido)
		SELECT PKId_TBVencimento_Pedido, FKId_TBPedido, CONVERT(smalldatetime, DFData_TBVencimento_Pedido) FROM dbo.TBVencimento_Pedido TABLOCKX')
SET IDENTITY_INSERT dbo.Tmp_TBVencimento_Pedido OFF
DROP TABLE dbo.TBVencimento_Pedido
EXECUTE sp_rename N'dbo.Tmp_TBVencimento_Pedido', N'TBVencimento_Pedido', 'OBJECT'
ALTER TABLE dbo.TBVencimento_Pedido ADD CONSTRAINT
	PK__TBVencimento_Ped__448FCFAF PRIMARY KEY CLUSTERED 
	(
	PKId_TBVencimento_Pedido
	) ON [PRIMARY]
ALTER TABLE dbo.TBVencimento_Pedido WITH NOCHECK ADD CONSTRAINT
	FK__TBVencime__FKId___4583F3E8 FOREIGN KEY
	(
	FKId_TBPedido
	) REFERENCES dbo.TBPedido
	(
	PKId_TBPedido
	)
COMMIT TRANSACTION
