USE Master
GO
-- Coloca o database em modo de emergência
ALTER DATABASE PDV_OFFLINE SET EMERGENCY
GO
-- Realiza um check do database
DBCC CHECKDB('PDV_OFFLINE')
GO
-- Altera o database para SINGLE_USER, ou seja, só um usuário pode estar conectado
ALTER DATABASE PDV_OFFLINE SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
-- Realiza o comando para reparo do database
DBCC CHECKDB('PDV_OFFLINE', REPAIR_ALLOW_DATA_LOSS) WITH NO_INFOMSGS, ALL_ERRORMSGS
GO
-- Volta a base de dados para multiplos usuários
ALTER DATABASE PDV_OFFLINE SET MULTI_USER
GO
--Warning: The log for database 'PDV_OFFLINE' has been rebuilt. Transactional consistency has been lost. The RESTORE chain was broken, and the server no longer has context on the previous log files, so you will need to know what they were. You should run DBCC CHECKDB to validate physical consistency. The database has been put in dbo-only mode. When you are ready to make the database available for use, you will need to reset database options and delete any extra log files.
-- Restarta o status do database
EXEC sp_resetstatus 'PDV_OFFLINE'