CREATE TABLE order_summary(orderid integer,amount integer,quantity integer); 
INSERT INTO order_summary(orderid,amount,quantity) 
 VALUES (1,4922,8),
(2,7116,8),(3,1206,4),(4,2841,7),(5,2522,2),(6,5084,3),
(7,6680,4),(8,8123,7),(9,6015,2),(10,4092,3),(11,7224,2),
(12,7679,8),(13,1303,2),(14,5185,7),(15,2139,8);

CREATE TABLE customer(cust_id integer,cust_first_name text,cust_last_name text); 
INSERT INTO customer(cust_id,cust_first_name,cust_last_name) 
VALUES (1,'Henry','Brown'),(2,'James','Williams'),(3,'Jack','Taylor');

CREATE TABLE orders(order_id integer,date date,cust_id integer); 
INSERT INTO orders(order_id,date,cust_id) 
 VALUES 
(1,'05-08-2020',1),(2,'04-08-2020',2),(3,'03-08-2020',3),(4,'04-08-2020',1),
(5,'05-08-2020',2),(6,'05-08-2021',3),(7,'04-08-2021',1),(8,'03-08-2021',2),
(9,'04-08-2021',3),(10,'05-08-2021',2),(11,'05-08-2022',1),(12,'04-08-2022',2),
(13,'03-08-2022',3),(14,'04-08-2022',1),(15,'05-08-2022',2);

select * from orders;
select * from order_summary;
select * from customer;

with cte_2021_sales(cust_id,yr,full_name,total_sales_2021) AS
(
SELECT c.cust_id,c.yr,c.full_name,SUM(d.amount*d.quantity) total_sales FROM
(SELECT a.order_id,year(a.date)yr,a.cust_id,CONCAT(b.cust_first_name,' ',b.cust_last_name)
full_name FROM orders a inner join customer b ON
a.cust_id=b.cust_id)c inner join order_summary d ON c.order_id=d.orderid WHERE c.yr=2021
GROUP BY cust_id,yr,full_name),
cte_2020_sales(cust_id,yr,full_name,total_sales_2020) AS
(
SELECT c.cust_id,c.yr,c.full_name,SUM(d.amount*d.quantity) total_sales FROM
(SELECT a.order_id,year(a.date)yr,a.cust_id,CONCAT(b.cust_first_name,' ',b.cust_last_name)
full_name FROM orders a inner join customer b ON
a.cust_id=b.cust_id)c inner join order_summary d ON c.order_id=d.orderid WHERE c.yr=2020
GROUP BY cust_id,yr,full_name),
cte_2022_sales(cust_id,yr,full_name,total_sales_2022) AS
(
SELECT c.cust_id,c.yr,c.full_name,SUM(d.amount*d.quantity) total_sales FROM
(SELECT a.order_id,year(a.date)yr,a.cust_id,CONCAT(b.cust_first_name,' ',b.cust_last_name)
full_name FROM orders a inner join customer b ON
a.cust_id=b.cust_id)c inner join order_summary d ON c.order_id=d.orderid WHERE c.yr=2022
GROUP BY cust_id,yr,full_name)

SELECT a.cust_id,a.full_name,b.total_sales_2020,a.total_sales_2021,c.total_sales_2022
FROM cte_2021_sales a inner join cte_2020_sales b 
ON a.cust_id=b.cust_id
inner join cte_2022_sales c ON c.cust_id = a.cust_id 
ORDER BY cust_id;