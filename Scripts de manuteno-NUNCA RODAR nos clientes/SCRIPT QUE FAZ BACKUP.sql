/*PARTE DE DECLARAÇÃO DE VARIÁVEIS*/ 

/* Variáveis utilizadas para montar o nome do arquivo de backup e o nome dos devices para backup*/
DECLARE @Data varchar(20), @Data1 varchar(20), @Data2 varchar (20), @PathBackup varchar(200), @ExtensaoArquivoBAckup varchar(4)
DECLARE @Nome_Data_Base_Device varchar(255), @Nome_Data_Base_Backup varchar(255) 

set @Data = rtrim(CONVERT(char,getdate(), 112)) /*Variável que guarda a data em formato universal para compor o nome do arquivo de backup*/
set @Data1 = rtrim(CONVERT(char,getdate() - 1, 112)) /*Variável que guarda a data em formato universal para compor o nome do arquivo de backup*/
set @Data2 = rtrim(CONVERT(char,getdate() - 2, 112)) /*Variável que guarda a data em formato universal para compor o nome do arquivo de backup*/
set @PathBackup = 'C:\Arquivos de programas\Client_Onlytech\UTIL\Backup\Backup_sql' /*Variável que guarda o path onde estão sendo feitos os Backups*/
set @ExtensaoArquivoBAckup = '.bak' 


/*PARTE DE CONFIGURACAO DOS DEVICES*/ 

/*Seleciono os bancos que farei backup*/
DECLARE data_bases CURSOR FOR SELECT Name FROM sysdatabases WHERE Name not in ('master','model','msdb','Northwind','pubs','tempdb','BDGPB','BDLog','BDLog_Morto','BDRetaguarda_Morto')
OPEN data_bases
FETCH NEXT FROM data_bases INTO @Nome_Data_Base_Device
WHILE @@FETCH_STATUS = 0
BEGIN
     if EXISTS (select Name FROM sysdevices WHERE Name = @Nome_Data_Base_Device) 
     Begin
         EXEC sp_dropdevice @Nome_Data_Base_Device
     end
     set @Nome_Data_Base_Backup = @PathBackup + @Nome_Data_Base_Device + '_' + @Data + @ExtensaoArquivoBAckup
     EXEC sp_addumpdevice 'disk', @Nome_Data_Base_Device, @Nome_Data_Base_Backup
     FETCH NEXT FROM data_bases INTO @Nome_Data_Base_Device 
END
CLOSE data_bases
DEALLOCATE data_bases 


/*PARTE DE BACKUP DOS BANCOS DE DADOS*/ 

DECLARE @Nome_Data_Base varchar(50) /*Variável que guarda o nome do banco de dados*/
DECLARE data_bases CURSOR FOR SELECT Name FROM sysdatabases WHERE Name not in ('master','model','msdb','Northwind','pubs','tempdb','BDGPB','BDLog','BDLog_Morto','BDRetaguarda_Morto')
OPEN data_bases
FETCH NEXT FROM data_bases INTO @Nome_Data_Base
WHILE @@FETCH_STATUS = 0
BEGIN
     BACKUP DATABASE @Nome_Data_Base TO @Nome_Data_Base
     FETCH NEXT FROM data_bases INTO @Nome_Data_Base
END
CLOSE data_bases
DEALLOCATE data_bases 


/*PARTE DE DELEÇÃO DOS DEVICES PARA OS BANCOS DE DADOS QUE NÃO EXISTEM MAIS*/ 

DECLARE devices CURSOR FOR SELECT Name FROM sysdevices WHERE Name not in ('master','model','msdb','Northwind','pubs','tempdb','BDGPB','BDLog','BDLog_Morto','BDRetaguarda_Morto')
OPEN devices
FETCH NEXT FROM devices INTO @Nome_Data_Base_Device
WHILE @@FETCH_STATUS = 0
BEGIN
     if ((SELECT COUNT(Name) FROM sysdatabases WHERE Name = @Nome_Data_Base_Device)= 0)
     Begin
         EXEC sp_dropdevice @Nome_Data_Base_Device
     End
     FETCH NEXT FROM devices INTO @Nome_Data_Base_Device
END
CLOSE devices
DEALLOCATE devices 


/*PARTE DE DELEÇÃO DOS BACKUPS FEITOS X DIAS ANTES DA ÚLTIMA EXECUÇÃO*/ 

DECLARE @pObj int, @FileNameDeleted varchar (100)
DECLARE data_bases CURSOR FOR SELECT Name FROM sysdatabases WHERE Name not in ('master','model','msdb','Northwind','pubs','tempdb','BDGPB','BDLog','BDLog_Morto','BDRetaguarda_Morto')
OPEN data_bases
FETCH NEXT FROM data_bases INTO @Nome_Data_Base
EXEC sp_OACreate "Scripting.FileSystemObject", @pObj OUT

WHILE @@FETCH_STATUS = 0
BEGIN
     set @FileNameDeleted = @PathBackup + @Nome_Data_Base + '_' + @Data2 + @ExtensaoArquivoBAckup
     EXEC sp_OAMethod @pObj, "DeleteFile", null, @FileNameDeleted
     FETCH NEXT FROM data_bases INTO @Nome_Data_Base
END
EXEC sp_OADestroy @pObj
CLOSE data_bases
DEALLOCATE data_bases
GO 
