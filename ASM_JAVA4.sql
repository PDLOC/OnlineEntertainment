create database ASM_JAVA4
use ASM_JAVA4

create table Videos(
	videoId nvarchar(10) primary key,
	title nvarchar(255),
	poster nvarchar(255),
	luotxem int,
	mota nvarchar(255),
	active bit
);
-------------------------------------------------------------------------------------------
create table Favorites(
	favoriteId int identity(1,1) primary key ,
	userId nvarchar(10),
	videoId nvarchar(10),
	likedate date
);
-------------------------------------------------------------------------------------------
create table Users(
	userId nvarchar(10) primary key,
	password nvarchar(30),
	email nvarchar(125),
	fullname nvarchar(100),
	admin bit
);
-------------------------------------------------------------------------------------------
create table share(
	shareId int identity(1,1) primary key,
	userId nvarchar(10),
	videoId nvarchar(10),
	email nvarchar(125),
	sharedate date
);

--------------------------------------Favorite-------------------------------------------------
alter table Favorites add constraint fk_f_v foreign key(videoId) references Videos(videoID)
alter table Favorites add constraint fk_f_u foreign key(userId) references Users(userId)

--------------------------------------Share----------------------------------------------------
alter table share add constraint fk_s_v foreign key(videoId) references Videos(videoId)
alter table share add constraint fk_s_u foreign key(userId) references Users(userId)

insert into Users values
('user01','123456','hoanglong@gmail.com',N'Phạm Hoàng Long',1),
('user02','123456','lelan@gmail.com',N'Lê Lan',1),
('user03','123456','phamloc@gmail.com',N'Phạm Đại Lộc',1),
('user04','123456','hoangluan@gmail.com',N'Hoàng Luân',0),
('user05','123456','anh@gmail.com',N'Nguyễn Hoàng Anh',0),
('user06','123456','manh@gmail.com',N'Minh Anh',0),
('user07','123456','hongloan@gmail.com',N'Hồng Loan',0),
('user08','123456','nguyentuan@gmail.com',N'Nguyễn Minh Tuấn',1),
('user09','123456','minhlong@gmail.com',N'Hoàng Minh Long',1),
('user10','123456','lanlinh@gmail.com',N'Lan Linh',1)


insert into Videos values
('vd01',N'Chỉ Nhân Hồi Hồn (2022)','1.jpg',162,N'Phim tuyệt',1),
('vd02',N'Biệt Đội Siêu Anh Hùng: Hồi Kết (2019)','2.jpg',600,N'Phim hay',1),
('vd03',N'Đêm Của Những Tên Khốn (2022)','3.jpg',250,N'Phim bình thường',1),
('vd04',N'Gấu phê pha','4.jpg',300,N'Phim bình thường',0),
('vd05',N'Người Dơi: Ngày Tàn Của Gotham (2023)','5.jpg',10,N'Phim cũng hay',0),
('vd06',N'Viễn Cổ Cự Thú: Thằn Lằn Sói (2023)','6.jpg',823,N'Phim đỉnh',1),
('vd07',N'One Piece Film: Red (2022)','7.jpg',906,N'Phim đỉnh',1),
('vd08',N'Ông Trùm Mông Má (2023)','8.jpg',400,N'Phim hay',1),
('vd09',N'Shazam','9.jpg',506,N'Phim hay',0),
('vd10',N'Em chưa 18','10.jpg',500,N'Phim hay',1)

insert into Favorites values
('user01','vd07','03/12/2020'),
('user01','vd01','05/25/2020'),
('user01','vd06','01/05/2021'),
('user03','vd08','06/25/2020'),
('user03','vd02','10/12/2021'),
('user09','vd07','11/20/2020'),
('user09','vd05','05/12/2022'),
('user09','vd09','12/20/2022'),
('user04','vd04','03/12/2022'),
('user04','vd03','05/25/2021'),
('user04','vd07','09/20/2022')

create proc spFavoriteByYear(@Year int)
as 
begin
	SELECT
		v.title as 'group',
		count(f.videoId) as 'likes',
		max(f.likedate) as 'newest',
		min(f.likedate) as 'oldest'
	FROM Favorites f JOIN Videos v ON v.videoId = f.videoId
	WHERE year(f.likedate) = @Year
	GROUP BY v.title
end

select shareId, video from Favorites