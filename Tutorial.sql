create database Tutorial;  -- creates a new database
use Tutorial; -- selects the created database
drop database [DatabaseName] -- deletes a database
-- Numerical Data Types
	bigint / int / smallint / tinyint / decimal(s,d)
-- Character data types
	char -- char is a fake length data type
	varchar / text
-- Data and Time Data Types
	year / time / date

-- Constraints
	Not Null -- makes sure the columns always contain value
	Default  -- sets a default value for a column
	Unique   -- makes sure all the data in a column is unique
	Primary Key -- (Not Null + Unique) sets a PK

-- Create a table
	create table Employee(
	e_ID int not null,
	e_Name varchar(20),
	e_Salary int,
	e_gender varchar(5),
	e_dept varchar (20),
	primary key(e_ID)
	);

-- Insert data into the table
	insert into Employee values(
	01, 'Kamal', 95000, 'male', 'Ops'
	);
	insert into Employee values(
	02, 'Bob', 20000, 'male' , 'Support'
	);
	insert into Employee values(
	03, 'Anne', 50000, 'fmale', 'Analytics'
	);
-- Select Statement
	select e_Name from Employee;
	select e_gender from Employee;
	select e_Name, e_gender, e_Salary from Employee;
	select * from Employee;

-- Select Distinct (is used to select only distinct values from our column)
	select distinct e_gender from Employee;

