use sales_analysis;
-- Ineuron intelligence channel
-- +++++++++++++++Part 38) Substring () function 
-- -- Extracts a portion of a string from text/column
-- -- syntax:
-- -- Substr(column_name,start_position,length)

Select dob,substr(dob,7,4) as dob_year
from customer_dim;

Select email,substr(email,1,length(email)) as str_email from customer_dim;
