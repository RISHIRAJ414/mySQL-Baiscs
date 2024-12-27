-- STRING FUNCTIONS --
#Common String Functions in MySQL
-- 1.LENGTH()
-- *Returns the length of a string (in bytes).

-- 2.CHAR_LENGTH()
-- *Returns the number of characters in a string (different from LENGTH() for multi-byte characters).

-- 3.CONCAT()
-- *Concatenates (joins) two or more strings into one.

-- 4.CONCAT_WS()
-- *Concatenates strings with a separator.

-- 5.UPPER() and LOWER()
-- *Converts a string to uppercase or lowercase.

-- 6.TRIM()
-- *Removes leading and trailing spaces from a string.

-- 7.LTRIM() and RTRIM()
-- *Remove leading or trailing spaces, respectively.

-- 8.SUBSTRING() (or SUBSTR())
-- *Extracts a substring from a string.

-- 9.LOCATE()
-- *Finds the position of a substring in a string (case-sensitive).

-- 10.REPLACE()
-- *Replaces all occurrences of a substring with another substring.

-- 11.REVERSE()
-- *Reverses a string.

-- 12.LEFT() and RIGHT()
-- *Extracts a specified number of characters from the beginning (LEFT()) or end (RIGHT()) of a string.

-- 13.FORMAT()
-- *Formats a number as a string with a specified number of decimal places.

#Uses of String Functions
-- 1.Data Cleaning and Transformation:
-- *Removing unnecessary spaces (TRIM(), LTRIM(), RTRIM()).
-- *Formatting text to a consistent case (UPPER(), LOWER()).

-- 2.String Searching:
-- *Finding substrings within strings (LOCATE(), INSTR()).

-- 3.Data Presentation:
-- *Concatenating strings for better readability (CONCAT(), CONCAT_WS()).
-- *Formatting numbers (FORMAT()).

-- 4.Text Extraction:
-- *Extracting parts of strings (SUBSTRING(), LEFT(), RIGHT()).

-- 5.Text Substitution:
-- *Replacing unwanted characters or text (REPLACE()).

-- 6.Debugging and Analysis:
-- *Analyzing text data by finding lengths (LENGTH(), CHAR_LENGTH()).
-- *Identifying patterns or substrings (LOCATE()).

-- 7.Creating Dynamic Queries:
-- *Constructing dynamic SQL queries using concatenation (CONCAT()).


-- LENGTH --
select length('Namaste');

select 'Namaste',length('Namaste');

select first_name,length(first_name)
from employee_demographics
order by first_name;

select first_name,length(first_name)
from employee_demographics
order by 2; 
#This type of query is used to check the phone number whether the contanct no is of 10 digits or not. And at the related cases you can use it for checking Data Quality.alter


-- UPPER & LOWER CASE --
select 'namaste',upper('namaste');

select first_name,upper(first_name)
from employee_demographics; #Gives you all characters in Upper Case.

select lower('NAMASTE'); #Gives you all characters in Lower Case.

select first_name,lower(first_name)
from employee_demographics; #Gives you all characters in Lower Case.


-- TRIM --
select ('       Namaste      ')as greetings; 
select trim('       Namaste      ')as greetings; #Removes leading and trailing spaces from a string.
select ltrim('              Namaste')as greetings; #Removes leading and trailing spaces from left side of a string.
select rtrim('Namaste              ')as greetings; #Removes leading and trailing spaces from right side of a string.
#You can try and test here by changing the TRIM options or you can just switch it and then see the difference btw. Before & After.


-- Text Extraction using SUBSTRING , LEFT() , RIGHT() --
select first_name,substring(first_name,3,2) ,# Here it gives you the next two substring character starting from 3rd character(Including the 3rd character).
birth_date,substring(birth_date,6,2)as Birth_Month # Here we get the month of their birth date using substring() function. 
from employee_demographics;
# This SUBSTRING fuction is Extremely Useful. 

select first_name,left(first_name,4)
from employee_demographics;
# It extracts the substring of 4 characters from the left in this case. 

select first_name,right(first_name,4)
from employee_demographics;
# It extracts the substring of 4 characters from the right in this case. 

select first_name,right(first_name,4),left(first_name,4),
reverse(left(first_name,4))as reverse_left, 
reverse(right(first_name,4))as reverse_right,
birth_date,substring(birth_date,6,2)as birth_month,
upper(reverse(left(first_name,4)))Upper_reverse_left,
lower(reverse(left(first_name,4)))Lower_reverse_left,
upper(reverse(right(first_name,4)))Upper_reverse_right,
lower(reverse(right(first_name,4)))Lower_reverse_right
from employee_demographics;
#Professional style of writing query.Including many cases in one query. 
#Just for Practice .  






















