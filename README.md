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
 # Data Definition Language

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

    - We have to enter some data to continue the exercise.

    - But this command comes under lecture 05. 

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
6. ***Alter Table***
    - Alter Keyword
        - used to change the Table Structure
            - ADD keyword : To add a new column

            ```sql 
            -- How to add a new column after creating the table
            alter table Client
            add Fax_No varchar (10), Email varchar (20);
            ```
            -  COLUMN keyword : used to change the data type after creating the table
            ```sql
            alter table CLient
            alter column TP varchar(10);
            ```
            - DROP keyword : used to delete a column after creating the table
            ```sql
            alter table Client
            drop column Fax_No, Email, TP;
            ```
            - DROP CONSTRAINT keyword : used to delete the given constraints
            ```sql
            alter table Employee
            DROP CONSTRAINT fk_ID;
            ```
7. Deleting all the data in a table

    ```sql
        truncate table table_name; -- all the the data will be wiped but the structure remains
    ```
8. How to destroy a table

     ```sql
        drop table table_name; -- all the data + table structure will be deleted
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

    5. ***[Check]***    -   Ensures that the values
                            for a column satisfies a specific condition.
    ```sql
    create table client3
    (   
        Client_ID varchar(5) Primary Key constraint ck_ID check 
        (CLient_ID like ('C%')), -- CLient_ID should start with "C"
        Client_Name varchar(20) not null,
        Client_Address varchar(20) not null default 'Colombo',
        TP int not null,
        Balance_Due int not null,
        Order_Date date not null
    );
    ```
    ```sql
    create table client4
    (   
        Client_ID varchar(5) Primary Key constraint ck_ID1 check (CLient_ID like ('C%')),
        Client_Name varchar(20) not null,
        Client_Address varchar(20) not null default 'Colombo'
        constraint ck_addr check (Client_Address IN ('Colombo', 'Galle','Matara')), -- Address should be one of these cities.
        TP int not null,
        Balance_Due int not null,
        Order_Date date not null
    );
    ```
    ### Compostie Primary Key

    ```sql
    create table Orders1
    (
        Order_ID varchar (5),
        Ino varchar (10) references ivoice (InvNo),
        Eno varchar (5) references salesPerson (Emp_ID),
        Cno varchar (5) references Customer (Cus_ID),
        Primary Key (Order_ID, Ino, Eno, Cno) -- this is compostie primary key
    );
#   Data Manipulation Language
 
1. How to insert data to the table

    ```sql
    INSERT into client --with column names(no need to enter data for into columns that are not mentioned)
        (Client_ID, Client_Name, Client_Address, TP, Balance_Due, Order_Date)
        values
        ('C100', 'Gayan', 'Colombo', 0775645661, 15000, '2015-06-15');

        INSERT into client values -- without column names(must enter a value for each column)
        ('C600', 'Waruna', 'Galle', 0782569014, 18500, '2012-06-11'),
        ('C700', 'Sadun', 'Kandy', 0712562514, 19500, '2012-05-11');
    ```
2. How to update the data
    ```sql
    update Client
    set Client_Address = 'Matara'
    where Client_ID = 'C200'; -- where condition is used to filter the data
    -- if you want to update one specific data, you must use primary keys
    ```
3. How to delete the data from the table
    ```sql
    delete from Client -- = truncate table_name
    -- but you can't use "where" condition. 
    -- "Truncate" command deletes all the data in the table but the structure remains.
    where Client_ID = 'C100';
    ```
4. How to display the data
    ```sql
    select * -- asterisk means All columns
    from table_name;

    select column_1, column_3, column_2 -- after "select" type the columns you want to see
    from table_name;

    select *
    from table_name
    where column_name = value_of_the_cell_you_want
    ```
5. Ordering Rows in a table

    ```sql
    -- orders the data in the given column in aplhabetical or non-alphabetical order
    select *
    from table_name
    order by Column_Name; -- A to Z

    select *
    from table_name
    order by Column_Name desc; -- Z to A

    -- you can also compare values
    select column1, column2
    from table_name
    where columnName > some_value
    -- Ex: where balance_Due > 5000;
    -- you can use >, <=, >=, =, +, -
    ```
    