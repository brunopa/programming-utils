ALTER DATABASE BPO SET EMERGENCY
DBCC CHECKDB (BPO)
ALTER DATABASE BPO SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DBCC CHECKDB (BPO, REPAIR_ALLOW_DATA_LOSS)
GO
ALTER DATABASE BPO SET MULTI_USER
GO
