select * from album2;
select * from employee;
select * from invoice;
select * from customer;
select * from genre;
select * from invoice_line;
select * from playlist;



-- EASY QUESTIONS
-- 1) Who is the senior most employee based on job title ?
 
SELECT first_name,last_name,title ,max(levels) as m from employee
group by title,first_name,last_name order by m desc;

Select * from employee order by levels desc limit 1;

-- 2) Which countries have the most invoices ?

select billing_country,count(billing_country) as most_invoice from invoice
group by billing_country order by most_invoice desc limit 5;


-- 3) what are the top 3 values of total invoice

SELECT total FROM invoice order by total desc limit 3;

-- 4) Which city has the best customers?We would like to throw a promotional music festival
-- in the city we made the most money.Write a query that retuen one city that has the highest sum 
-- of invoice totals.Return both the city name ans sum of all invoice totals

SELECT c.city,sum(i.total) as sum from customer c inner join
invoice i on c.customer_id=i.customer_id group by c.city order by sum desc limit 1 ;


-- 5)Who is the best customer ? The customer who has spent the most money will be decalred the best customer.
-- Write a quey that returns the person who has spent the most money.


Select c.customer_id,c.first_name,c.last_name, sum(i.total) as money_spend from customer c
inner join
invoice i on c.customer_id=i.customer_id group by c.first_name,c.customer_id,c.last_name
order by money_spend desc limit 1;


-- QUESTION SET-2 [MODERATE]

--  Q1) Write query  to return email,first name ,lastname and genre of all rock music listner .Return your
--  list ordered alphabetically by email starting with A.