USE playstoredb;

select UPPER(DeveloperName) FROM DEVELOPERS;
SELECT LOWER(DeveloperName) FROM DEVELOPERS;
SELECT LENGTH(AppName)FROM APP;
SELECT CategoryName , LENGTH(CategoryName) AS NAME_LENGTH FROM CATEGEORIES;
#dISPLAYING CURRENT DATE AND TIME
SELECT CURRENT_DATE()
SELECT CURRENT_TIME()
#rounding e decimals to zero
SELECT ROUND(Rating ,0) from App;
SELECT AppName ,SUBSTRING(AppName,1,5) AS FIRST_5_CHARACTERS from App;
#aNOTHER WAY USING left
SELECT AppName,LEFT(AppName,5) AS FIRST_5_CHARACTERS FROM  App;
SELECT  CONCAT(DeveloperName,' ' ,COUNTRY) FROM DEVELOPERS;
SELECT ROUND(Rating ) FROM App;
SELECT CEIL(Price) FROM App;
select FoundedYear from DEVELOPERS;
SELECT Downloads , CAST(Downloads AS CHAR) AS Downloads from App;
select UPPER(AppName),Rating from App;
select  CategoryName,SUBSTRING(CategoryName, 1,3) as 3_characters from categeories;
select DeveloperName,LENGTH(DeveloperName) AS NAME_LENGHT FROM DEVELOPERS;
#abs()--FRO THE COMNVERTING THE NEGATIVE DIFFERENECE INTO POSITVE 
SELECT AppName,ABS(Price - 200) AS Absolute_differnce from App;
SELECT CURRENT_DATE(),CURRENT_TIMESTAMP()
SELECT Downloads, CONVERT(Downloads, CHAR) AS downloads_characters FROM App;


