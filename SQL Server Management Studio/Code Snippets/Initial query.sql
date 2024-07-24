create database mydb;

use mydb;

select @@SERVERNAME;

CREATE TABLE Emp(
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);


insert into Emp(ID,FirstName,LastName,Age) values (101,'Sanjana','Agrawal',23),(102,'Kajal','Singh',19),(103,'Ankita','Jaiswal',25);
select * from [dbo].[Emp];