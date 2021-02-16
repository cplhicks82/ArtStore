-- Find out where last purchase predates a customer's membership date.
select *
from tblCustomer
where LastPurchaseDate < MemberDate

-- Change all such purchase dates to match a customer's first date as a member.
begin tran
update tblCustomer
set [LastPurchaseDate] = MemberDate
where LastPurchaseDate < MemberDate

select *
from tblCustomer 
where LastPurchaseDate = MemberDate
commit tran

-- Find all customers that were assigned a transaction number of 0.
select *
from tblCustomer
where NumberPurchases = 0

-- Change date of last purchase to 'null' across all such rows.
begin tran
update tblCustomer
set LastPurchaseDate = null
where NumberPurchases = 0

select *
from tblCustomer
where NumberPurchases = 0
commit tran