if exists(select * from sys.objects
	where type = 'p' and name = 'CustPreferredStyle')
drop proc CustPreferredStyle 
go

create proc CustPreferredStyle(@CustNumber smallint)
as
begin
	
	with tblPreferredStyles as
	(select CustNumber, P.TitleOfPiece, Style,
	Count(Style) over(partition by CustNumber, Style) as StyleTotal
	from tblPurchases as P
	join tblArtwork as A
	on P.TitleOfPiece = A.TitleOfPiece)
	select Style from tblPreferredStyles
	where CustNumber = @CustNumber
	group by StyleTotal, Style 
	having StyleTotal > 1

end
go

