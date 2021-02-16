if exists(select * from INFORMATION_SCHEMA.VIEWS
	where [TABLE_NAME] = 'NoPurchases' and [TABLE_SCHEMA] = 'dbo')
drop view dbo.NoPurchases
go
create view [dbo].[NoPurchases]
as
select C.CustNumber, CustFirstName, CustLastName, Amount as Purchases
from tblCustomer as C
left join tblPurchases as P
on C.CustNumber = P.CustNumber
where P.CustNumber is null
order by C.CustNumber
go