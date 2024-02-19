use sales_analysis;

Grant select
on customer_dim
to 'dummyuser';

-- now the dummyuser will have acces to sales_analysis database (only to customer_dim) table
-- and the user can perform operations to retrive data only 