/*
   quarta-feira, 10 de maio de 2006 16:31:50
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
EXECUTE sp_rename N'dbo.TBParametros_ecf.strDFDigita_mensagem_sangria_TBParametros_ecf', N'Tmp_DFDigita_mensagem_sangria_TBParametros_ecf', 'COLUMN'
GO
EXECUTE sp_rename N'dbo.TBParametros_ecf.Tmp_DFDigita_mensagem_sangria_TBParametros_ecf', N'DFDigita_mensagem_sangria_TBParametros_ecf', 'COLUMN'
GO
COMMIT
