alter table [dbo].[tblCustomer]	
add
	[ValidFrom] datetime2(2) Generated Always as ROW START CONSTRAINT def_ValidFrom DEFAULT sysutcdatetime(),
	[ValidTo] datetime2(2) Generated Always as ROW END CONSTRAINT def_ValidTo DEFAULT
																  convert(datetime2(2), '9999-12-31 23:59:59.999'),

Period for system_time (ValidFrom, ValidTo)

	
alter table [dbo].[tblCustomer] 
set (system_versioning = On (HISTORY_TABLE = dbo.tblCustomerHistory))