
/*                                                       Har Har MahaDev
                                                         ---------------
16-09-2024
----------
*/

CREATE DATABASE mydb;
CREATE SCHEMA Test;

DROP DATABASE mydb;

CREATE DATABASE IF NOT EXISTS mydb;


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

17-09-2024
----------
*/

USE mydb;

CREATE TABLE Student 
(Roll_num INT (5),
Name VARCHAR (15),
Marks INT (3));

-- Will give Structure/schema of the table.
DESCRIBE Student;

-- For SQL Server.
EXEC sp_help 'TableName';


INSERT INTO Student VALUES (1,'SHree Ram', 100);
INSERT INTO Student VALUES (1,'MahaDev', null);

SELECT * FROM Student;

-- TRUNCATE statement is used to quickly and efficiently remove all rows from a table, resetting the table to an empty state. 
TRUNCATE Student;

SELECT Roll_num, MARKS FROM Student;

-- ALIAS
SELECT Roll_num Rnum, Marks Mrk FROM Student;

IMPORT TABLE FROM 'C:\Users\Administrator\Downloads/employee';

-- Pattern matching works with only LIKE/NOT LIKE operator.


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

22-09-2024
----------
*/

-- Shortcut key :
CTRL + ENTER : Execute the current line
CTRL + SHIFT + ENTER : Execute all line

-- To add new column to a table.
ALTER TABLE student ADD(Age int);

-- To remove a column from a table.
ALTER TABLE student DROP COLUMN Age;


/*We can increase the size of the clomun but in order to decrease the size or change the datatype of column,  
the column should not have any data, it should be empty. */

ALTER TABLE stuent MODIFY COLUMN Name VARCHAR(20);


-- Rename a cloumn in a table.
ALTER TABLE student RENAME COLUMN Name TO SName;


/* In SQL, the command SET autocommit = 0; disables the autocommit mode for the current session. When autocommit is disabled, any SQL 
changes (such as INSERT, UPDATE, DELETE, etc.) are not automatically committed to the database after each statement. Instead, 
you must manually commit or roll back transactions.

By default it's values is 1.
You have to "COMMIT" changes to safe/update the update in DB.
*/


SET autocommit = 0;
SET SQL_SAFE_UPDATES = 0;

COMMIT;

DELETE FROM student;

ROLLBACK;

-- TRUNCATE statement is used to quickly and efficiently remove all rows from a table, resetting the table to an empty state. Rollback is not possible.

TRUNCATE Student;

-- TO rename a table

RENAME TABLE HR to TA;

-------------------------------------------------------------------- x --------------------------------------------------------------------

-- Built-in Functions in MySQL

/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------
23-09-2024
----------
*/


-- WHERE Clause example.
SELECT * FROM employees
WHERE department = 'Sales';


-- Having clause example.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;


-- You can use both WHERE and HAVING in the same query:
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE department != 'HR'  -- Exclude the HR department (individual rows filter)
GROUP BY department
HAVING AVG(salary) > 50000;  -- Only include departments where the average salary is greater than 50,000 (groups filter)

-- <> is not equal to in SQL.
ex. 
DEPARTMENT_ID<>50


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------
02-10-2024
----------
*/

-- NULL is allowed in UNIQUE constraints.
-- UNIQUE Constraint will not allow duplicate of "string" & Integers

-- AUTO_INCREMENT has to be used with PRIMARY KEY Constraint

-- Any modification on the OG table will affect the View. But same does not for vice-versa.

-- If COMMIT action is done then we cannot get the ROLLBACK.


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------
01-01-2025
----------
*/

-- Columns are also called Fields & Rows are also called Records.

