-- Structured Query Language
	-- Data Definition Language
	-- Data Manipulation Language
	-- Data Control Language
-- Data Definition Language 
	--1. How to create a database
Create DATABASE Company;
create database Hotel;
	--2. How to go inside the database
use Company;
	--3. How to create a table inside the database
create table client
(Client_ID varchar(10) Primary Key,
Client_Name varchar(20),
Client_Address varchar(20),
TP int,
Balance_Due int,
Order_Date date);
	-- Inserting values into a table
-- we have to enter some data to continue
-- the exercise
-- But this command comes under lecture 05
insert into client
(Client_ID, Client_Name, Client_Address, TP, Balance_Due, Order_Date) values
('C100', 'Amali', 'Colombo', 0772562334, 1500, '2015-05-12');

select* from client; -- to see the data
insert into client
values
('C101', 'Amali', 'Colombo', 0772562334, 1500, '2015-05-12');
select* from client;