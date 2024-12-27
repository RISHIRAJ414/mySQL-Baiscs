-- Case Statements --
#  In MySQL, the CASE statement is used to implement conditional logic in SQL queries. 
-- It allows you to apply different operations or return different values based on certain conditions, much like an (if-else) statement in programming.

#Use cases of CASE STATEMENT:
-- 1. Dynamic Column Values in Queries
-- *Use CASE to calculate or transform data in a query.
-- *Example: Classify orders as "High", "Medium", or "Low" based on their amount.

-- 2. Conditional Aggregation
-- *Apply different aggregation rules based on conditions.
-- *Example: Count active vs. inactive users in a single query.

-- 3. Custom Sorting
-- *Change the sort order dynamically.
-- *Example: Prioritize sorting by specific categories or conditions.

-- 4. Conditional Filtering
-- *Use CASE within WHERE clauses to apply complex filtering.
-- *Example: Filter employees based on job title and salary thresholds.

-- 5. Creating Flags
-- *Add binary flags or markers based on specific conditions.
-- *Example: Flag overdue invoices.

-- 6. Dynamic Updates
-- 8Use CASE in UPDATE statements to set column values conditionally.
-- *mple: Update employee bonuses based on performance ratings.

-- 7. Default Value Handling
-- 8Provide default values when dealing with NULL or missing data.
-- *Example: Replace NULL values with default strings.

-- 8. Conditional Joins
-- *Use CASE to create dynamic join conditions.
-- *Example: Adjust joins based on specific business rules.

-- 9. Pivoting Data
-- *Transform rows into columns for reporting.
-- *Example: Group sales data by month and calculate totals conditionally.

-- 10. Validation and Error Checking
-- *Implement basic validation checks in queries.
-- *Example: Detect and label invalid data.

-- 11. Calculating Ranges or Buckets
-- *Categorize data into buckets for analysis.
-- *Example: Group ages into ranges like "Youth", "Adult", and "Senior".

-- 12. Multi-Language or Locale Support
-- *Return values in different languages or formats based on input conditions.

#Key Points
-- *CASE must end with END.
-- *The ELSE part is optional; if not provided, and no condition is matched, NULL is returned.
-- *You can use CASE in various SQL clauses, such as SELECT, WHERE, ORDER BY, and HAVING.


select first_name,last_name,age,
case 
	when age<=30 then'young'
    when age between 31 and 50 then 'Old'
    when age >= 50 then 'Retirement Time'
end as age_bracket
from employee_demographics;

#Lets work on a scenario
-- PAY INCREASE AND BONUS --
-- if salary < 50000 = 5% increament in salary
-- if salary > 50000 = 7%  increament in salary
-- finance = 10 % Bonus 

select *
from employee_salary;

select first_name,last_name,occupation,salary,
case 
	when salary<50000 then salary + (salary*0.05)
    when salary>50000 then salary * 1.07 #Here salary * 1.07 is same as  salary + (salary*0.07). Its simple maths .
end as New_salary,
case
	when dept_id='6' then salary * 1.10 #Here dept_id '6' is the finance which is in the parks_department.department_name which we have just checked below. 
    end as Bonus
from employee_salary;
#Add multiple cases in one query in order to be professional. 

#Here we have checked what is the dept_id of Finance. 
select *
from employee_salary;
select *
from parks_departments;

    

















