/*
In a relational database, a schema is the logical structure that defines how data is organized 
and stored within the database. 
It serves as a blueprint that outlines the organization of tables, fields (columns), data types, 
relationships, constraints, indexes, and other database objects.

Key Components of a Schema:
1. Tables - Structures that store data in rows and columns.
2. Columns (Fields) - Define the type of data (e.g., INTEGER, VARCHAR) stored in each field of a table.
3. Constraints - Rules to maintain data integrity, such as:
    Primary Key: Ensures each row is unique.
    Foreign Key: Enforces relationships between tables.
    Unique: Prevents duplicate values in a column.
    Check: Ensures column values satisfy specified conditions.

4. Indexes - Improve query performance by enabling faster data retrieval.
5. Views - Virtual tables created from queries to simplify complex data access.
6. Stored Procedures and Functions - Predefined SQL code to perform tasks.
7. Triggers - Automated actions executed when specific events occur.

Schema Types in RDBMS:
1. Physical Schema - Defines how data is actually stored in the database (disk storage details).
2. Logical Schema - Focuses on the logical structure and relationships of the data without considering physical storage.
3. External Schema (View Schema) - Represents the way data is presented to users or applications, often customized for different user groups.

Example:

CREATE SCHEMA company;

CREATE TABLE company.employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);


 - LEFT JOIN and LEFT OUTER JOIN are the same in SQL.

 - FULL JOIN and FULL OUTER JOIN are the same in SQL.
        Both return all rows from both tables.
        If there is a match between the tables, the matched rows are combined.
        If there is no match, NULL values are used for columns from the table without matching data.


*/

-- The keyword "AS" is used to assign a temporary alias to a column or expression in the query result.

SELECT last_name, COUNT(last_name) AS count
FROM people
GROUP BY last_name
ORDER BY count DESC
LIMIT 1;


/*
   Statements used in 'Learning SQL Programming'
*/

-- 00_03
SELECT * FROM people;
SELECT first_name FROM people;

-- 01_01
SELECT 'Hello, World!';
SELECT first_name FROM people;
SELECT last_name FROM people;
SELECT first_name, last_name FROM people;
SELECT last_name, first_name FROM people;
SELECT * FROM people;
SELECT first_name, state, company FROM people;
SELECT company, first_name, quiz_points FROM people;

-- 01_02
SELECT * FROM people WHERE state='CA';
SELECT * FROM people WHERE state='FL';
SELECT * FROM people WHERE state='WA';
SELECT * FROM people WHERE state='NY';
SELECT * FROM people WHERE shirt_or_hat='NY';
SELECT * FROM people WHERE shirt_or_hat='hat';
SELECT first_name, last_name FROM people WHERE shirt_or_hat='shirt';
SELECT first_name, last_name, shirt_or_hat FROM people WHERE shirt_or_hat='shirt';
SELECT first_name, last_name, shirt_or_hat WHERE shirt_or_hat='shirt' FROM people; -- Note: This is an invalid statement.

-- 01_03
SELECT first_name, last_name FROM people WHERE state='CA' AND shirt_or_hat='shirt';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team='blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team IS 'blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team IS NOT 'blue';
SELECT first_name, last_name, team FROM people WHERE state='CA' AND shirt_or_hat='shirt' AND team != 'blue';
SELECT first_name, last_name, team, shirt_or_hat, state FROM people WHERE state='CA' OR state='CO' AND shirt_or_hat='shirt';
SELECT first_name, last_name, team, shirt_or_hat, state FROM people WHERE (state='CA' OR state='CO') AND shirt_or_hat='shirt';

-- 01_04
SELECT first_name, last_name, state FROM people WHERE state LIKE 'C%';
SELECT first_name, last_name, state FROM people WHERE state LIKE 'N%';
SELECT first_name, last_name, state FROM people WHERE state LIKE '%N';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE 'A%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE 'J%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%J%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%on%';
SELECT first_name, last_name, state FROM people WHERE first_name LIKE '%ch%';
SELECT first_name, last_name, state FROM people WHERE company LIKE '%LLC';
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC';
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 5;
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 10;
SELECT first_name, last_name, state, company FROM people WHERE company LIKE '%LLC' LIMIT 10 OFFSET 5;

-- 01_05
SELECT first_name, last_name FROM people;
SELECT first_name, last_name FROM people ORDER BY first_name;
SELECT first_name, last_name FROM people ORDER BY first_name ASC;
SELECT first_name, last_name FROM people ORDER BY first_name DESC;
SELECT state, last_name, first_name FROM people ORDER BY state ASC, last_name ASC;
SELECT state, last_name, first_name FROM people ORDER BY state ASC, last_name DESC;

-- 01_06
SELECT first_name FROM people;
SELECT first_name, LENGTH(first_name) FROM people;
SELECT DISTINCT(first_name) FROM people;
SELECT DISTINCT(first_name) FROM people ORDER BY first_name;
SELECT DISTINCT(shirt_or_hat) FROM people;
SELECT COUNT(*) FROM people WHERE state='CA';

