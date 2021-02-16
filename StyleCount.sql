with tblPreferredStyles as
(select CustNumber, P.TitleOfPiece, Style,
Count(Style) over(partition by CustNumber, Style) as StyleTotal
from tblPurchases as P
join tblArtwork as A
on P.TitleOfPiece = A.TitleOfPiece)
select * from tblPreferredStyles
group by CustNumber, TitleOfPiece, Style, StyleTotal
having StyleTotal > 1
order by CustNumber, StyleTotal
