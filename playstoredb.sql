CREATE DATABASE playstoredb;
USE playstoredb;

CREATE TABLE DEVELOPERS(
DeveloperID INT primary key,
DeveloperName VARCHAR(60) Not NUll,
Country VARCHAR(30) ,
Foundedyear INT
);
select * from developers;
INSERT INTO DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear)
VALUES
(101,"Google LLC","USA",1989),
(102,"Meta Platform" ,"USA ",2004),
(103,"Spotify AB","Sweden",2006),
(104,"Canva pty Ltd","Australia",2012),
(105,"BYJUS","India" ,2011);

select * from developers;

create table Publishers(
PublisherID int primary key,
PublisherName varchar (60) ,
HeadOffice varchar(40),
SupportEmail varchar(60)
);
select * from Publishers
insert into Publishers(PublisherID,PublisherName,HeadOffice,SupportEmail)
values
(201,"Google Play","California","Support@Google.com"),
(202,"Samsung Galaxy Store","Seoul","Support@Samsung.com"),
(203,"Huawei Appgallery","Shenzheng","Support@Huawei.com"),
(204,"Amazon AppStore" ,"Seattle","Support@amazon.com");

select * from Publishers;

create table categeories(
CategoryID int primary key ,
CategoryName varchar(40) ,
MinimumAge int
);
select * from categeories;
insert into categeories(CategoryID,CategoryName,MinimumAge)
values
(301,"Education",3),
(302,"Productivity",3),
(303,"Music",12),
(304,"Social",13),
(305,"Gaming",16);
select * from categeories;

create table App(
AppID int  primary key,
AppName varchar(60) ,
DeveloperID int,
PublisherID int ,
categoryID int ,
Rating Decimal(2,1),
Downloads int ,
Price Decimal (6,2)
);

select * from App;
insert into App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values
(1001,"Google Classroom",101,201,301,4.6,500000000,0),
(1002,"Google kepp",101,201,302,4.5,1000000000,0),
(1003,"Instagram",102,201,304,4.4,500000000,0),
(1004,"Spotify",103,201,303,4.5,1000000000,0),
(1005,"Canva", 104,201,302,4.7,500000000,0),
(1006,"BYJU'S",105,201,301,4.3,1000000000,299),
(1007,"CandyCrush",102,204,305,4.6,1000000000,0),
(1008,"Templerun",104,203,305,4.2,500000000,0);

select * from App;

DESC App
insert into  DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear)
values(106,"OpenAI","USA",2015);
select * from DEVELOPERS;

insert into categeories(CategoryID,CategoryName,MinimumAge)
values(306,"Artificial Intelligence",12);
Select * from categeories;

insert into App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(1009,"ChatGPT",204,208,459,4.9,700000000,0);
select * from App;

update App
set Rating=4.5
where AppID=1008
select * from App;

delete from DEVELOPERS
where DeveloperID=105
select * from DEVELOPERS;

update Publishers
set SupportEmail="Support@Galaxy_store.com"
where PublisherID=202
select * from Publishers;


insert into App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values
(1034,"Pintrest",106,601,308,9.3,900000000,0),
(1030,"GITHUB",464,678,902,9.4,900000000,0);
select * from App;

update App
set Price=199
where APPID=1006
select * from App;

delete from categeories
where CategoryID=303
select * from categeories;