-- 02_01
SELECT first_name, state FROM people;
SELECT first_name, state FROM people JOIN states;
SELECT people.first_name, people.state, states.division FROM people JOIN states ON people.state=states.state_abbrev;
SELECT * FROM people JOIN states ON people.state=states.state_abbrev;
SELECT * FROM people JOIN states ON people.state=states.state_abbrev WHERE people.first_name LIKE 'j%' AND states.region='South';

-- 02_02
SELECT people.first_name, people.last_name, people.state, states.state_name FROM people JOIN states ON people.state=states.state_abbrev;
SELECT people.first_name, people.last_name, people.state, states.state_name FROM states JOIN people ON people.state=states.state_abbrev;
SELECT people.first_name, people.last_name, people.state, states.state_name FROM states LEFT JOIN people ON people.state=states.state_abbrev;
SELECT DISTINCT(people.state), states.state_abbrev FROM states LEFT JOIN people ON people.state=states.state_abbrev ORDER BY people.state;

-- 02_03
SELECT first_name, COUNT(first_name) FROM people;
SELECT first_name, COUNT(first_name) FROM people GROUP BY first_name;
SELECT first_name, COUNT(first_name) FROM people GROUP BY last_name;
SELECT last_name, COUNT(first_name) FROM people GROUP BY last_name;
SELECT state, COUNT(state) FROM people GROUP BY state;
SELECT state, quiz_points, COUNT(quiz_points) FROM people GROUP BY quiz_points;
SELECT state, quiz_points, COUNT(quiz_points) FROM people GROUP BY state, quiz_points;


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------
02-01-2025
----------
*/

-- NULL in SQL represents nothing it is diff than no, false or zero. NULL means value is empty.

SELECT team, count(*), sum(quiz_points), (sum(quiz_points)/count(*)) AS Average  -- expression is written in ()
FROM people GROUP BY team;

/*
Aggregate function has to be inside SELECT clause.

Common Aggregate Functions:

Function	Description
COUNT()	    Counts the number of rows or non-NULL values in a column.
SUM()	    Calculates the total sum of numeric values in a column.
AVG()	    Calculates the average (mean) of numeric values in a column.
MAX()	    Finds the maximum value in a column.
MIN()	    Finds the minimum value in a column.

*/


-- Compound Select statement.

SELECT first_name, last_name, quiz_points FROM people 
WHERE quiz_points=(SELECT max(quiz_points) FROM people);

SELECT * FROM people 
WHERE state=(SELECT state_abbrev FROM states WHERE state_name='Mississippi');




-- 03_02
SELECT 4+2;
SELECT 1/3;
SELECT 1/3.0;
SELECT 3>2;
SELECT 2>3;
SELECT 5!=3;
SELECT first_name, quiz_points FROM people WHERE quiz_points > 70;
SELECT first_name, quiz_points FROM people WHERE quiz_points >= 70;
SELECT MAX(quiz_points), MIN(quiz_points) FROM people;
SELECT SUM(quiz_points) FROM people;
SELECT team, COUNT(*) FROM people GROUP BY team;
SELECT team, COUNT(*) FROM people;
SELECT team, COUNT(*), SUM(quiz_points), (SUM(quiz_points)/COUNT(*)) AS average FROM people GROUP BY team;




-- 03_04
SELECT first_name, last_name FROM people;
SELECT LOWER(first_name), UPPER(last_name) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 1, 5) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 2, 4) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, 2) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, -2) FROM people;
SELECT LOWER(first_name), SUBSTR(last_name, -4) FROM people;
SELECT LOWER(first_name), REPLACE(last_name, 'a', '_') FROM people;
SELECT quiz_points FROM people ORDER BY quiz_points;
SELECT quiz_points FROM people ORDER BY CAST(quiz_points AS char);
SELECT MAX(CAST(quiz_points AS CHAR)) FROM people;
SELECT MAX(CAST(quiz_points AS INT)) FROM people;

-- 03_05
SELECT first_name, last_name FROM people;
SELECT first_name, UPPER(last_name) FROM people;
SELECT first_name, UPPER(last_name) AS surname FROM people;

