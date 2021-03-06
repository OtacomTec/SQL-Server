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

SET @Nomenclatura = 'SCP2006-01-16b'
SET @Observacao = 'setando o campo tipo de preco na tabela tbTipo_frota'
SET @Data = CURRENT_TIMESTAMP


---LIMPEZA DA TABELA

DELETE FROM TBSCRIPT

---INSERCAO DO REGISTRO
INSERT INTO TBSCRIPT(DFNome_TBScript,DFObjetivo_TBScript,DFData_execucao_TBScript)
VALUES(@Nomenclatura,@Observacao,@Data)

---FIM CABECALHO

CREATE TABLE [dbo].[TBVencimento_nota_saida] (
	[PKId_TBVencimento_Nota] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[FKId_TBNota_saida] [int] NOT NULL ,
	[DFData_TBVencimento_Nota] [smalldatetime] NULL 
) ON [PRIMARY]

ALTER TABLE [dbo].[TBVencimento_nota_saida] WITH NOCHECK ADD 
	CONSTRAINT [PK_TBVencimento_nota_saida] PRIMARY KEY  CLUSTERED 
	(
		[PKId_TBVencimento_Nota]
	)  ON [PRIMARY] 
ALTER TABLE [dbo].[TBVencimento_nota_saida] ADD 
	CONSTRAINT [FK_TBVencimento_nota_saida_TBNota_saida] FOREIGN KEY 
	(
		[FKId_TBNota_saida]
	) REFERENCES [dbo].[TBNota_saida] (
		[PKId_TBNota_saida]
	)

COMMIT TRANSACTION