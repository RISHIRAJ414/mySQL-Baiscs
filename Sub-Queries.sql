-- SUB-QUERY --
#  A subquery in MySQL is a query nested inside another SQL query. 
-- It is used to perform operations that involve fetching intermediate data that can then be utilized by the main query. 
-- A subquery can be placed within a SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery.
-- In many cases JOINS are better than this . 

# Uses of Subqueries in MySQL:
-- 1.Filtering Data: 
-- *Subqueries are commonly used in WHERE clauses to filter records based on complex criteria. 
-- *For example, selecting rows where a column matches values returned by the subquery.

-- 2.Calculating Aggregate Values: 
-- *Subqueries can help calculate aggregate functions like SUM, AVG, or COUNT and compare them to columns in the main query.

-- 3.Correlated Subqueries:
-- *A subquery that references columns from the outer query, allowing dynamic filtering based on the main query's data. 

-- 4.Data Manipulation: 
-- *Subqueries can be used in INSERT, UPDATE, and DELETE operations to insert data based on the result of another query.

# Benefits of Using Subqueries:
-- *Modularity: Subqueries allow you to break complex problems into smaller, manageable queries.
-- *Simplicity: They make queries easier to read and understand when compared to using complex joins in some cases.
-- *Flexibility: Subqueries can be used in various parts of SQL statements (e.g., SELECT, FROM, WHERE).

# Limitations:
-- *Performance: Subqueries, especially correlated ones, can be less efficient than JOIN operations for large datasets.
-- *Nested Complexity: Deeply nested subqueries can make queries harder to debug and maintain.


-- SUB-QUERY USED FOR FILTERING DATA -- SUB-QUERY NESTED OF DIFFERENT COLUMNS FROM DIFFERENT TABLES .   
select first_name,employee_id
from employee_demographics
where employee_id in
	( select employee_id
    from employee_salary
    where dept_id=1
    );

select first_name,last_name,employee_id,salary
from employee_salary
where dept_id in
	( select department_id
    from parks_departments
    where department_id=4
    );


-- SELECT SUB-QUERY -- (nested select statement) + SUB-QUERY USED FOR CALCULATING AGGREGATE VALUES . 
select *
from employee_salary
where salary>( select avg(salary)from employee_salary)
;

select first_name,last_name,employee_id,salary, avg(salary) #Just for checking purpose.  
from employee_salary
group by first_name,last_name,salary,employee_id; #Here we have used group by for performing Aggreagate Calculations. 


-- PERFORMING AGGREGATE ON ANOTHER AGGREGATE USING SUB-QUERIES --
select gender, avg(age),max(age),min(age),count(age) #This query is just for checking purpose . 
from employee_demographics
group by gender;

select gender , avg(`max(age)`)as avg_of_max_age #Here in brackets we have used sign (` `) which is called Backticks which is on left side of your 1 key.
                              -- NOTE: You can replace them with alias .
							  -- Backtick Uses: In MySQL: 
							  -- *Used to enclose database identifiers such as table names, column names, or database names. 
                              -- *This is helpful when identifiers contain special characters, spaces, or conflict with SQL reserved keywords.
from(select gender, 
avg(age),
max(age),
min(age),
count(age)
from employee_demographics
group by gender)as Agg_Age
group by gender ; #Group by gender ( on the basis of gender )
#Here we had done the another Aggregate Calculation for another Aggregated Calculation ( Done the AVG() of MAX(AGE)-Average age of Max age-). Using Backtick sign. 

-- REPALACING (` `) WITH ALIAS --
select gender , avg(max_age)as avg_of_max_age
from(select gender, 
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_agae,
count(age) as count_age
from employee_demographics
group by gender)as Agg_Age
group by gender ; 
#Practice this and perform Trial & Check . 

# IMPORTANT POINTS TO FOCUS OR NOTICE :
-- 1. Use Backtick sign (` `)for doing Aggregate for another Aggregate or you can just Alias them with another name. 
-- 2. You have to provide Group by for outer query as well as for inner query. 
-- 3. Using subquery is very simple if you made the Inner Query first and then Nest it into the Outer Query(Do or Solve INNER QUERY FIRST)+(Pen and Paper is helpful).
-- 4. Also you have to assign another name or will have to use alias.  
-- 5. Focus on Operator and Operand while using subquery. 









