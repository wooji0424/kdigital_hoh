use w3schools;

-- Q. 도쿄에 위치한 공급자(Supplier)가 생산한 상품 목록 조회 : 
-- 도시명(City), 공급자명(SupplierName), 상품명(ProductName), 상품가격(Price)

-- Table - Suppliers, Products

select Suppliers.City, Suppliers.SupplierName, Products.ProductName, Products.Price 
from Products
INNER JOIN Suppliers
on Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.City = 'Tokyo';

select s.City, s.SupplierName, p.ProductName, p.Price
from Products as p
INNER JOIN Suppliers as s
on p.SupplierID = s.SupplierID
WHERE s.City = 'Tokyo';

select s.City, s.SupplierName, p.ProductName, p.Price 
from Products p
INNER JOIN Suppliers s
on p.SupplierID = s.SupplierID
WHERE s.City = 'Tokyo';

select s.City, s.SupplierName, p.ProductName, p.Price 
from Products p, Suppliers s
where p.SupplierID = s.SupplierID AND s.City = 'Tokyo';

-- Q. 분류(Categories)가 Seafood 인 상품명(ProductName) : 
-- 분류명(CategoryName), 상품명(ProductName)

-- Table - Categories, Products

select c.CategoryName, p.ProductName 
from Products p
inner join Categories c
on p.CategoryID = c.CategoryID
where c.CategoryName = 'Seafood';

select c.CategoryName, p.ProductName 
from Products p, Categories c
where p.CategoryID = c.CategoryID AND c.CategoryName = 'Seafood';


-- Q. 공급자(Supplier) 가 공급한 상품의 공급자 국가(Country) 별로 상품 카테고리(CategoryName) 의 상품건수와 평균가격 :
-- 국가명(Country), 카테고리명(CategoryName), 상품건수, 평균가격 (3개 테이블 조인)

-- Table - Suppliers, Products, Categories
select s.Country, c.CategoryName, count(*) as cnt, AVG(p.Price) as avg
from Products p
inner join Suppliers s
on p.SupplierID = s.SupplierID
inner join Categories c
on p.CategoryID = c.CategoryID
group by s.Country, c.CategoryName
order by cnt desc;

select s.Country, c.CategoryName, count(*) as cnt, AVG(p.Price) as avg
from Products p, Suppliers s, Categories c
where p.SupplierID = s.SupplierID AND p.CategoryID = c.CategoryID 
AND p.CategoryID = c.CategoryID
group by s.Country, c.CategoryName
order by cnt desc;


-- Q. 주문별 주문자명(CustomerName), 직원명(LastName), 배송자명(ShipperName), 주문상세갯수 :
-- 주문아이디(OrderID), 주문자명(CustomerName), 직원명(LastName), 배송자명(ShipperName), 주문상세갯수

-- Table - Orders, Order_Details, Customers(고객,주문자), Employees(직원), Shippers(배송자)

select od.OrderID, c.CustomerName, e.LastName, s.ShipperName, count(*) as o_cnt
from Order_Details od
inner join Orders o
on od.OrderID = o.OrderID
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Employees e
on o.EmployeeID = e.EmployeeID
inner join Shippers s
on o.ShipperID = s.ShipperID
group by od.OrderID;

select od.OrderID, c.CustomerName, e.LastName, s.ShipperName, count(*) as o_cnt
from Order_Details od, Orders o, Customers c, Employees e, Shippers s
where od.OrderID = o.OrderID AND o.CustomerID = c.CustomerID AND o.EmployeeID = e.EmployeeID
AND o.ShipperID = s.ShipperID
group by od.OrderID;

-- Q. 판매량(Quantity) 상위 TOP3 공급자(supplier) 목록 :
-- 공급자명(SupplierName), 판매량(Quantity)

-- Table - Suppliers, Products, Order_Details

select s.SupplierName, sum(od.Quantity) as qsum 
from Order_Details od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID
group by s.SupplierName
order by qsum desc
limit 3;

select s.SupplierName, sum(od.Quantity) as qsum 
from Order_Details od, Products p, Suppliers s
where  od.ProductID = p.ProductID AND p.SupplierID = s.SupplierID
group by s.SupplierName
order by qsum desc
limit 3;

-- Q. 상품분류(Category)별, 고객지역별(City) 판매량(Quantity) 많은순으로 정렬 :
-- 카테고리명(CategoryName), 고객지역명(City), 판매량(Quantity)

-- Table - Order, Order_Details, Customers, Categories, Products

select c.CategoryName, cm.City, sum(od.Quantity) as qsum 
from Order_Details od
inner join Products p
on od.ProductID = p.ProductID
inner join Categories c
on c.CategoryID = p.CategoryID
inner join Orders o
on od.OrderID = o.OrderID
inner join Customers cm
on o.CustomerID = cm.CustomerID
GROUP BY c.CategoryName, cm.City
order by qsum desc;

-- Q. 고객국가(Country) 가 USA이고, 상품별 판매량(Quantity)의 합이 많은순으로 정렬 :
-- 국가명(Country), 상품명(ProductName), 판매량합(Quantity), 판매금액합(Price)

-- Table - Customers, Products, Orders, Order_Details
select c.Country, p.ProductName, sum(od.Quantity) as qsum, sum(od.Quantity * p.Price) as psum
from Order_Details od
inner join Orders o
on od.OrderID = o.OrderID
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Products p
on od.ProductID = p.ProductID
where c.Country='USA'
group by p.ProductName
order by qsum desc







