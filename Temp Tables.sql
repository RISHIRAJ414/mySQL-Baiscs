-- TEMP TABLES --
#About
-- Temporary Tables in MySQL, often referred to as "temp tables." 
-- Temporary tables are a feature in MySQL used to store intermediate results temporarily during a session. 
-- Once the session ends or the table is explicitly dropped, it is automatically removed.  
-- A temporary table is created using the CREATE TEMPORARY TABLE statement.
-- These tables are only visible to the session in which they are created, meaning other sessions cannot access them.

#Syntax
--    CREATE TEMPORARY TABLE temp_table_name (
--    column1 datatype,
--    column2 datatype,
--    ...  );

#Key Characteristics
-- 1.Session-Specific: Each session has its own temporary tables. Even if multiple sessions create a temporary table with the same name, they are isolated.
-- 2.Automatically Dropped: When the session ends, the temporary table is automatically dropped.
-- 3.Manual Drop: You can explicitly drop a temporary table using:
--   *Syntax : DROP TEMPORARY TABLE temp_table_name;
-- 4.Indexing: Indexes can be created on temporary tables.
-- 5.Storage: Temporary tables are stored in memory or disk depending on their size and the configuration of MySQL.

#Uses of Temporary Tables
-- Temporary tables are used in scenarios requiring intermediate processing or data transformation. Common use cases include:

-- 1.Storing Intermediate Query Results
-- *Example: Aggregating data for a report and then performing further calculations.
-- 2.Breaking Complex Queries into Manageable Steps
-- *Example: For a complex join query, you can store intermediate results in a temporary table to simplify debugging and improve performance.
-- 3.Avoiding Multiple Joins
-- *Temporary tables can be used to store data that will be used multiple times in a session, reducing the need for repeated joins or subqueries.
-- 4.Data Transformation
-- *Example: Applying transformations or calculations on raw data before final processing.
-- *Syntax : CREATE TEMPORARY TABLE temp_transformed_data AS
--           SELECT *, (price * quantity) AS total_value
--           FROM orders;
-- 5.Testing and Debugging
-- *Developers use temporary tables to test logic or troubleshoot SQL scripts without impacting permanent tables.
-- 6.Storing Data for Batch Processing
-- *Temporary tables are useful in batch processes where intermediate results need to be saved temporarily during the execution of scripts.
-- 7.Handling Datasets from External Sources
-- *Data imported from external sources can be stored in a temporary table for validation and cleaning before inserting it into permanent tables.

#Limitations
-- *Temporary tables cannot be shared across sessions.
-- *Their existence is tied to the session that created them.
-- *Overuse of temporary tables may lead to performance issues, especially with large datasets or limited server memory.


#Methods of creating Temporary Tables :
-- 1.Method

create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_fast_food varchar(50)
);
select *
from temp_table;

insert into temp_table
values('Rishi', 'Raj','Samosa');

select *
from temp_table; 

-- 2.Method -- More popular and professional
select*
from employee_salary;

create temporary table  salary_above_50k  #Here we made a temporary table of employee_salary as salary_above_50k. It also includes an aggregate. 
as
select*
from employee_salary
where salary >= 50000;

select*
from salary_above_50k;
#NOTE:It lasts as long as you are in the session.
-- *Means you can USE IT IN ANOTHER OR NEW WINDOW(sql tab) BUT IF YOU CLOSED THE SESSION(mysql application)and reopen or reastarted it,
-- your TEMP FILE WONT WORK IN ANOTHER SESSION ( Until you run that create temporary table query again ). 
-- *Also try use alias in order to be professional as there can 100s or 1000s of Temporary Tables in real life scenario based data sets.




