/*
List of Queries for Whole_Foods_Market Analysis.
*/

-- 1) Describe the orders table.
DESC orders;

-- 2) Find out which category is performing better in terms of profit than the others
select Category, sum(Profit) from orders group by Category order by sum(Profit) desc;


-- 3) Write the query to update the city as Chandigarh where the State is Chandigarh.
update orders set City = 'Chandigarh' where State='Chandigarh'; select * from orders;

-- 4) Write a query to find the total profit sum from orders table.
select sum(Profit) from orders;

-- 5) Write a query to get the OrderID, ProductName and Profit. Result should be with respect to profit(In increasing order).
select Order_ID, Product_Name, Profit from orders where order by Profit;

-- 6) Write a query to get all the orders where there was a loss and report the order ID, product name and loss. Sort the result in a format that the highest loss is on the top.
select Order_ID, Product_Name, Profit from orders where Profit<0 order by profit;


-- 7) Write a query to get the list of all orders which have loss and sort them in descending order of discount given.
select Order_ID, Product_Name, Profit, Discount from orders where Profit<0 order by Discount desc;

-- 8) Write a query to get the State and sum of profit for each state. The result should be in increasing order of profit.
select State, sum(Profit) from orders group by State order by sum(Profit);

-- 9) Write a query to get state, category and sum of profits.
select State, Category, sum(Profit) from orders group by State, Category;

-- 11) Write a query to create a table in the database with Name as Manager and with values provided. Do assign proper Primary key.
create table Manager (Segment Varchar(100) Primary Key, Segment_Manager Varchar(100));
insert into Manager values('Consumer','Gaganjit Singh'), ('Corporate','Aman Jain'), ('Home Office','Kush Arora');
select * from Manager;

-- 12) Write a query to get Segment, count of order, sum of profit.
select Segment, count(Order_ID), sum(Profit) from orders group by Segment;

-- 13) Write the query to get sum of sales, sum of profit for the year 2020.
select sum(Sales), sum(Profit) from orders where Order_Date like '%20';

-- 14) Write a query to get the sum of sales of each segment and their respective segment manager for all years except 2020.
select sum(orders.Sales), manager.Segment_Manager from orders inner join manager on orders.Segment=manager.Segment where Order_Date not like '%20' group by manager.Segment_Manager;

-- 15) Write a query to get Customer ID and sum of profit for each. The result should be such that you are easily able to find the highest profit customer.
select Customer_ID, sum(Profit) from orders group by Customer_ID order by sum(Profit) desc;

-- 16) Write a query to find the customer details having the highest Profit. The result should be such that you are easily able to find the highest profitable customer.
select customers.Customer_ID, customers.Customer_Name_, sum(orders.Sales), sum(orders.Profit), count(orders.Order_ID) from orders
inner join customers on orders.Customer_ID=customers.Customer_ID group by customers.Customer_ID, customers.Customer_Name_ order by sum(orders.Profit) desc;
