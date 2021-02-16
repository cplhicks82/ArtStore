if exists(select * from sys.objects
	where type = 'p' and name = 'TotalCustPurchases')
drop proc TotalCustPurchases  
go

create proc TotalCustPurchases(@CustNumber smallint)
as
begin

	with tblCustTotal as
	(select *, 
	sum(Amount) over(partition by CustNumber order by CustNumber
	rows between unbounded preceding and current row) as CustTotal
	from tblPurchases)
	select *
	from tblCustTotal
	where CustNumber = @CustNumber

end
go

