USE playstoredb;
#DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear)
ALTER TABLE APP
ADD CONSTRAINT FK_developer
FOREIGN KEY (DeveloperID)
REFERENCES DEVELOPERS(DeveloperID);

ALTER TABLE APP
ADD CONSTRAINT fk_publisher
FOREIGN KEY (PublisherID)
REFERENCES Publishers(PublisherID);

ALTER TABLE App
ADD CONSTRAINT fk_category
FOREIGN KEY (CategoryID)
REFERENCES categeories(CategoryID);

SELECT *
FROM App WHERE Rating>4.5;
select * from App where price=0;
select * from App where categoryID=305;
SELECT  AppName from App where Downloads>500000000 ;
SELECT AppName ,Rating from App where Rating between 4.3 and 4.7;
select * from App where price IN(0,299);
select * from App where AppName like("G%");
select *from App where AppName like("%Google%");
select *from App where Rating>4.0 and Downloads >500000000;
select * from App where categoryID=301 or categoryID=305;
select * from App where AppName NOT LIKE("G%");
select *from App where Rating <4.5 or Downloads >1000000000;
select * from App where AppName like("%a%");
select * from App where price between 0 and 300;
select * from App where PublisherID=201 or PublisherID=204;
insert into App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(999,"freefire",9090,220,330,232,9.0,900000000,0);
select * from App where CategoryID NOT IN(305);


