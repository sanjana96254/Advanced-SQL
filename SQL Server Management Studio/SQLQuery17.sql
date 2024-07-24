create table department(Name VARCHAR(200)); 
insert into department(Name) values('Engineering'), ('Marketing'), ('Legal'), ('Finance'), ('HR');

create table shift(Id VARCHAR(200)); 
insert into shift(Id) values('Day'), ('AfterNoon'), ('Night');

create table country(Name VARCHAR(200)); 
insert into country(Name) values('India'), ('US');

select * FROM department;
select * FROM shift;
select * FROM country;

SELECT a.*, b.*,c.*
FROM department a,
shift b, country c;

SELECT d.*,
    CASE 
        WHEN d.shift_id = 'Day' THEN '7:00 a.m. to 3:00 p.m.'
        WHEN d.shift_id = 'Night' THEN '11:00 p.m. to 7:00 a.m.'
        ELSE '3:00 p.m. to 11:00 p.m.' 
    END AS shift_timings 
FROM
    (SELECT 
        a.Name AS department_name,
        b.Id AS shift_id,
        c.Name AS country_name 
    FROM department a
    CROSS JOIN shift b
    CROSS JOIN country c) d;



