-- Limit & Aliasing --

#Key Points About LIMIT
-- 1.Restrict the Number of Rows:
-- LIMIT specifies the maximum number of rows to return.
-- 2.Combined with OFFSET for Pagination:
-- OFFSET is used alongside LIMIT to skip a specific number of rows before starting to return rows.
-- 3.Order Matters:
-- To ensure consistent results, use ORDER BY with LIMIT.

select *
from employee_demographics
order by age desc
limit 3;

select *
from employee_salary
order by salary desc
limit 5;
# Here you can get top N Aggregate by just using ORDER BY and LIMIT on the basis of what you want Top N or Low N. 

select *
from employee_salary
order by salary desc
limit 3,1 ;
# Here 3,1 means getting the one row after 3 rows . The numbers of rows in the output depends on the number after the , comma. 
# You can test it by changing the numbers . 

select *
from employee_salary
order by salary asc
limit 5;
#Please try and test with this query in order to understand more clearly and also predict the outcome before running the query.

#Key Points About ALIASING
-- Types of Aliases
-- 1.Column Alias: Renames a column in the query result.
-- 2.Table Alias: Renames a table within the query, often to make it easier to reference.

-- It is also used in Joinings of the Tables. 
-- *Table Aliases
-- Purpose: To assign a shorter or alternative name to a table in the query, which is especially useful when:
         -- Joining multiple tables.
		 -- Avoiding ambiguity in queries involving tables with similar column names.
         
select  first_name , avg(age) as Average_age
from employee_demographics 
group by first_name
having Average_age > 40
order by avg(age)desc
limit 5;
 
 # You can also do above like this in below without typing 'as'. 
 
 select  first_name , avg(age)Average_age
from employee_demographics 
group by first_name
having Average_age > 40;
 