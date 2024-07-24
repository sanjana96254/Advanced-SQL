drop table if exists table1;
CREATE TABLE table1(id integer); 

 INSERT INTO table1(id) 
 VALUES(1),
 (1),
 (2),
 (3),
 (4),
 (3);

 drop table if exists table2;
CREATE TABLE table2(id integer); 

 INSERT INTO table2(id) 
 VALUES(1),
 (2),
 (3),
 (2);

 select * from table1;
 select * from table2;

  --inner join
  select * from table1 inner join table2 on table1.id = table2.id;

  --left join
  select * from table1 left join table2 on table1.id = table2.id;

  --right join
  select * from table1 right join table2 on table1.id = table2.id;

  --full outer join
  select * from table1 full outer join table2 on table1.id = table2.id;