-- 04_01
INSERT INTO people (first_name) VALUES ('Bob');
SELECT * FROM people;
INSERT INTO people (first_name, last_name, state, city, shirt_or_hat) VALUES ('Mary', 'Hamilton', 'OR', 'Portland', 'hat');
SELECT * FROM people;
INSERT INTO people (first_name, last_name) VALUES ('George', 'White'), ('Jenn', 'Smith'), ('Carol', 'Anderson');
SELECT * FROM people;

-- 04_02
SELECT * FROM people;
UPDATE people SET first_name='Martha' WHERE first_name='George' AND last_name='White';
SELECT * FROM people;
SELECT * FROM people WHERE company='Fisher LLC';
UPDATE people SET company='Megacorp Inc' WHERE company='Fisher LLC';
SELECT * FROM people WHERE company='Fisher LLC';
SELECT * FROM people WHERE company='Megacorp Inc';

-- 04_03
SELECT * FROM people;
DELETE FROM people WHERE first_name='Martha' AND last_name='White';
SELECT * FROM people;
DELETE FROM people WHERE id_number IS NULL;
SELECT * FROM people;


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

05-01-2025
----------

Union Join & Union All Join & Cross Join


-- Union Join
Definition: Combines the result sets of two or more SELECT queries and removes duplicates.

Key Point: Ensures unique rows in the final output.

Conditions:
Both queries must return the same number of columns.
Data types of corresponding columns must be compatible.


-- Union All Join
Definition: Combines the result sets of two or more SELECT queries but does not remove duplicates.

Key Point: Retains all rows, including duplicates.

Conditions:
Both queries must return the same number of columns.
Data types of corresponding columns must be compatible.

-- Cross Join
Definition: Produces the Cartesian product of two tables, meaning every row from the first 
table is paired with every row from the second table.

Key Point: The result set contains all possible combinations of rows.

Conditions:
No specific condition is required between the tables.

Ex.
Table X

ID	Name
1	Tom
2	Jerry

Table Y

Color
Red
Blue

*/

SELECT X.ID, X.Name, Y.Color
FROM TableX X
CROSS JOIN TableY Y;

Result:
ID	Name	 Color
1	Tom	     Red
1	Tom  	 Blue
2	Jerry	 Red
2	Jerry	 Blue


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

07-01-2025
----------
*/

select * from sys.tables;
select * from sys.columns;
select * from sys.schemas;
select * from sys.objects;
select * from INFORMATION_SCHEMA.COLUMNS;


select 
count(distinct TABLE_SCHEMA) as schemaname, 
count(distinct TABLE_NAME) as tablename, 
count(COLUMN_NAME) as columname
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME not in 
(select table_name from INFORMATION_SCHEMA.VIEWS);

select 
count(distinct s.name) as schemaname, 
count(distinct t.name) as tablename, 
count(c.name) as columnname
from sys.tables t 
inner join sys.columns c on c.object_id=t.object_id 
inner join sys.schemas s on s.schema_id=t.schema_id;


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

08-01-2025
----------
*/
 SELECT
     t.name as Tablename
     ,c.name as ColumnName
     ,ep.value as Definations

 FROM sys.extended_properties ep
    INNER JOIN sys.tables t on t.object_id = ep.major_id
    INNER JOIN sys.columns c on c.object_id = ep.major_id
                          and c.column_id = ep.minor_id
 WHERE class = 1
       and t.name in ('Product') -- This is table name

/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

09-01-2025
----------
*/

/* 
FORMAT(SUM(LineTotal), 'C0') as LT 

C (Currency): Formats the value as a currency amount, adding the appropriate currency symbol 
based on the system's locale settings (e.g., $ for the US, ₹ for India, etc.).

0: Specifies zero decimal places. For example, 1234.56 would be formatted as $1,235 (rounded to the nearest integer).
*/

-- CAST
select avg(cast(CreditRating as decimal)) from Purchasing.Vendor where ActiveFlag like 1 and PreferredVendorStatus like 1;

select OrganizationLevel, avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal)) as Age 
from HumanResources.Employee group by OrganizationLevel; 

-- FORMAT function require 2 0r 3 arguments.
-- FORMAT
select OrganizationLevel, FORMAT(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal)), 'N1' )as Age 
from HumanResources.Employee group by OrganizationLevel; 

