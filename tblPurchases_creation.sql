if exists(select * from INFORMATION_SCHEMA.TABLES
	where [TABLE_NAME] = 'tblPurchases' and [TABLE_SCHEMA] = 'dbo')
drop table dbo.tblPurchases
go

create table tblPurchases(
	CustNumber smallint not null,
	DateOfPurchase date not null,
	Amount money not null,	
	TitleOfPiece varchar(20) not null,
	constraint PK_tblPurchases primary key(CustNumber, DateOfPurchase),
	constraint FK_tblPurchases foreign key(CustNumber) references tblCustomer(CustNumber))

insert into tblPurchases(CustNumber, DateOfPurchase, Amount, TitleOfPiece)
values('1', '2020-01-01', '25', 'The Golem')

select * from tblPurchases