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



