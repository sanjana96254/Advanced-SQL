create table table1(
ID varchar(133),
name varchar(133)
);

insert into table1 (id,name) 
values ('n1','AS'),('n2','BR'),('n3','GA'),('n4','GJ'),('n5','HR');

create table table2(
orderID varchar(133),
custid varchar(133),
sale integer
);

insert into table2 (orderid,custid,sale) 
values ('1','1','936'),('2','2','698'),('3','3','232'),('4','4','672'),('5','5','413');

create table table3(
name varchar(133),
height integer
);

insert into table3 (name,height) 
values 
('n1','259'),('n2','204'),('n3','154'),('n4','188'),('n5','236');

select * from table1;
select * from table2;
select * from table3;

select *, case
when height between 201 and 250 then '201-250'
when height between 176 and 200 then '176-200'
when height>250 then 'Over 250'
when height<176 then '175 or under'
end as bucket
from table3;

select *, case
when height>250 then '201-250'
when height>200 then '201-250'
when height>175 then '176-200'
when height<176 then '175 or under'
end as bucket
from table3;

select *,
case 
when name='AS' then 'ASSAM'
when name ='BR' then 'BIHAR'
when name ='GA' then 'GOA'
when name ='GJ' then 'GUJARAT'
when name ='HR' then 'HARYANA'
end as full_name_state
from table1;

update table1 set name =
case 
when name='AS' then 'ASSAM'
when name ='BR' then 'BIHAR'
when name ='GA' then 'GOA'
when name ='GJ' then 'GUJARAT'
when name ='HR' then 'HARYANA'
end;

select * from table1;