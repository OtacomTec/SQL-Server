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

SET @Nomenclatura = 'SCP2006-08-28a'
SET @Observacao = 'Cria Campo Falecido na TBAssociado e na TBDependentes_Associados'
SET @Data = CURRENT_TIMESTAMP

---LIMPEZA DA TABELA

DELETE FROM TBSCRIPT

---INSERCAO DO REGISTRO

INSERT INTO TBSCRIPT(DFNome_TBScript,DFObjetivo_TBScript,DFData_execucao_TBScript)
VALUES(@Nomenclatura,@Observacao,@Data)

---FIM CABECALHO

ALTER TABLE dbo.TBAssociado ADD
	DFFalecido_TBAssociado bit NOT NULL CONSTRAINT DF_TBAssociado_DFFalecido_TBAssociado DEFAULT 0

ALTER TABLE dbo.TBDependentes_Associados ADD
	DFFalecido_TBDependentes_Associados bit NOT NULL CONSTRAINT DF_TBDependentes_Associados_DFFalecido_TBDependentes_Associados DEFAULT 0


COMMIT TRANSACTION


