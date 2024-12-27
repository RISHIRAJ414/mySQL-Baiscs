-- WINDOWS FUNCTIONS -- A VERY POWERFUL FUNCTION --
# A window function in MySQL is a function that performs calculations across a set of table rows that are related to the current row. 
-- *Unlike aggregate functions, which return a single value for a group, window functions preserve the individual rows and calculate values within a specified "window" of rows.
-- *Window functions are typically used with the OVER() clause, which defines the window (i.e., the subset of rows over which the function operates).

#USES OF WINDOW FUNCTIONS :
-- Window functions are useful for calculations such as:

-- 1.Ranking Rows:
-- *Assign ranks to rows based on their values.
-- *Functions: RANK(), DENSE_RANK(), ROW_NUMBER().
-- *Example: Ranking employees by salary within each department.

-- 2.Aggregating Data Without Grouping:
-- *Calculate aggregates like SUM, AVG, or COUNT while retaining the details of individual rows.
-- *Example: Showing each employee's salary and the total salary of their department.

-- 3. Calculating Running Totals and Moving Averages:
-- *Compute cumulative sums, averages, or other metrics.
-- *Example: Showing the cumulative sales for each day.

-- 4.Comparing Rows:
-- *Calculate differences or ratios between a row and another row in the dataset.
-- *Example: Finding the difference between an employee's salary and the average salary in their department.

-- 5.Filtering and Partitioning Data:
-- *Partition data into subsets and apply calculations within each subset.
-- *Example: Assigning percentages to sales within regions.

#Syntax of a Window Function

--    <window_function>() OVER (
--    [PARTITION BY column1, column2, ...]
--    [ORDER BY column3 ASC|DESC]
--    [ROWS|RANGE BETWEEN ...] )
 #About :
-- 1.<window_function>: The specific function you want to use (e.g., SUM, RANK).
-- 2.PARTITION BY: Divides the rows into subsets (like GROUP BY).
-- 3.ORDER BY: Defines the order of rows within the window.
-- 4.ROWS or RANGE: Specifies a subset of rows relative to the current row.


-- COMAPRING WINDOWS FUNCTION WITH GROUP BY FUNCTION --
# Using Group By Function
select gender,floor(avg(salary)) avg_salary
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id
group by gender ;

#Using Windows Function
select dem.first_name, dem.last_name,sal.salary,gender,avg(salary)
over (partition by gender) #Here you can easily get any column without writing it again as you did in Group By.
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;

select dem.first_name, dem.last_name,gender,sal.salary,sum(salary)
over (partition by gender order by dem.employee_id) as Rolling_Total #Here we performed Rolling Table. 
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;
# In above query this dem.first_name,dem.last_name,sal.salary are independent because they do not have to go through Group By . 
# Here you also get each and every row of particular column while in group by you will get only the unique value of that particular column after performing aggregation. 


select dem.first_name, dem.last_name,gender,sal.salary,dem.employee_id,
row_number () over() #Here row_number is also a kind of Aggregate function which provides a row(1,2,3,4,5.............)
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;

select dem.first_name, dem.last_name,gender,sal.salary,dem.employee_id, 
row_number () 
over(partition by gender order by salary desc) #Here row_number is based on the partition by gender 
						 -- thatswhy it has particular row for both gender(male and female or row for every distict values in gender column which is also grouped by)
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;

select dem.first_name, dem.last_name,gender,sal.salary,dem.employee_id, 
row_number () over(partition by gender order by salary desc) ,
rank () over(partition by gender order by salary desc) #Here it provide ranking on the basis or on the partition + order by salary in desc . 
													-- But there is a limitation while repeating it doesnot work as a Row it skips the number next to the repeating one. 
                                                    -- So, therefore we use Dense_rank . Which provides you ranking in form of Row even after repeatition of rankings.
                                                    -- BASICALLY IT WORKS POSTIONALLY INSTEAD OF NUMERICALLY . 
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;

select dem.first_name, dem.last_name,gender,sal.salary,dem.employee_id, 
row_number () over(partition by gender order by salary desc) ,
rank () over(partition by gender order by salary desc),
dense_rank () over(partition by gender order by salary desc)
  #Here above we have used dense_rank () 
-- Which overcomes the limitation of rank() in which if repeating rankings occur it doesnot work as a Row it skips the number next to the repeating one. 
# Basically DENSE_RANK () PROVIDES THE RANKING NUMERICALLY NOT POSITONALLY . 
from employee_demographics as dem
join employee_salary  sal
on dem.employee_id=sal.employee_id;










