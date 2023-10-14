CRUD operations
- Create
- Read
- Update
- Delete

SQL Subsets
- DDL: Data definition language
- DML: Data manipulation language
- DQL: Data query language
- DCL: Data control language

Create a database
```
CREATE DATABASE database_name;
```

Create a table
```
CREATE TABLE table_name;
```

DML:
Add data to a table
```
INSERT INTO table_name (col_one, col_two) VALUES (val_1, val_2);
```

Update data in a table
```
UPDATE table_name SET k = v WHERE condition;
```

Delete data form a table
```
DELETE FROM table_name where condition;
```

DQL:
Query data within a table
```
SELECT
```

DDL:
- CREATE
- DROP
- ALTER
- TRUNCATE
- COMMENT

DQL:
- SELECT

DML:
- INSERT
- UPDATE
- DELETE

DCL:
- GRANT
- REVOKE

TCL:
Transaction control language
- COMMIT
- ROLLBACK



Oct 9



## Tables overview

### Data types

Numeric data types: INT, TINYINT, BIGINT, FLOAT, REAL

Date and time datatypes: DATE, TIME, DATETIME

Char and string: CHAR, VARCHAR

Binary datatypes: BINARY, VARBINARY

Misc datatypes:

- Character Large Object (CLOB) for large block of text
- Binary Large Object (BLOB) a collection of binary data

### Primary Key

- a key which can uniquely identify a particular tuple (row) in a relation (table)

- in some cases, it can comprise more than one column, when a single col cannot make it unique.

### Foreign Key

- primary key in one table can be a foreign key in other table

### Integrity constraints

- Key constraints
- Domain constraints
- Referential integrity constraints



## Database structure overview

## Database structure

- tables or entities
- attr, which describe the table, like schema
- fields -> cols
- record -> rows
- primary key, unique value

### Logical database structure

Entity Relationship Diagram (ERD)

- one to one
- one to many
- many to many

## Week 2

### Lab - work with numbers

Some useful SQL scripts

```sql
CREATE DATABASE cm_devices;
USE cm_devices;
CREATE TABLE devices (deviceID int, deviceName varchar(50, price decimal));
SHOW tables; 
SHOW COLUMNS FROM devices;
CREATE TABLE stock(deviceID int, quantity int, totalCost decimal);
```

### String datatypes

CHAR

- the given length of characters is predetermined

VARCHAR

- the given length of characters is variable

TINYTEXT

TEXT

MEDIUMTEXT 

LONGTEXT



### Lab - work with Strings

```sql
CREATE TABLE customers (username CHAR(9), fullName VARCHAR(100), email VARCHAR(255));
CREATE TABLE feedback(feedbackID CHAR(8), feedbackType VARCHAR(100), comment TEXT(500));
```

### Default values

- NOT NULL
  - must always contain data

```sql
# NOT NULL SQL Statement
CREATE TABLE Customer (
    customer_id int NOT NULL,
    customer_name varchar(255) NOT NULL,
);
```

- DEFAULT
  - sets a default value for a col that no value is specified

```sql
# DEFAULT SQL Statement
CREATE TABLE Player (
	name varchar(50) NOT NULL, 
    city varchar(30) DEFAULT "Barcelona"
);
```



### Lab - work with default value

```sql
CREATE TABLE address(id int not null, street varchar(255), postcode varchar(10), town varchar(30) default "Harrow");
```



## CREATE and DROP Database

```sql
CREATE DATABASE database_name;
DROP DATABASE database_namel;
```

### ALTER Table

#### Add col

```sql
ALTER TABLE students ADD (age INT, country VARCHAR(50), nationality VARCHAR(255));
```

#### Drop col

```sql
ALTER TABLE students DROP COLUMN nationality;
```

#### Update col constraint

```sql
ALTER TABLE students MODIFY country VARCHAR(100);
```

### INSERT Statement

```sql
INSERT INTO table_name (col1_name, col2_name, col3_name)
VALUES (value1, value2, value3);

# Also can insert multiple rows
...
VALUES
(value1, value2, value3),
(value1, value2, value3),
(value1, value2, value3);
```

```sql
INSERT INTO players(ID, name, age, start_date) VALUES (1, "Yuval", 25, CURRENT_DATE());
```

```sql
SELECT * FROM players
```

### SELECT Statement

```sql
SELECT column FROM table;
SELECT col1, col2 FROM tables;
SELECT * FROM table;
```

### INSERT INTO SELECT Statement

```sql
INSERT INTO target_tbl (col_name)
SELECT col_name
FROM source_tbl;
```

```sql
INSERT INTO country (countryName) SELECT country FROM players;
```

### UPDATE Statement

```sql
UPDATE student_tbl
SET home_address = '124 park Avenue', contact_number = '2344'
WHERE ID = 3;
```

### DELETE Statement

```sql
DELETE FROM student_tbl
WHERE last_name = 'Millar';

# Or remove all stuff in the table
DELETE DROM student_tbl;
```



## Week 3 SQL Operators

Arithmetic operators

- perform mathematical calculations

+ +, -, * / %

```sql
# Use addition operator
SELECT col1_name + col2_name FROM table_name

# salaries of employees whose total is 25000
SELECT *
FROM employee
WHERE salary + allowance = 25000;
```









