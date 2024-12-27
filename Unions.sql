-- UNIONS --
#In MySQL, UNION is used to combine the results of two or more SELECT queries into a single result set.

-- Key Points:
-- *The number of columns and their data types in all SELECT queries must match.
-- *By default, UNION removes duplicate rows from the final result. If you want to include duplicates, use UNION ALL.
-- *The columns in the final result set will have the same names as those in the first SELECT query.

-- Uses of UNION in MySQL:
-- 1.Combining Data from Multiple Tables:
-- *Useful when you need a combined dataset from multiple tables with similar structures.
-- *Example: Merging product lists from different regions or departments.

-- 2.Handling Different Query Conditions:
-- *When you have different conditions for retrieving data, you can use UNION to combine the results.

-- 3.Merging Data from Subqueries:
-- *Combine the results of complex subqueries.
-- *Example: Aggregated sales data for different years.

-- 4.Data Deduplication:
-- *By default, UNION removes duplicates, making it useful for deduplication.
-- *But if you want Duplicate Rows too then you can use UNION FULL in order to include all duplicate values(row).

-- 5.Creating Reports:
-- *Combine various sources of data into a single report, e.g., combining sales data from two different years.


select first_name,last_name
from employee_demographics
UNION 
select first_name,last_name
from employee_salary;

select first_name,last_name
from employee_demographics
UNION ALL #Includes all duplicates rows also. 
select first_name,last_name
from employee_salary;

select first_name,last_name,'Old Man' as Label #Here we have added a new column 'Old' as Label. 
from employee_demographics
where age>40 and gender='male'
union
select first_name,last_name,'Old Lady' as Label 
from employee_demographics
where age>40 and gender='female'
union 
select first_name,last_name,'Highly paid Employee' as Label
from employee_salary
where salary > 70000
order by first_name,last_name;#Here we have done order by to bring the same name people in order,you can check the preview  Before & After by removing last line.
                              #NOTE:Perfrom order by to get the data in proper view and for better understanding.

                              





