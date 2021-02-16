if exists(select * from INFORMATION_SCHEMA.TABLES
	where [TABLE_NAME] = 'tblArtwork' and [TABLE_SCHEMA] = 'dbo')
drop table tblArtwork 
go

create table tblArtwork (
	ArtistFirstName char(20) not null,
	ArtistLastName char(20) not null,
	TitleOfPiece varchar(20) not null,
	Year smallint not null,
	Style char(22) not null,
	Price money not null,
	constraint FK_tblArtwork foreign key (ArtistFirstName, ArtistLastName)
		references tblArtist (ArtistFirstName, ArtistLastName),
	constraint PK_tblArtwork primary key (TitleOfPiece)
)

insert into tblArtwork (ArtistFirstName, ArtistLastName, TitleOfPiece, Year, Style, Price)
values ('Leonardo', 'DaVinci', 'Gravity', '1725', 'Sculpture', '1000')

select * from tblArtwork