drop table if exists details;
-- create a table
CREATE TABLE details (
  cust_id varchar(200),
  order_id integer,
  item varchar(200),
  quantity integer 
);
-- insert some values
INSERT INTO details(cust_id,order_id,item,quantity) 
values ('c1',1, 'mouse', 2),
('c1',1, 'keyboard', 3),
('c1',1, 'headphone', 5),
('c2',1, 'laptop',1 ),
('c2',1, 'pendrive', 3),
('c2',1, 'tv', 2),
('c2',1, 'washing machine', 2),
('c3',1, 'mobile', 1),
('c3',1, 'earphones',3 );

Select * from details;

select STRING_AGG(item,',' )joined from details;

select STRING_AGG(detail,';')joined from
(select concat(item,'-',quantity) detail from details) AS a;

select concat(item,'-',quantity) detail from details;

select cust_id, STRING_AGG(detail,',') summary from 
(select cust_id,concat(item,'-',quantity) detail from details)a
group by cust_id;

select STRING_AGG(item,',') within group (order by item desc) summary from details;

select STRING_AGG(item,',') within group (order by quantity desc) summary from details;

select custorder,STRING_AGG(summary,';') summary from
(select CONCAT(cust_id,'-',order_id) custorder, concat(item,'-',quantity) summary from details) AS a
group by custorder;
