use playstoredb;

#Update the rating of google kepp and permamnently save using commit
UPDATE App SET Rating=4.8 WHERE AppID=1002;
commit;

SET AUTOCOMMIT=0;
#2.update the price of BYJUS learning and cancle the changes using Roll backu
UPDATE App SET Price =999 WHERE AppID=1006;
ROLLBACK;
select * from App where AppID=1006;

#3.iNSERT A NEW QPPLICATION and use commit to save the record 
INSERT INTO App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
VALUES(109,'Chatgpt',304,782,98,4.7,20000000,90);
commit;
#select * from App;

#Insert a new developer and cancle usin rollback
insert into DEVELOPERS(DeveloperID,DeveloperName,Country,Foundedyear)
VALUES(108,'pintrest','sweden',1989);
ROLLBACK;
#select * from DEVELOPERS;

#5.CREATE A savepoint after updating an appilications rating 
UPDATE App SET Rating=4.9 WHERE AppID=1002;
SAVEPOINT Rating_Update;

#1.update two applications and creat ea savepoint between them 
update App SET Rating=7.9 WHERE AppId=1002;
SAVEPOINT First_update;
UPDATE App SET Rating=6.4 WHERE AppID=1008;

#2.UNDO THE CHANGES ONLY AFTER THE SAVEPOINT
ROLLBACK TO First_update;
#SELECT * FROM App;

#3.insert an application ,create savepoint,update its price then rollback
INSERT INTO App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(2002,'sugercrush',303,404,505,3.3,60000000,222);
SAVEPOINT App_insert;
UPDATE App SET price=200 where AppID=1002;
ROLLBACK TO App_insert;
#SELECT * FROM App;

#4Select grant privilage on the apps table to a database user
GRANT SELECT ON App TO student1;


select User,Host from mysql.user where User='student1';
create user 'student1'@'localhost'IDENTIFIED BY 'student123';
grant select on playstoreDB.App TO 'student1'@'localhost';
show grants for 'student1'@'localhost';

#5.grant select and update privilage 

GRANT SELECT ,INSERT ON playstoredb.App TO 'student1'@'localhost';
select * from App;
insert into App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(10001,'playstore',2002,323,323,5.9,70000000,990)
select * from App;

#6.revoke insert privilage
REVOKE INSERT ON App from 'student1'@'localhost';
#insert into App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
#values(10000,'playstore',2002,323,323,5.9,70000000,990);
#select * from App;

#1.multiple updates using savpoint and rollback to 
update app set Rating=5.5 where AppID=1002;
savepoint sp1;
update App set Rating=7.8 where AppID=1006;
savepoint sp2;
update App set Rating=5.7 where AppID=1008;
savepoint sp3;
rollback to sp2;

#2.insert two categories creATE  savepoint and rolllback 
insert into categeories(CategoryID,CategoryName,MinimumAge)
values(101,'Education',23);
insert into categeories(CategoryID,CategoryName,MinimumAge)
values(202,'Entertainment',17);
savepoint category_save;
rollback to category_save;
#select * from categeories;

select user();
#3.grant insert update and select privilages on app
GRANT SELECT ,INSERT,UPDATE ON App TO root@localhost;
select * from App;
INSERT INTO App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(2009,'chess',303,404,505,4.3,70000000,272);
update App SEt Rating=4.9 where AppID=105;

#4.revoke update privilage 
revoke update on App from root@localhost;
update App SEt Rating=7.9 where AppID=105;

#5.grant select on developers and then revoke 
grant select on Developers to root@localhost;
select * from Developers;
revoke select on Developers from root@localhost;


#6.transaction with multiple operations and commit
update App set Rating=5.6 where AppID=1008;
INSERT INTO App(AppID,APPName,DeveloperID,PublisherID,categoryID,Rating,Downloads,Price)
values(20011,'chess',303,404,805,4.3,90000000,272);
update App set price=290 where AppID=1004;
commit;

#7.verify the effects of commit and rollback
update App set Rating =5.8 where AppID=1009;
select * from App;
#Test ROllback 
update App set Rating=3.0 where AppID=1009;
ROLLBACK;
