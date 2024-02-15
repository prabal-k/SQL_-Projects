use sales_analysis;
-- Ineuron intelligence channel
-- String functions are : length,replace,substr,lower,upper,mid,concat,instr,left,right,trim,

-- +++++++++++++++Part 38) Substring () function 
-- -- Extracts a portion of a string from text/column
-- -- syntax:
-- -- Substr(column_name,start_position,length)

Select dob,substr(dob,7,4) as dob_year
from customer_dim;

Select email,substr(email,1,length(email)) as str_email from customer_dim;

-- +++++++++++++++Part 39) trim () function
--  Trims or removes the white spaces from start and end of the column / string
-- syntax: 
-- trim(column_name)

Select '           Name   'as nam,length('           Name   ') as name_length ,trim('           Name   ') as trimmed_name;


-- Numeric functions starts from here
-- performs operation on numeric columns/numeric data

-- +++++++++++++++Part 40) abs () function
-- converts -ve value into +value or give absolute value of the column
-- for eg: if a price column consist of -ve value
-- Syntax:
-- abs(column_name)

-- +++++++++++++++Part 41) mod () function
-- Returns the remainder of particular division
-- Syntax:
-- mod(dividend,divisor) 
-- for eg:
-- mod(19,4) then output will be 3


-- +++++++++++++++Part 44) limit () and offset() function
-- Display subset of the output
-- limit = filters the top n rows 
-- for eg:
-- if limit 30 then display only top 30 rows and skips other
-- offset=skip the top n rows
-- for eg:
-- if offset 30 then skip the rop 30 rows and display other rows
-- (in mysql i am not being able to use offset without using limit)

Select * from order_dim;
Select cust_id,order_id,total_amount_paid from order_dim 
order by total_amount_paid desc limit 5 offset 2;


-- +++++++++++++++UNION AND UNION ALL OPERATOR
-- combine the results of 2 or more select statements
-- Every select statement with union must have same no of columns and the columns must also have similar data types
-- Union =removes the duplicate rows from the combined result set and ensure only unique value are in the final output
-- Union all=includes all rows inculding the duplicate ones

Select * from customer_dim;
desc customer_dim;
select * from delivery_person_dim;
desc delivery_person_dim;

Select phone from customer_dim
union 
select delivery_person_id from delivery_person_dim order by phone ;








