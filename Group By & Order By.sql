-- GROUP BY -- + -- AGGREGAE CALCULATIONS --

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
order by salary desc;

select occupation ,  count(occupation) 
from employee_salary
group by occupation 
order by occupation desc;

# Plese try and test with this query in order to understand more clearly and also predict the outcome before running the query.

