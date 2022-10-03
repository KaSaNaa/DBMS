# DBMS
 DBMS things we did at Uni.

# - Structured Query Language

## Categories of SQL Commands

- **Data Query Language** : 
```sql 
select
```
- **Data Definition Language** :
```sql
create Table
Alter Table
Drop Table
```
- **Data Manipulation Language** :
```sql
insert
update
delete
```
- **Data Control Language** :
```sql
grant
revoke
```


1. **_How to create a database_**

    ```sql
    Create DATABASE Company;
    create database Hotel;
    -- SQL isn't case sensitive
    ```
2. **_How to go inside the database_**

    ```sql
    use Company;
    ```
3. **_How to create a table inside the database_**

    ```sql
    -- create table TableName(ColumnName dataType(size))
    -- data types such as date and int does not require a size.
    create table client
    (Client_ID varchar(10) Primary Key,
    Client_Name varchar(20),
    Client_Address varchar(20),
    TP int,
    Balance_Due int,
    Order_Date date);
    ```
4. **_Inserting values into a table_**

    > We have to enter some data to continue the exercise.

    > But this command comes under lecture 05. 

    ```sql
    insert into client
    (Client_ID, Client_Name, Client_Address, TP, Balance_Due, Order_Date) values
    ('C100', 'Amali', 'Colombo', 0772562334, 1500, '2015-05-12');

    select* from client; -- to see the data
    insert into client
    values
    ('C101', 'Amali', 'Colombo', 0772562334, 1500, '2015-05-12');
    select* from client;
    insert into client
    (Client_ID, Client_Name, Client_Address, Balance_Due, Order_Date) values
    ('C102', 'Pasindu', 'Colombo', 1500, '2005-05-04');
    select * from client;
    ```
5. **_Dropping/ Deleting Databases_**

    ```sql
    drop client
    ```
## Data types in SQL
```
Data Type               Range
```
```sql
bigint                  64 bits
int                     32 bits
smallint                16 bits
tinyint                 08 bits
decimal(s,d)            5-17 bytes -- decimals require 2 arguments.
                --(total number of digits, number of decimal points)

char(s)                 255 characters -- this wastes memory
varchar(s)              255 characters
text                    65,535 characters

date                    YYYY-MM-DD
time                    HH:MM:SS
year                    YYYY
```
## Constraints in SQL

- **_Constraints are used to specify rules for data in table._**


1. ***[Not Null***] -   Ensures that a 
                        column cannot have a null value
```sql
create table client1
(   
    Client_ID varchar(5) Primary Key,
    Client_Name varchar(20) not null,
    Client_Address varchar(20) not null,
    TP int not null,
    Balance_Due int not null,
    Order_Date date not null
);
```

2. ***[Default]***  -   Sets a default value for a column
```sql
create table client1
(   
    Client_ID varchar(5) Primary Key,
    Client_Name varchar(20) not null,
    Client_Address varchar(20) not null default 'Colombo',
    TP int not null,
    Balance_Due int not null,
    Order_Date date not null
);
```

3. ***[Unique]***    -   Ensures that all values in a column is different

4. ***[Primary Key]***- Uniquely identifies each record in a table
