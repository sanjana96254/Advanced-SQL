--A stored procedure is a database object.
--A stored procedure is a series of declarative SQL statements.
--A stored procedure can be stored in the database and can be reused over again several times.
--Parameters can be passed to a stored procedure, so that the stored procedure can act based on the parameters value.
--SQL server creates an execution plan and stores it in the cache.

--types of Stored procedures- User Defined Stored Procedure and System Stored Procedures.

--User defined stored procedures are created by database developers or database administrators. These procedures contains one or more SQL statements to SELECT, UPDATE or DELETE records from database tables.
--System Stored Procedures are created and executed by the SQL server for the server administrative activities.

--HOW TO CREATE STORED PROCEDURE-

CREATE PROCEDURE Employee
AS
BEGIN
SELECT * FROM EmployeeDetails WHERE EmpId = 2;
END;

Execute Employee

--HOW TO MODIFY STORED PROCEDURE-

ALTER PROCEDURE Employee
AS
BEGIN
    SELECT * FROM EmployeeDetails WHERE Gender = 'male';
    SELECT * FROM EmployeeDetails WHERE Gender = 'female';
END;

ALTER PROCEDURE Employee
AS
BEGIN
    SELECT * FROM EmployeeDetails WHERE Department = 'IT';
    SELECT * FROM EmployeeDetails WHERE Department = 'payroll';
	SELECT * FROM EmployeeDetails WHERE Gender = 'male';
    SELECT * FROM EmployeeDetails WHERE Gender = 'female';
END;

Execute Employee

--HOW TO DROP STORED PROCEDURE-
ALTER PROCEDURE Employee
AS
BEGIN
    SELECT * FROM EmployeeDetails WHERE Gender = 'male';
    SELECT * FROM EmployeeDetails WHERE Gender = 'female';
END;

DROP PROCEDURE Employee

--PARAMETERS IN STORED PROCEDURE
--PARAMETERS ARE OF TWO TYPES- INPUT PARAMETER & OUTPUT PARAMETER
ALTER PROCEDURE Employee
    @dept_ varchar(100),
    @gender varchar(100)
AS
BEGIN
    SELECT * FROM EmployeeDetails WHERE Department = @dept_;
	SELECT * FROM EmployeeDetails WHERE Department = @dept_;
	SELECT * FROM EmployeeDetails WHERE Gender = @gender;
	SELECT * FROM EmployeeDetails WHERE Gender = @gender;
   
END;
Employee 'IT','female'

--OUTPUT PARAMETER
ALTER PROCEDURE Employee
    @dept_ varchar(100) OUTPUT,
    @gender varchar(100) OUTPUT
AS
BEGIN
    SELECT @dept_ = Department FROM EmployeeDetails WHERE Gender = @gender;
    SELECT @gender = Gender FROM EmployeeDetails WHERE Department = @dept_;
END;
