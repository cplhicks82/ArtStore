if exists(select * from INFORMATION_SCHEMA.TABLES
		  where [TABLE_NAME] = 'tblArtist' and [TABLE_SCHEMA] = 'dbo')
drop table dbo.tblArtist
go
create table tblArtist(
ArtistFirstName char(20),
ArtistLastName char(20),
ArtistBirthplace char(25),
Style char(22),
constraint PK_tblArtist PRIMARY KEY(ArtistFirstName, ArtistLastName)
)

insert into tblArtist (ArtistFirstName, ArtistLastName, ArtistBirthplace, Style)
values ('Leonardo', 'DaVinci', 'Anchiano', 'High Renaissance')

select *
from tblArtist