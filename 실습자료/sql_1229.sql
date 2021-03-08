SELECT CustomerName, Country FROM Customers;
SELECT * FROM Customers;
SELECT DISTINCT Country FROM Customers;
SELECT * FROM Customers where Country='France';
SELECT * FROM Customers where ContactName LIKE 'Mar%';
SELECT * FROM Customers where ContactName LIKE '%et';
SELECT * FROM Customers where Country='France' and ContactName LIKE 'La%';
SELECT * FROM Customers where Country='Germany' OR ContactName LIKE 'Ma%';
SELECT * FROM Customers where NOT Country='France';
SELECT * FROM Customers where Country<>'France';
SELECT * FROM Customers where Country in ('France', 'Spain');


SELECT * FROM Products where Price BETWEEN 15 and 20 ;
SELECT * FROM Products where productid in (select productid from Products where Price >= 15 and Price <= 20 );
SELECT * FROM Products where Price >= 15 and Price <= 20 ;

SELECT * FROM Customers where PostalCode IS NULL;

SELECT * FROM Customers ORDER BY CustomerName ASC;
SELECT * FROM Products ORDER BY PRICE DESC;

SELECT * from customers where country='UK' LIMIT 3;

SELECT 
*, 
CASE 
	WHEN Price < 30 THEN '저'
    WHEN Price < 50 THEN '중'			
    ELSE '고'
END
FROM Products;

SELECT 
*, 
CASE 
	WHEN Price < 30 THEN '저'
    WHEN Price < 50 THEN '중'			
    ELSE '고'
END AS Category
FROM Products;

select count(country) from customers where country='France';

select AVG(Price) from Products;

select Sum(Quantity) from OrderDetails;

select Min(Price) from Products;

select Max(Price) from Products;

select country, count(country) as country_count from Customers group by country order by country_count asc;
select country, city, count(city) as count_city from customers group by country, city order by count_city DESC
-- having
select country, count(country) as cc from Customers group by country having cc > 5 order by cc desc;

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

select ProductName, Price from Products where ProductName like 'C%' and Price > 20 order by Price desc;

select CategoryId, Sum(Price), max(Price), Min(Price) from Products group by CategoryID;
