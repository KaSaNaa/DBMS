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

		-- ORDER BY - sorts the records by order by clause(ascending)
		select * from Employee ORDER BY e_Salary;