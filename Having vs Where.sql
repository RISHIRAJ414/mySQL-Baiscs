select gender, avg(age)
from employee_demographics 
group by gender
having avg(age) > 30;

-- Why we use Having instead of Where while using Group by query --
#Difference Between WHERE and HAVING
#WHERE Clause:
#1. Filters rows before the grouping is performed.
#2. Cannot use aggregate functions because the data has not been grouped yet.
-- while --
#HAVING Clause:
#1. Filters groups after the grouping and aggregate functions have been applied.
#2. Specifically designed to work with aggregate functions like SUM, AVG, COUNT, etc.

select occupation , avg(salary)
from employee_salary
where occupation like'%manager%' # Here we have filtered at the Row level.
group by occupation
having avg(salary)>55000; # Here we have filtered at the Aggregate level.
# Here we have used both Having and Where in one query. 

# NOTE : 
-- WHERE Clause --
#1. Filters rows before the grouping is performed. (Always comes before Group by)
#2. Cannot use aggregate functions because the data has not been grouped yet.

-- HAVING Clause --
#1. Filters groups after the grouping and aggregate functions have been applied. (Always comes after Group by)
#2. Specifically designed to work with aggregate functions like SUM, AVG, COUNT, etc.

