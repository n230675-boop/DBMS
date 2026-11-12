USE playstoredb;

# DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear
# App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
#categeories(CategoryID,CategoryName,MinimumAge
#Publishers(PublisherID,PublisherName,HeadOffice,SupportEmail

#1.display application name and corresponding developer name using inner join 
SELECT A.AppName, D.DeveloperName FROM App A INNER JOIN DEVELOPERS D on A.DeveloperID=D.DeveloperID;

#2.Display applocation and and corresponding publishern name using innerjoin 
SELECT A.APPName,P.PublisherName from App A INNER JOIN Publishers P on A.PublisherID =P.PublisherID;

#3.App name and corresponding category name using innerjoin 
select A.AppName,C.CategoryName from App A INNER JOIN categeories C on A.CategoryID =C.CategoryID;

#4.display application name ,publihsername and devellopername usin multi table innerjoin 
select A.AppName,P.PublisherName,D.DeveloperName from App A inner join Developers D on A.DeveloperID=D.DeveloperID INNER JOIN Publishers p on A.PublisherID= P.publisherID;
#6.Display all publishers along with their appliactions using left join 
SELECT P.PublisherName ,A.AppName FROM Publishers p LEFT JOIN App A ON P.PublisherID=A.PublisherID;

#7.categories along with their appliaction names usimng left join 
SELECT C.CategoryName,A.AppName FROM categeories C LEFT JOIN App A ON C.CategoryID=A.CategoryID;

#LEVEL-1
#1.DISPLAY ALL PuBLISHERS AND THEIR APPLIACATIONS INCLUDING PUBLISHERS WITHOUT APPLICATIONS 
SELECT P.PublisherID ,P.PublisherName,A.AppName FROM Publishers P LEFT JOIN App A ON P.PublisherID=A.PublisherID;

#2.Display apps along with their publisher name s using right join 
SELECT  A.AppName ,P.PublisherName from App A right join Publishers P on A.PublisherID=P.PublisherID;

#3.display all categories and appliacations including categories without applications 
SELECT  C.CategoryName ,A.AppName from categeories C left join App A on C.CategoryID=A.CategoryID;

#4.Display app name ,developername and country using hree table join 
select A.AppName ,D.DeveloperName,D.Country from App A inner join Developers D on A.DeveloperID=D.DeveloperID;

#5.APpname ,developername ,publishername ,and category name using fourtable join 
SELECT A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName from App A inner join 
DEVELOPERS D on A.DeveloperID=D.DeveloperID inner join Publishers P on A.PublisherID=P.PublisherID inner join
categeories C on A.CategoryID=C.CategoryID;

#6.display applaiacatios developed by developers from usa showing appname ,developers name and country 
select A.AppName,D.DeveloperName ,D.Country from App A inner join Developers D 
on A.DeveloperID=D.DeveloperID where Country="USA";

#7.display applications belonging to the gamung categories along with their publisher names 
SELECT A.AppName ,C.CategoryName,P.PublisherName from A.App inner join 
categeories C on A.CategoryID=C.CategoryID inner join
 Publishers P on A.PublisherID=P.PublisherID where C.CategoryName='Gaming';
 
 #8.display application with rating greater than 4.5 with their developer names 
 select A.AppName,A.Rating,D.DeveloperName from App A 
 inner join DEVELOPERS D 
 on A.DeveloperID=D.DeveloperID 
 where A.Rating>4.5;
 
 #level 2 
 #1.display every publishers alomng with its applications including publishers without applications 
 select P.PublisherName ,A.AppName from Publishers P left join App A on P.PublisherID=A.PublisherID;
 
 #2,.find publishers that currently have no applications associated wuth them using left join 
 select P.PublisherName from Publishers P left join App A on P.PublisherID=A.PublisherID where A.AppID is NULL;
 
 #3.display all applications and their category names ordered by cateory name 
 select A.AppName ,C.CategoryName from App A inner join categeories C on A.CategoryID=C.CategoryID ORDER BY CategoryName ASC;
 
 #4.display appname ,developername,publishername ,category name ,and rtaing i=usimng appropriate join operation
select A.AppName ,D.DeveloperName,P.PublisherName, C.CategoryName, A.Rating
from App A inner join Developers D on A.DeveloperID=D.DeveloperID inner join Publishers P on 
A.PublisherID=P.PublisherID inner join categeories C on 
A.CategoryID=C.CategoryID;

 
 #5. display appliactions developed by the usa and published through the google play 
 select A.AppName ,D.DeveloperName, D.Country ,P.PublisherName from App A inner join 
Developers D on A.DeveloperID=D.DeveloperID inner join Publishers P on A.PublisherID=P.PublisherID 
where D.Country='USA' and P.PublisherName='GooglePlay';

#6.use a self join on h edevelopers table to display pairs of the developers having same country
select D1.DeveloperName AS Developer1,
       D2.DeveloperName AS Developer2,
       D1.Country
from Developers D1 inner join Developers D2 on D1.Country=D2.Country AND D1.DeveloperID<D2.DeveloperID;

#7.use cross join to display every possible combination of the publisher name and category name
select P.PublisherName ,C.CategoryName 
from Publishers P cross join categeories C;

#8.implement full outer join equivalent between publishers and Apps using left outer join and right outer join and union 
select P.PublisherID,P.PublisherName ,A.AppName from Publishers P
 left join App A
 on P.PublisherID=A.PublisherID 
 UNION 
select P.PublisherID,P.PublisherName ,A.AppName from Publishers P
right join App A 
on P.PublisherID=A.PublisherID ;

#10.display applications whose category is gaming or socuial alomng  with their developer and publisher name using multiple joins 
select A.AppName ,P.PublisherName,D.DeveloperName ,C.CategoryName from App A inner join
categeories C on  A.CategoryID=C.CategoryID
inner join DEVELOPERS D on A.DeveloperID=D.DeveloperID 
inner join Publishers P on A.PublisherID=P.PublisherID
where C.CategoryName in ('Social','Gaming');

#11.display application name ,developername ,category name having rating between 4.3 and 4.7
select A.AppName ,D.DeveloperName ,C.CategoryName,A.Rating from App A inner join
categeories C on  A.CategoryID=C.CategoryID
inner join DEVELOPERS D on A.DeveloperID=D.DeveloperID 
where A.Rating between 4.3 and 4.7;

#12.display developers and their appliactions where he developers country is not india 
select D.DeveloperName ,A.AppName , D.Country from DEvelopers D left join App A on D.DeveloperID= A.DeveloperID where D.Country not in ('INDIA ');
