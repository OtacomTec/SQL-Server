checkpoint
go
backup log BDRetaguarda with truncate_only
go
dbcc shrinkfile (BDRetaguarda_log, 1)
go
