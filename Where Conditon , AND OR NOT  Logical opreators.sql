-- WHERE CLAUSE--

select *
from employee_salary
where first_name='leslie';

select *
from employee_salary
where salary >= 60000 or salary <40000;

select *
from employee_demographics
where age < 40;

select *
from employee_demographics
where gender != 'female';
#Here != sign means( not equals to )

-- AND  OR  NOT -- LOGICAL OPERATORS
#Logical operators in SQL are used to combine or evaluate conditions in a query, allowing you to refine the data returned based on multiple criteria. The primary logical operators are:
#1. (AND)Combines multiple conditions and returns results where all conditions are true.
#2. (OR) Combines conditions and returns results where at least one condition is true.
#3. (NOT) Negates a condition; returns results where the condition is false.
#4. (Combination of Logical Operators) Logical operators can be combined, and parentheses () are used to control the order of evaluation. 

-- AND OPERATOR --
select *
from employee_demographics
where age < 40
and gender = 'male';

select *
from employee_demographics
where age < 40
and not gender = 'male';

-- OR OPERATOR --
select *
from employee_demographics
where age < 35
or gender = 'male';

select *
from employee_demographics
where age < 35
or not gender = 'male';

-- COMBINATION OF OPERATORS --
Select *
from employee_demographics
where (first_name='leslie' and age = 44 )or age > 55;
#Here both conditions are correct.

Select *
from employee_demographics
where (first_name='leslie' and age = 40 )or age > 55;
#Only one condition is correct.

-- LIKE Statement --
-- % and _ (sign used) You can also use them combined
#Here % is for (if contains) but _ is for (specific).

Select *
from employee_demographics 
where first_name like 'a%';
# It gives me all names starting from 'a'.

Select *
from employee_demographics 
where first_name like '%a%';
# It gives me all name containing 'a' beacause we put % a % before and after .

Select *
from employee_demographics 
where first_name like '%a';
# It gives me all names ending on 'a'.

#So,basically if you put % sign at the begining it will search it will search all values that ends on 'a'.
#If you put % sign at the end it will search it will search all values that starts from 'a'.
#And if you put % sign at the both side it will search it will search all values that contains 'a'.
-- NOTE : There should be no space between the % and the word . 

Select *
from employee_demographics 
where first_name like 'a__';
# It gives me all names specific with 3 letters and starts with 'a'. Hence resulting table is 'Ann'.

Select *
from employee_demographics 
where first_name like 'a___';
# It gives me all names specific with 4 letters and starts with 'a'. Hence resulting table is 'Andy'.

Select *
from employee_demographics 
where first_name like 'a___%';
# It gives me all names specific with including 4 letters and whatever comes after that and also starts with 'a'. Hence resulting table is 'April' and 'Andy'.

Select *
from employee_demographics 
where birth_date like '198_%';
# Plese try and test with this query in order to understand more clearly and also predict the outcome before running the query.






