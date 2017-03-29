/*
   quarta-feira, 10 de maio de 2006 16:22:19
   User: sa
   Server: ONLYTECH-DADOS
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
CREATE TABLE dbo.Tmp_TBOperadores_ecf
	(
	PKCodigo_TBOperadores_ecf int NOT NULL,
	DFNome_TBOperadores_ecf nvarchar(50) NULL,
	DFNivel_TBOperadores_ecf int NULL,
	DFNumero_cartao_TBOperadores_ecf bigint NULL,
	DFSenha_TBOperadores_ecf nvarchar(10) NULL,
	FKCodigo_TBEmpresa int NOT NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.TBOperadores_ecf)
	 EXEC('INSERT INTO dbo.Tmp_TBOperadores_ecf (PKCodigo_TBOperadores_ecf, DFNome_TBOperadores_ecf, DFNivel_TBOperadores_ecf, DFNumero_cartao_TBOperadores_ecf, DFSenha_TBOperadores_ecf, FKCodigo_TBEmpresa)
		SELECT PKCodigo_TBOperadores_ecf, DFNome_TBOperadores_ecf, DFNivel_TBOperadores_ecf, CONVERT(bigint, DFNumero_cartao_TBOperadores_ecf), DFSenha_TBOperadores_ecf, FKCodigo_TBEmpresa FROM dbo.TBOperadores_ecf TABLOCKX')
GO
DROP TABLE dbo.TBOperadores_ecf
GO
EXECUTE sp_rename N'dbo.Tmp_TBOperadores_ecf', N'TBOperadores_ecf', 'OBJECT'
GO
COMMIT
