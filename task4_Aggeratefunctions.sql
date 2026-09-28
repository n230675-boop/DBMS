use Playstoredb;

#App(AppID,AppName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)

SELECT COUNT(*)  as Total_Applications from App;
SELECT AVG(Rating) as Average_Rating from App;
SELECT MAX(Rating)   as Maximum_rating FROM App;
SELECT MIN(Rating) as Minimumm_rating FROM App;
SELECT COUNT(Downloads) FROM App;
SELECT AppName from App
ORDER BY Rating DESC;

SELECT categoryID ,COUNT(*) AS Application_count from App GROUP BY categoryID;
#error 
SELECT categeoryID,AVG(Rating) AS Average_Rating from App GROUP BY categoryID;
SELECT MAX(Price) AS MAXIMUM_PRICE , MIN(Price) AS MININMUM_PRICE FROM App;
SELECT Downloads from App ORDER BY Downloads DESC;
SELECT * FROM App ORDER BY  Downloads DESC;
SELECT count(APPName) AS NUMber_APPLIcations from APP  GROUP BY DeveloperID;
SELECT categoryID,COUNT(*) AS Application_count from APP GROUP BY categoryID Having COUNT(*) >1;
SELECT DeveloperID, SUM(Downloads) as total_downloads from App GROUP BY DeveloperID;
SELECT PublisherID, AVG(Rating) as AVerage_Rating from App GROUP BY PublisherID;
SELECT DeveloperID ,COUNT(*) as dEVELOPERS_COUNT FROM App GROUP BY DeveloperID Having count(*) >1;
SELECT categoryID ,AVG(Rating) AS Average_Rating from App group by categoryID Having AVG(Rating)>4.3;
SELECT categoryID,COUNT(*) AS APPLICATION_COUNT FROM App group by categoryID order by APPLICATION_COUNT DESC;
SELECT * from App where Rating=(
				SELECT MAX(Rating) from App);
SELECT   DeveloperID, SUM(Price) as TOtal_price_of_app from App group by DeveloperID;