-- To FORMAT as currency
select 
	case when MakeFlag like '1' then 'Manufactured'
		else 'Purchased' end as 'Pdt_status'
		, FORMAT(SUM(LineTotal), 'C0') as LT 
from Sales.SalesOrderDetail ss inner join Production.Product as pp on pp.ProductID=ss.ProductID
group by case when MakeFlag like '1' then 'Manufactured'
		else 'Purchased' end;

-- ROUND
    select OrganizationLevel
    ,FORMAT(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal)), 'N1' ) as Age
    ,ROUND(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal)), 1 ) as Age 
    from HumanResources.Employee group by OrganizationLevel; 


-- Case statement

select
	case when PreferredVendorStatus like '1' then 'Preferred'
		else 'Not Preferred' end as 'Preferred Status'
		, avg(cast(CreditRating as decimal)) as Average_rating
		, count (*) as CNT
	from Purchasing.Vendor
	where ActiveFlag like '1'
	group by 
		case when PreferredVendorStatus like '1' then 'Preferred'
		else 'Not Preferred' end

-- Multi case statement
select cast(min(TransactionDate)as date) as First_TD
 , convert(date, max(TransactionDate)) as Last_TD
 , case when TransactionType like 'W' then 'Work Order'
		when TransactionType like 'S' then 'Sales Order'
		when TransactionType like 'P' then 'Purchase Order'
		else null end as TransactionType
from 
(SELECT *  FROM Production.TransactionHistory
UNION
SELECT *  FROM Production.TransactionHistoryArchive) a

group by TransactionType;

/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

11-01-2025
----------


-- LIMIT Clause

The LIMIT clause is not supported in SQL Server Management Studio (SSMS) when querying SQL Server databases.
This is because LIMIT is primarily used in MySQL, PostgreSQL, and SQLite. SQL Server has its own way of achieving the same result:

- LIMIT: Used in MySQL, PostgreSQL, SQLite
- TOP: Used in SQL Server
- OFFSET and FETCH: Used in SQL Server (2012 and later) for more advanced row limiting and pagination.

*/

-- DATE & DATEDIFF

select  
case when month(BirthDate) < month ('2014-08-15') or (month(BirthDate) = month('2014-08-15') and day(BirthDate) <= day('2014-08-15'))
then datediff(year, BirthDate, '2014-08-15')
else datediff(year, BirthDate, '2014-08-15') - 1
end as Age
from HumanResources.Employee order by 1 desc;

-- Ceiling & Floor function

/*
Function	        Behavior	                                                    Example (Input: 5.8)
FLOOR	    Rounds down to the nearest integer (less than or equal to). 	            5
CEILING 	Rounds up to the nearest integer (greater than or equal to).	            6

Use Cases
FLOOR:
------
To calculate the whole number part of a division result (like truncating decimal places).
Example: Determining how many full batches can be made from a given quantity.

CEILING:
--------
To round up and ensure sufficient resources (e.g., allocating rooms or units).
Example: Calculating the number of pages required to print items if each page holds a fixed number of items.
*/

SELECT 
    FLOOR(123.45) AS FloorValue, 
    CEILING(123.45) AS CeilingValue, 
    FLOOR(-123.45) AS FloorNegative, 
    CEILING(-123.45) AS CeilingNegative;

-- OutPut
FloorValue	CeilingValue	FloorNegative	CeilingNegative
123         	124	            -124	        -123

select OrganizationLevel
,FORMAT(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal)), 'N1' ) as Age
,CEILING(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal))) as CAge
,FLOOR(avg(cast(DATEDIFF(YEAR, BirthDate, '2014-08-15') as decimal))) as CFAge
from HumanResources.Employee group by OrganizationLevel


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

14-01-2025
----------

You can use the DECLARE keyword to define a variable and assign a value using a SELECT statement.
*/

DECLARE @MaxSalary INT;
SET @MaxSalary = (SELECT MAX(salary) FROM employees);
SELECT name, salary FROM employees WHERE salary = @MaxSalary;

or 

declare @TotalRetailCustomers FLOAT;

SET @TotalRetailCustomers = (Select count(BusinessEntityID) from Person.Person Where PersonType = 'IN');

