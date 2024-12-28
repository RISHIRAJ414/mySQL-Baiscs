 -- CTEs --
 # CTEs (Common Table Expressions) in MySQL are temporary result sets that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
 -- They were introduced in MySQL to improve readability and modularity in SQL queries.
 
 #SYNTAX OF CTE
	-- WITH cte_name (column1, column2, ...) AS (
    -- CTE query definition
    -- SELECT ...)
    -- SELECT * FROM cte_name;
    
#Key Features
-- *Temporarily Named Result Set: CTEs allow you to name a query result and use it as if it were a table.
-- *Scope: The CTE exists only for the duration of the query in which it is defined.
-- *Each CTE focuses on a specific part of the logic, making it easier to test independently.
-- *Recursive and Non-Recursive: MySQL supports both types:
-- 1.Non-recursive CTEs define a static query result.
-- 2.Recursive CTEs allow self-referencing within the CTE.

#USES
-- 1. Simplifying Complex Queries
-- *A CTE simplifies long, nested queries by breaking them into smaller, modular parts.
-- *Example: Get products with total sales greater than 10000

-- 2. Recursive Queries (e.g., Hierarchical Data)
-- *CTEs can handle hierarchical or recursive data, such as organizational structures.
-- *Example: Find all employees under a specific manager

-- 3. Code Reusability
-- *CTEs allow reusing query logic in the same query multiple times.
-- *Example: Use the same aggregated data for multiple operations

-- 4. Improved Readability
-- *CTEs make SQL queries more readable and easier to debug.
-- *Example: Fetch top-performing students by average grade

-- 5. Temporary Aggregations
-- *Perform aggregations or transformations before applying further operations.
-- *Example: Rank employees by salary within departments

-- 6. Debugging Queries
-- *CTEs help isolate and debug parts of a query.
-- *Example: Debugging a query step-by-step


-- COMPARISON btw CTE vs SUB-QUERY -- On the basis of readability 
-- SUB-QUEREY --
select floor(avg(avg_sal)),gender
from 
(
select gender,avg(salary) avg_sal , max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
) as example_subquery 
group by gender;

-- CTE --
with cte_example as 
 (
select gender, avg(salary) avg_sal , max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from cte_example
group by gender  ;
# So basically CTE allows you a Better Format than Sub-Queries , it gives you modularity that enhances code reusability and is standard format . 
# It enhances readability . 


-- USING MULTIPLE CTE in One query --

with cte_example as 
 (
select employee_id,first_name,last_name,birth_date
from employee_demographics 
where birth_date>'1985-01-01'
),
cte_example2 as 
(
select employee_id,salary
from employee_salary
where salary>50000 
)
select *
from cte_example
join cte_example2
	on cte_example.employee_id=cte_example2.employee_id
;
#Now imagine how difficult it would be if above query was written in Sub-Query readability would be Hard so much. 
#Thatswhy CTE is prefered instead of Sub-Queries specially for a long and very complex Nested Queries . 
 
-- ONE MORE POINT WHERE WE CAN REPLACE ALIAS WITH (.....) --
-- Previous --
with cte_example as 
 (
select gender, avg(salary) avg_sal , max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics as dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from cte_example
group by gender  ;

-- After --
with cte_example (Gender,Avg_salary,Max_salary,Min_salary,Count_salary) as #Here we have removed Alias and come up with something much Better and Easy .
																		  #Just FOCUS ON THE ORDER (order of aggregation should be similar to order of column_name you want)
 (
select gender, avg(salary)  , max(salary) , min(salary) , count(salary) 
from employee_demographics as dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from cte_example
group by gender  ;
#NOTE: You can replace CTE with any Name only ( with & as ) is important before and after . 
#And also you can replace Alias by writing with in Brackets(....)as per your own Uppercase or LowerCase BUT FOCUS ON THE ORDER THE RESULT OR AGGREGATION IS PERFORMED. 



