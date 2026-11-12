# DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear
# App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
#categeories(CategoryID,CategoryName,MinimumAge
#Publishers(PublisherID,PublisherName,HeadOffice,SupportEmail

USE playstoredb;

#1.create a view displaying all application records from the apps table 
CREATE VIEW All_Apps AS
SELECT * FROM App;
select * from ALL_Apps;

#2.create a view displayimng appid ,appname, rating and price 
CREATE VIEW App_Basic_Details  AS 
SELECT AppID,AppName,Rating,Price from App;
select * from App_Basic_Details;

#3.create a view displaying applications having rating greatern than or equal to 4.5
CREATE VIEW HIGH_RATING AS
SELECT * FROM App where Rating>4.5;
select * from HIGH_RATING;

#4.create a view to display only fee applications
CREATE VIEW Free_Apps AS 
select * from APP where price=0 ;
select * from Free_Apps;

#5.
select * from HIGH_RATING;

#6.display all views availbale in the datbase 
SHOW FULL TABLES 
WHERE 	Table_type='VIEW';

#LEVEL -2
#1.CREATE A VIEW DISPLAYNG aplication  NAMES  and developer names using join 
CREATE VIEW APP_Developers  AS
select A.AppName ,D.DeveloperName from 
APP A join Developers D on A.DeveloperID=D.DeveloperID;
select * from APP_Developers;

#2.create a view disaplying application names and publishera names using join 
CREATE VIEW App_Publishers AS 
Select  A.AppName, P.PublisherName from 
APP A join Publishers P on A.PublisherID=P.PublisherID;
select * from App_Publishers;

#4.create a view displaying applications details along with developer names and countries 
CREATE VIEW App_developer_details AS
select A.AppID,A.AppName,D.DeveloperName,D.Country from App A join
 Developers D on A.DeveloperID=D.developerID;
select * from App_developer_details;

#5.create a view displaying total no of applications for each category 
CREATE VIEW Category_app_Count AS
SELECT CategoryID, count(*) AS TOTAl_Applications from App GROUP BY CategoryID;
select * from  Category_app_Count;

#6.create a view displaying total no of applications for each developer 
CREATE VIEW Developer_app_Count AS
SELECT DeveloperID, count(*) AS TOTAl_Applications from App GROUP BY DeveloperID;
select * from  Developer_app_Count;

#7.create a view displaying the average rating for each category 
CREATE VIEW category_AVERAGE_RATING AS
SELECT CategoryID,AVG(Rating) as Average_Rating from App 
GROUP BY CategoryID;
select * from category_AVERAGE_RATING;

#8.create a view displaying only appliacations with rating geater than 4.3 along with developer names 
CREATE VIEW App_Rating AS 
select A.AppName ,A.Rating, D.DeveloperName from App A 
join Developers D on A.DeveloperID=D.DeveloperID
where A.Rating>4.3;

#9.retrive selected coloumns from an existing view using where 
select AppName,DeveloperName from App_Rating 
where Rating>4.5;

#l0.display the definition of  a created view using show create view
show create view APP_Rating;

#level -3
#error
#1.create a view displaying category names and their total counts using join and group by 
CREATE  VIEW  Category_count_view AS
Select C.CategoryName,count(A.AppID) AS Total_Applications from categeories C
left join App A on C.CategoryID=A.CategoryID
GROUP BY C.CategoryID,C.CategoryName;
select * from Category_count_view;

#2.create  a view displaying developers  having more than one application
CREATE VIEW Developers_App_view AS
SELECT D.DeveloperID ,COUNT(A.AppID) AS Total_Applications
FROM  Developers D JOIN App A ON  D.DeveloperID=A.DeveloperID 
GROUP BY D.DeveloperID,D.DeveloperName
having count(A.AppID)>1;
SELECT  * from Developers_App_view;

#create a view displaying each category with its highest and lowest applicationn rating 
CREATE VIEW Category_high_low_Rating AS
SELECT C.CategoryName,MAX(A.Rating) AS highest_Rating ,
					MIN(A.Rating) AS lowest_Rating
from categeories C join App A on C.CategoryID=A.CategoryID 
GROUP BY C.CategoryID,C.CategoryName;
SELECT * from Category_high_low_Rating;

#4.create a view displaying developer names and total number of application developedd by each developer 
CREATE VIEW Developer_Statistics AS 
SELECT D.DeveloperID , COUNT(A.AppID) AS Total_Applications 
from Developers D  left join App A on D.DeveloperID=A.DeveloperID 
GROUP BY D.DeveloperID,D.DeveloperName;
select * from Developer_Statistics;

#create a view combining applications ,developers ,publishers and category information 
create VIEW PlayStore_Complete_view AS
select A.AppID,A.AppName,D.DeveloperName ,P.PublisherName,C.CategoryName , A.Rating,A.Downloads , A.Price
from App A join Developers D on A.DeveloperID=D.DeveloperID join Publishers P on A.PublisherID=P.PublisherID join categeories C on A.CategoryID=C.CategoryID;
select * from PlayStore_Complete_view;

#6.create a view displaying highly rated application along with developer names and categpory names 
CREATE VIEW Highly_Rated_App_details AS
select A.AppName,A.Rating,D.DeveloperName,C.CategoryName
from App A join Developers D on A.developerID=D.developerID 
join categeories C on A.CategoryID=C.CategoryID
where A.Rating>4.5;
select * from Highly_Rated_App_details;

#display a  view dispalying the most downloaded in each category 
CREATE VIEW  most_Downloaded_Category_app AS
select A.AppId,A.AppName,C.CategoryName,A.Downloads
from App A  join Categeories C on A.CategoryID=C.CategoryID
where A.Downloads=(
select MAX(A2.Downloads) 
from App A2
where A2.CategoryID=A.CategoryID
);


#8.create a simple google playstore application dashboard 
create VIEW playstore_dashbaord_view AS
select  A.AppName ,D.DeveloperName,C.CategoryName,A.Rating,A.Downloads,A.price
from App A join Developers D on A.DeveloperID=D.DeveloperID
join Publishers P on A.PublisherID=P.PublisherID
join categeories C on  A.CategoryID=C.CategoryID;
select * from playstore_dashbaord_view;

#Dropping a view --deleting a view 
DROP VIEW APP_Developers;
#verifying 
SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';

#retrive details from a view using filtering and sorting 
#Select * from all_apps where Rating >4.3 
#order by Downloads DECS;

# CREATE A SIMPLE UPDATABLE VIEW AND UPDATE AN APPLICATION RATING THROUGH THAT VIEW .VERIFY CAHNGES IN THE APP TABLE
CREATE VIEW App_rating_view AS
select AppId,AppName,Rating from App;
select * from App_rating_view;
update App_rating_view 
SET Rating =4.8 
where AppId=1004;
#verification 
select * from App_rating_view;
#verifying cahnges in the original table 
select * from App where AppID=1004;



