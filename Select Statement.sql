SELECT *
FROM parks_and_recreation.employee_demographics;


select salary,
birth_date,
age,
(age + 10)*10+10, # PEMDAS(Parentheses, Exponents, Multiplication/Division, Addition/Subtraction) This concept has been used it here : (age + 10)*10+10
occupation 
FROM employee_salary,employee_demographics;
# We have written our query in rows fomat because its better...