-- Where clause (used to extract a records which satisfy a given condition
	select e_Name, e_gender from Employee where e_Salary > 40000;
	
		-- NOT Operator
		select * from Employee where NOT e_gender = 'fmale';

		-- LIKE Operator
		select * from Employee where e_Name LIKE 'B%'; -- displays names start with B

		-- BETWEEN Operator
		select * from Employee where e_Salary BETWEEN 0 AND 100000; -- displays values in a given range

-- AGGREGATED FUNCTIONS
		-- MIN() Function - gives the smallest value
		select MIN(e_Salary) from Employee;

		-- MAX() Function - gives the highest value
		select MAX(e_Salary) from Employee;

		-- COUNT() Function - returns the number of rows that match a specific criteria
		select COUNT(*) from Employee where e_gender = 'male'OR	e_gender='fmale';

		-- SUM() Function - gives the total sum of a numeric column
		select SUM(e_Salary) from Employee;

		-- AVG() Function - gives the average value of a numeric column
		select AVG(e_Salary) from Employee;

-- STRING FUNCTIONS
		-- LTRIM() - removes spaces from the left side
		select '   blabla';
		select LTRIM('   blabla');

		-- LOWER() - converts every letter to lowercase
		select LOWER('HELLO');

		-- UPPER() - converts every letter to uppercase
		select UPPER('hello');

		-- REVERSE() - prints all the characters reversely
		select REVERSE('hello');

		-- SUBSTRING() - gives a substring from the original string
		-- this takes 3 parameters (String, Start index value, length of substring)
		select SUBSTRING('123456789', 5, 4);

-- ORDER BY - sorts the records by order by clause(ascending by default)
	select * from Employee ORDER BY e_Salary;
	select * from Employee ORDER BY e_Salary desc;

-- TOP - fetches the top n number of records
	select top 3 * from Employee;

-- GROUP BY - gets aggregate result with respct to a group
	select AVG(e_salary), e_gender from Employee GROUP BY e_gender;
	select AVG(e_salary), e_name from Employee GROUP BY e_name ORDER BY AVG(e_salary) desc;

-- HAVING - uses in combination with GROUP BY to impose conditions on groups
	select e_dept, AVG(e_salary) as AVG_SALARY
	from Employee
	GROUP BY e_dept
	HAVING AVG(e_salary)>10000;

-- UPDATE - uses to modify existing records in a table
	UPDATE Employee 
	set e_gender = 'fmale' where e_name = 'Bob'; 

	UPDATE Employee 
	SET e_dept = 'Ops'
	WHERE e_gender = 'male';

	UPDATE Employee
	SET e_salary = 50000

-- DELETE - uses to delete existing records in the table
	DELETE FROM Employee where e_gender = 'fmale'

-- TRUNCATE - deleted all the data in a table(structure remains)
	TRUNCATE table Employee;

-- JOINS in SQL 

	--	INNER JOIN - shows records that have matching values in both the tables.(Intersection of two tables)
		/* Syntax 
		*/ 
		/*
			SELECT columns
			FROM table1
			INNER JOIN table2
			ON table1.column_x = table2.column_y
		*/

		SELECT employee.e_Name, employee.e_dept, department.Location
		FROM Employee
		INNER JOIN department ON employee.dpt_ID = department.DEPT_ID;
		
	-- LEFT JOIN - shows all the record from the left tables and matching records from the right table.
		/*
		SELECT columns
		FROM table1
		LEFT JOIN table2
		ON table1.column_x = table2.column_y;
		*/

		SELECT EMPLOYEE.e_Name, EMPLOYEE.e_dept, DEPARTMENT.DEPT_NAME, DEPARTMENT.LOCATION
		FROM EMPLOYEE
		LEFT JOIN DEPARTMENT 
		ON EMPLOYEE.e_dept = DEPARTMENT.DEPT_NAME;

	-- RIGHT JOIN 
		/* 
		SELECT columns
		FROM table1
		RIGHT JOIN table2
		ON table1.column_x = table2.column_y;
		*/

		select employee.e_name, employee.e_dept, department.DEPT_Name, department.location
		FROM employee
		RIGHT JOIN Department 
		ON Employee.e_dept = department.DEPT_Name;

	-- FULL JOIN 

		SELECT EMPLOYEE.e_Name, EMPLOYEE.e_dept, DEPARTMENT.DEPT_NAME, DEPARTMENT.LOCATION
		FROM EMPLOYEE
		FULL JOIN DEPARTMENT 
		ON EMPLOYEE.e_dept = DEPARTMENT.DEPT_NAME;
	
	-- UPDATE using JOIN -- Joins two tables and updates the table
		UPDATE employee
		set e_age = e_age + 10
		from employee
		join department on employee.e_dept = department.DEPT_Name
		where location = 'Colombo';

	-- DELETE using JOIN
		DELETE employee
		from Employee
		join department on employee.e_dept = department.DEPT_NAME
		where location = 'Colombo';

-- SET OPERATORS (tables must have same types and columns)

	-- UNION Operator - shows the data of both tables in a one table. 
		select * from STUDENT_DETAILS1
		union
		select * from STUDENT_DETAILS2

	-- EXCEPT Operator - shows the table1 - table2 data
		
		SELECT * FROM STUDENT_DETAILS1
		EXCEPT 
		SELECT * FROM STUDENT_DETAILS2;
		
	-- INTERSECT Operator - shows the intersect of two tables
		SELECT * FROM STUDENT_DETAILS1
		INTERSECT 
		SELECT * FROM STUDENT_DETAILS2
	
	-- VIEW - shows virtual a table based on the result of an SQL statement
		CREATE VIEW FEMALE_EMPLOYEES AS 
		SELECT * FROM EMPLOYEE
		WHERE e_gender = 'fmale';  -- then, to show the table which is created virtually, use
		SELECT * FROM FEMALE_EMPLOYEES

	-- DROP VIEW - drops the view we have created
		DROP VIEW FEMALE_EMPLOYEES

-- ALTER TABLE - ADD, DELETE and MODIFY columns in existing tables
	ALTER TABLE EMPLOYEE
	ADD E_DOB DATE;

	-- DROP COLUMN
		ALTER TABLE EMPLOYEE
		DROP COLUMN E_DOB

-- User Defined Functions 

	-- Scalar Valued Function - Always return a scalar value
	/* 

	CREATE FUNCTION function_name(param1 data_type, param2 data_type...)
	RETURN return_datatype
	AS
	BEGIN
		--- Function Body
	RETURN value
	END

	*/

	CREATE FUNCTION ADD_FIVE(@NUM INT)
	RETURNS  INT 
	AS 
	BEGIN 
	RETURN (
		@NUM+5
	)
	END

	SELECT DBO.ADD_FIVE(100)
	