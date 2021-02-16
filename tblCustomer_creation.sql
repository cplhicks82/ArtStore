if exists(select * from INFORMATION_SCHEMA.TABLES
	where [TABLE_NAME] = 'tblCustomer' and [TABLE_SCHEMA] = 'dbo')
	drop table dbo.tblCustomer
go

Create table tblCustomer
(
CustNumber smallint constraint PK_tblCustomer PRIMARY KEY IDENTITY(1,1) not null,
CustFirstName char(20) not null,
CustLastName char(20) not null,
CustPhoneNumber varchar(15),
CustEmail varchar(50) not null,
MemberDate date not null,
LastPurchaseDate date,
NumberPurchases tinyint,
PreferredStyle char(22)
);

insert into tblCustomer(CustFirstName, CustLastName, CustPhoneNumber, CustEmail, MemberDate,
	LastPurchaseDate, NumberPurchases, PreferredStyle)
values('Ben', 'Vaughn', '456-987-1452', 'bvaughn@email.com', '2015-01-01', '2019-5-6', '3', 'Impressionism')

select * from tblCustomer