use test;

CREATE TABLE Persons (
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);

desc Persons;

insert Into Persons 
values (1, 'Kyungsoo', 'Hong', 'Kyunggido', 'Goyang');

select * from Persons;

truncate table Persons;
select * from Persons;

drop table Persons;

CREATE table Persons (
PersonID int NOT NULL auto_increment, 
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255),
primary key(PersonID)
);

insert Into Persons 
values (1, 'Kyungsoo', 'Hong', 'Kyunggido', 'Goyang');

insert Into Persons (LastName, FirstName)
values ('Teik', 'Kim');

insert Into Persons 
values (10, 'Eunyi', 'Song', 'Dongtan', 'Hwasung');

insert Into Persons (LastName, FirstName)
values ('Sujin', 'Park');

ALTER table Persons ADD Email varchar(255);

insert Into Persons (LastName, FirstName, Email)
values ('Dayoung', 'Kang', 'dayoung@google.com');

alter table Persons Drop Email;
ALTER table Persons modify Email int;

ALTER table Persons ADD Email int;
ALTER table Persons modify Email varchar(255);


select * from Persons;

DELETE FROM Persons where LastName="Sujin" AND FirstName="Park";

UPDATE Persons SET Address = 'Mapo', City='Seoul' where PersonID=12;
UPDATE Persons SET Address = 'Kangnam', City='Seoul' where PersonID=1;



use w3schools;

create table customers2 AS
select CustomerID, CustomerName, Address FROM Customers;


select * from customers2;

ALTER table customers2 modify CustomerID varchar(255);

update Customers2 set CustomerID = concat("customer", CustomerID);

select * from Suppliers;





