-- JOINS --
#Types of Joins in MySQL
-- 1.INNER JOIN
-- 2.LEFT JOIN (LEFT OUTER JOIN)
-- 3.RIGHT JOIN (RIGHT OUTER JOIN)
-- 4.FULL JOIN (FULL OUTER JOIN) (Not directly supported in MySQL but can be emulated)
-- 5.CROSS JOIN
-- 6.SELF JOIN

-- INNER JOIN --
-- 1.Combines rows from two tables where the join condition is met (matching rows).
-- 2.Non-matching rows are excluded.

select *
from employee_demographics
inner join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id;

select *
from employee_demographics as dem #Here we have used Alias in order to  make it easier to reference.
inner join employee_salary as sal #Here we have used Alias in order to  make it easier to reference.
	on dem.employee_id = sal.employee_id;
    
select sal.employee_id,age,occupation,salary
from employee_salary as sal
inner join  employee_demographics as dem 
	on dem.employee_id = sal.employee_id;    
#NOTE: If any column is similar in both table then we have to assign it with the Table Name or you can use Alias for making it easier to refrence.alter   

-- OUTER JOINS --
-- 1. LEFT JOIN (LEFT OUTER JOIN)
-- Returns all rows from the left table and matching rows from the right table.
-- Non-matching rows in the right table are filled with NULL.
-- 2. RIGHT JOIN (RIGHT OUTER JOIN)
-- Returns all rows from the right table and matching rows from the left table.
-- Non-matching rows in the left table are filled with NULL.

select *
from employee_salary as sal
right join  employee_demographics as dem 
	on dem.employee_id = sal.employee_id; 
    
select *
from employee_demographics as dem
right join   employee_salary as sal
	on dem.employee_id = sal.employee_id; 

select *
from employee_salary as sal
left join  employee_demographics as dem 
	on dem.employee_id = sal.employee_id;     

select *
from employee_demographics as dem
left join   employee_salary as sal
	on dem.employee_id = sal.employee_id; 
 # Try to predict the outcome of above 4 queries(All possible cases of Left join and Right join). 

-- SELF JOIN --
-- A table is joined with itself. Used when comparing rows within the same table.
-- Common Use Cases for Self-Joins
-- 1.Hierarchical Data
-- Scenario: Represent relationships like manager-employee, parent-child, or category-subcategory.
-- 2. Finding Duplicates
-- Scenario: Identify duplicate entries in a table based on specific columns.
-- 3. Comparing Rows
-- Scenario: Compare rows to find mismatches or relationships.

select emp1.employee_id as em1_ID ,
emp1.first_name as em1_First_Name,
emp1.last_name as em1_Last_Name ,
emp2.employee_id as em2_PartnerID ,
emp2.first_name as em2_PartnerFirst_Name ,
emp2.last_name as em2_PartnerLast_Name 
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id  = emp2.employee_id +1;
    
-- Joining Multiple Tables Together (Compound Join or Complex Join)    
    
select *
from employee_salary as sal
inner join  employee_demographics as dem 
	on dem.employee_id = sal.employee_id
inner join parks_departments as pd
	on sal.employee_id=pd.department_id;
#Here since employee demographics doo not have any common column with parks_department but we still joins them because :
-- employee_demographics entitles 'employee_id' which is common with 'employee_id' column in employee_salary table AND
-- employee_salary entitles 'salary' which is common with 'salary' colummn in the parks_department table. 
-- AND THIS IS HOW WE JOINED MULTIPLE TABLES. 
select *
from parks_departments;