--select @TotalRetailCustomers
Select 
	cr.Name as Country
	,Format(count(Distinct p.BusinessEntityID),'N0') as CNT
	,Format(Cast(count(Distinct p.BusinessEntityID) as float)
		/ @TotalRetailCustomers,'P') as '%ofTotal'
 
from Person.Person p
	Inner Join Person.BusinessEntityAddress bea on bea.BusinessEntityID = p.BusinessEntityID
	Inner Join Person.Address a on a.AddressID = bea.AddressID
	Inner Join Person.StateProvince sp on sp.StateProvinceID = a.StateProvinceID
	Inner Join Person.CountryRegion cr on cr.CountryRegionCode = sp.CountryRegionCode
Where PersonType = 'IN'
Group by cr.Name
Order by 2 desc



/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

16-01-2025
----------
*/

-- Cast and Convert

select cast(min(TransactionDate) as date) as First_TD, convert(date, max(TransactionDate)) as Last_TD 
from 
(SELECT *  FROM Production.TransactionHistory
UNION
SELECT *  FROM Production.TransactionHistoryArchive) a


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------

09-01-2025
----------
*/

-- Having clause
select ps.CountryRegionCode from sales.SalesTaxRate ss 
right join person.StateProvince ps on ps.StateProvinceID = ss.StateProvinceID 
group by ps.CountryRegionCode, ps.StateProvinceCode having count(distinct(TaxRate)) > 1;


/*   
-------------------------------------------------------------------- x --------------------------------------------------------------------
19-02-2025

Aggregate functions VS Windows Function
---------------------------------------

- Aggregate Functions
Aggregate functions operate on a set of rows and return a single result. 
These are typically used to summarize or perform calculations over groups of data.

Key Characteristics:
Groups Data: Aggregate functions often work on grouped data, typically when combined with the GROUP BY clause.
Single Output per Group: They return one output for each group.
Examples:
COUNT(): Returns the number of rows.
SUM(): Returns the total sum of a column.
AVG(): Returns the average value of a column.
MIN()/MAX(): Return the minimum/maximum value of a column.
GROUP_CONCAT(): Returns a concatenation of values from a group.

- Window Functions (Analytic Functions)
Window functions also perform calculations over rows, but they differ in that they do not reduce 
the number of rows returned. Instead, they provide a way to compute aggregates while keeping each row's individual data intact.

Key Characteristics:
Do Not Group Data: Unlike aggregate functions, window functions work on the entire result set 
or a specific "window" (subset) of rows defined by PARTITION BY and ORDER BY clauses.
The PARTITION BY and ORDER BY clauses are used in SQL, particularly with window functions, 
to control how the data is grouped and ordered for calculations. 
They allow you to define a specific "window" or subset of rows over which a window function operates.

Retain Row-Level Detail: The result still includes all rows from the original dataset.
Examples:
ROW_NUMBER(): Assigns a unique number to each row.
RANK(): Assigns a rank to each row within a partition.
DENSE_RANK(): Similar to RANK(), but without gaps in ranking.
NTILE(): Divides the result set into a specified number of buckets.
SUM(), AVG(), MIN(), MAX() (when used as window functions).
----------
*/

--Windows Func, OVER() & PARTITION BY:

SELECT BusinessEntityID
      ,TerritoryID
      ,SalesQuota
      ,Bonus
      ,CommissionPct
      ,SalesYTD
	  ,SalesLastYear
      ,[Total YTD Sales] = SUM(SalesYTD) OVER()
      ,[Max YTD Sales] = MAX(SalesYTD) OVER()
      ,[% of Best Performer] = SalesYTD/MAX(SalesYTD) OVER()

FROM AdventureWorks2019.Sales.SalesPerson


SELECT employee_id, salary, 
       AVG(salary) OVER (PARTITION BY department ORDER BY salary) AS avg_salary
FROM employees;

/*
21-02-2025
----------

*/

--There no comma between last filed in OVER ().
-- ex. ROW_NUMBER()
select [SalesOrderID]
	  ,[SalesOrderDetailID]
	  ,[LineTotal]
	  ,sum([LineTotal]) over(partition by [SalesOrderID]) as [prdlinetotal]
	  ,ROW_NUMBER() over(partition by [SalesOrderID] order by [LineTotal]) as [Ranking]

from [AdventureWorks2019].[Sales].[SalesOrderDetail]
order by [SalesOrderID]

