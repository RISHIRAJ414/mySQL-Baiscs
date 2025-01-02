-- Stored Procedures --
#About
-- A stored procedure in MySQL is a precompiled collection of SQL statements and optional control-flow logic that are stored in the database and can be executed as a single unit. 
-- Stored procedures allow you to encapsulate repetitive or complex database operations into a callable object, improving efficiency and maintainability.

#Key features :
-- *Encapsulation: Combines multiple SQL statements into a reusable block. 
-- *Parameterization: Accepts input (IN), produces output (OUT), or does both (INOUT).
-- *Performance: Reduces client-server communication since the procedure executes on the server.
-- *Modularity: Encourages a structured and modular approach to database programming.
-- *Security: You can grant permissions to execute procedures without exposing the underlying tables and data.

#Syntax of a Stored Procedure
-- Basic Example:
	--DELIMITER //
	-- CREATE PROCEDURE procedure_name (IN param1 INT, OUT param2 VARCHAR(255))
	-- BEGIN
		-- SQL Statements
		-- SELECT column_name INTO param2 
		-- FROM table_name
		-- WHERE id = param1;
	-- END //
	-- DELIMITER ;
    
#Key Elements :
-- DELIMITER: Changes the command delimiter to avoid conflicts with the semicolon used within the procedure.
-- CREATE PROCEDURE: Defines the procedure.
-- Parameters:
-- *IN: Input parameter.
-- *OUT: Output parameter.
-- *INOUT: Can be used for both input and output.
-- BEGIN ... END: Marks the procedure body where you define the logic.
-- SQL Statements: Includes standard SQL queries, control structures (like IF, LOOP, etc.), and variable manipulation.

#Example Use Cases :
-- 1. Simplifying Repetitive Tasks
-- Stored procedures can be used to standardize frequently executed queries, such as fetching sales data for a specific period.
-- 2. Automating Complex Logic
-- For example, calculating bonuses for employees based on predefined rules. 
-- 3. Enforcing Business Rules
-- Encapsulate data validation and ensure consistent application of business rules.
-- 4. Reducing Network Traffic
-- Instead of sending multiple queries from the client to the server, you can send one procedure call, which executes multiple statements on the server.


select *
from employee_salary
where salary >= 50000;

-- STORING ABOVE QUERY IN STORED PROCEDURE --
-- 1.Using it with a simple query
create procedure  large_salries()
select *
from employee_salary
where salary >= 50000; #After running this query you can check the large salary table gets created after you refresh the Schemas . 

call large_salries();

-- 2.Using it with complex query or multiple query
delimiter $$ #Here we assign delimiter work from';' to '$' sign end it will work btw ( begin ___btw____ end $$ )
create procedure  large_salries2()
use 'parks_and-creation'$$;#So here we assign where this Stored Procedure might be saved. 
begin 
select *
from employee_salary
where salary >= 50000;
select *
from employee_salary
where salary >= 20000;
end $$
delimiter ;#Here we assign the delimiter work back again to ';'. 

call large_salries2(); #It is similar to the call by refrence in C-Language . 

-- APPLYING PARAMETER WITH IN PARANTHESIS --
delimiter $$ 
create procedure  large_salries4(in para1_job_role varchar(50)) #Here is a parameter which is that the output should be of Variable Character Data Type having limit of 50. 
begin 
	select first_name,last_name,occupation,salary
	from employee_salary
    where employee_salary.occupation = para1_job_role;#Improved Query,instead of using occupation=para1_job_role we use employee_salary.occupation.(Both are correct) 
end $$
delimiter ;

call large_salries4('Entrepreneur');
#NOTE: You can alter the already created Stored Procedures and can do changes in it.
#NOTE: Try to see and understand syntax if any question arises. 

select *
from employee_salary;#For checking purpose which helps a lot. 








