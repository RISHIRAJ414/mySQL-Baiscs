-- GROUP BY -- + -- AGGREGAE CALCULATIONS --

-- GROUP BY -- 
-- *In MySQL, the GROUP BY clause is used to organize data into groups based on one or more columns. 
-- *It is commonly used in conjunction with aggregate functions (such as COUNT(), SUM(), AVG(), MAX(), or MIN()) to perform calculations on each group of data.
#Reasons for Using GROUP BY:
-- 1.Aggregation of Data:
-- *It helps in summarizing large datasets into meaningful groups.
-- *For example, calculating the total sales for each product or finding the average salary for each department.

-- 2.Data Analysis:
-- *It enables analyzing and comparing different categories or groups within the data.

-- 3.Improved Readability:
-- *Provides a structured and organized view of the data, making it easier to understand trends and patterns.

-- 4.Combining with Filters:
-- *When used with the HAVING clause, it allows filtering groups based on aggregate values.
-- *For example, finding departments with an average salary above a threshold(Target).

-- 5.Supporting Advanced Calculations:
-- *It facilitates performing advanced calculations that would otherwise require complex queries or subqueries.

-- 6.Data Segmentation:
-- *It helps in segmenting data into logical groups, which can then be used for further analysis or visualization.

-- Important Points to Note:
-- *Order of Execution: The GROUP BY clause groups rows after the WHERE clause is applied but before the HAVING and ORDER BY clauses.
-- *Columns in SELECT: When using GROUP BY, any columns in the SELECT clause that are not part of an aggregate function must also appear in the GROUP BY clause.


Select *
from employee_demographics;

Select *
from employee_salary;

select gender , min(age) , max(age) , count(age) , avg(age)
from employee_demographics
group by gender;
# NOTE : select ____ and group by ___ should be same. Here 'gender' in this case . 
# Here min, max , count , avg are the aggregate calculations . 

select occupation , min(salary) , max(salary) , avg(salary) , count(occupation)
from employee_salary
group by occupation;

select occupation , count(occupation)
from employee_salary
group by occupation;

# Please try and test with this query in order to understand more clearly and also predict the outcome before running the query.

-- ORDER BY --

select *
from employee_demographics
order by first_name asc;

select *
from employee_demographics
order by first_name desc;

#Order by is basically used for ordering or sorting in either descending or ascending.

select *
from employee_demographics
order by gender,birth_date  asc;

#Here we first got the gender in ascending order that is female first and male second and then we got birth date in ascending of first the female and then the male. 
#And it also depends on what you want to order by first if in this case you will write gender after birth_date then gender will not be ordered by first . 

select occupation , salary, max(salary) , min(salary) , avg(salary) , sum(salary) 
from employee_salary
group by  salary,occupation 
having max(salary)>45000
order by salary desc;

select occupation ,  count(occupation) 
from employee_salary
group by occupation 
order by count(occupation) desc;

# Plese try and test with this query in order to understand more clearly and also predict the outcome before running the query.

