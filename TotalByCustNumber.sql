-- Creating a view that allows users to see purchase totals by Customer Number.

if exists(select * from INFORMATION_SCHEMA.VIEWS
	where [TABLE_NAME] = 'tblPurchasesTotals' and [TABLE_SCHEMA] = 'dbo')
drop view dbo.tblPurchasesTotals
go
create view [dbo].[tblPurchasesTotals]
as
select P.CustNumber, CustFirstName, CustLastName, sum(Amount) as TotalAmount
from tblCustomer as C
join tblPurchases as P
on C.CustNumber = P.CustNumber
group by P.CustNumber, CustFirstName, CustLastName
WITH CHECK OPTION