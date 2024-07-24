CREATE TABLE customer_123(cust_id integer,cust_first_name text,cust_last_name text); 
INSERT INTO customer_123(cust_id,cust_first_name,cust_last_name) 
VALUES (1,'Henry','Brown'),(2,'James','Williams'),(3,'Jack','Taylor');

CREATE TABLE orders_12(order_id integer,date date,cust_id integer,amount integer); 
INSERT INTO orders_12(order_id,date,cust_id,amount) 
 VALUES (1,'05-08-2020',1,4922),(2,'04-08-2020',2,7116),
(3,'03-08-2020',3,1206),(4,'04-08-2020',1,2841),
(5,'05-08-2020',2,2522),(6,'05-08-2021',3,5084),(7,'04-08-2021',1,6680),
(8,'03-08-2021',2,8123),(9,'04-08-2021',3,6015),(10,'05-08-2021',2,4092),
(11,'05-08-2022',1,7224),(12,'04-08-2022',2,7679),(13,'03-08-2022',3,1303),
(14,'04-08-2022',1,5185),(15,'05-08-2022',2,2139);

select * from orders_12 AS a;
select * from customer_123 AS b;

--find total orders by each customers
--total orders by each customer by year
SELECT DISTINCT cust_id FROM customer_123;

SELECT * 
FROM 
(SELECT order_id,cust_id,year(date) yr
FROM orders_12
)AS a
pivot
(
 count(order_id) FOR cust_id in ([1],[2],[3])
)AS pivot_data;

SELECT * FROM
(SELECT a.order_id,CONCAT(b.cust_first_name,' ',b.cust_last_name)
full_name,year(a.date) yr
FROM orders_12 a
inner join customer_123 b
ON a.cust_id = b.cust_id)b
pivot(
count(order_id) for full_name in ([Henry Brown],[James Williams],[Jack Taylor]))
pivot_datas