-- RANK() & DENSE_RANK()
select [SalesOrderID]
	  ,[SalesOrderDetailID]
	  ,[LineTotal]
	  ,ROW_NUMBER() over(partition by [SalesOrderID] order by [LineTotal] DESC) as [Ranking]
	  ,RANK() over(partition by [SalesOrderID] order by [LineTotal] DESC) as [Ranking_by_Rank]
	  ,DENSE_RANK() over(partition by [SalesOrderID] order by [LineTotal] DESC) as [Ranking_by_dense_rank]

from [AdventureWorks2019].[Sales].[SalesOrderDetail]
order by [SalesOrderID]

-- LEAD() & LAG()
SELECT [SalesOrderID]
      ,[OrderDate]
	  ,[CustomerID]
	  ,[TotalDue]
	  ,LEAD([TotalDue],1) OVER(ORDER BY [SalesOrderID]) as [LEAD_ex]
	  ,LAG([TotalDue],1) OVER(ORDER BY [SalesOrderID]) as [LAG_ex]

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
ORDER BY [SalesOrderID];



/*
26-02-2025
----------

*/

-- FIRST_VALUE()  [Its common application is to identify value based on the oldest or most recent date within a Group.]

SELECT [SalesOrderID],
	   [SalesOrderDetailID],
	   [LineTotal],
	   ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC) as Row_num,
	   FIRST_VALUE([LineTotal]) OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC) as Highest_total,
	   FIRST_VALUE([LineTotal]) OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTOTAL] ASC) as Lowest_Total


FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] 
ORDER BY 1, 3 DESC;


SELECT [CustomerID],
	   [OrderDate],
	   [TotalDue],
	   FIRST_VALUE([TotalDue]) over(PARTITION BY [CustomerID] ORDER BY [OrderDate] DESC) as Last_Amt,
	   FIRST_VALUE([TotalDue]) over(PARTITION BY [CustomerID] ORDER BY [OrderDate] ASC) as First_Amt

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] 
ORDER BY [CustomerID], [OrderDate]


-- Sub Queries
SELECT * 
FROM

(SELECT [SalesOrderID],
	    [SalesOrderDetailID],
	    [LineTotal],
	    ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] DESC) as Row_num
	   
FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] 
) as A 

WHERE Row_num=1

-- ROWS BETWEEN 

/* Rolling 3 days total */
SELECT [OrderDate],
	   Sum_totaldue,
	   SUM(Sum_totaldue) OVER(ORDER BY [OrderDate] ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as SelectLast3Days

FROM (
	SELECT [OrderDate],
		   SUM([TotalDue]) as Sum_totaldue

	FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
	WHERE YEAR([OrderDate]) LIKE 2014

	GROUP BY [OrderDate]
) A
ORDER BY [OrderDate]

/* Rolling 3 days total, not including of "Current row" */
SELECT [OrderDate],
	   Sum_totaldue,
	   SUM(Sum_totaldue) OVER(ORDER BY [OrderDate] ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) as SelectLast3Days

FROM (
	SELECT [OrderDate],
		   SUM([TotalDue]) as Sum_totaldue

	FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
	WHERE YEAR([OrderDate]) LIKE 2014

	GROUP BY [OrderDate]
) A
ORDER BY [OrderDate]

/* Rolling 3 days total, spanning 1 preceding and 1 following row */
SELECT [OrderDate],
	   Sum_totaldue,
	   SUM(Sum_totaldue) OVER(ORDER BY [OrderDate] ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING) as SelectLast3Days

FROM (
	SELECT [OrderDate],
		   SUM([TotalDue]) as Sum_totaldue

	FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
	WHERE YEAR([OrderDate]) LIKE 2014

	GROUP BY [OrderDate]
) A
ORDER BY [OrderDate]

/* Rolling 3 days average - aka, a "moving" average*/
SELECT [OrderDate],
	   Sum_totaldue,
	   AVG(Sum_totaldue) OVER(ORDER BY [OrderDate] ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as SelectLast3Days

FROM (
	SELECT [OrderDate],
		   SUM([TotalDue]) as Sum_totaldue

	FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
	WHERE YEAR([OrderDate]) LIKE 2014

	GROUP BY [OrderDate]
) A
ORDER BY [OrderDate]

/*
27-02-2025
----------

*/