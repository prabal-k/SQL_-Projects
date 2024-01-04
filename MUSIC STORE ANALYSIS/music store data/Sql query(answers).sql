select * from album2;
select * from employee;
select * from invoice;
select * from customer;
select * from genre;
select * from invoice_line;
select * from playlist;
select * from playlist_track;
select * from track;
select * from artist order by name desc;
select * from media_type;




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

Select  distinct c.email,c.first_name,c.last_name , g.name from customer c 
inner join invoice i on i.customer_id=c.customer_id
inner join invoice_line il on i.invoice_id=il.invoice_id
inner join track t on il.track_id=t.track_id
inner join genre g on g.genre_id=t.genre_id where g.name='Rock' order by c.email;

SELECT distinct c.email,c.first_name,c.last_name  from customer c 
inner join invoice i on c.customer_id=i.customer_id
inner join invoice_line il on i.invoice_id=il.invoice_id
where track_id in (Select t.track_id from track t inner join genre g on
t.genre_id=g.genre_id where g.name like 'Rock') order by email;


-- ANSWER OF QUESTION NUMBER 2 MAY BE WRONG
-- Q2) let's invite the artist who have written the most rock music in our dataset.write a
-- query that returns the artist name and total track count of the top 10 rock bands


SELECT a.name, count(t.track_id) as c from artist a
inner join album2 al on a.artist_id=al.artist_id
inner join track t on al.album_id =t.album_id 
inner join genre g on g.genre_id = t.genre_id 
where g.name like 'rock' group by a.name order by c desc;

SELECT
    artist.name AS artist_name,artist.artist_id,
    COUNT(track.track_id) AS total_rock_tracks
FROM artist
JOIN album2 ON artist.artist_id = album2.artist_id
JOIN track ON album2.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id,artist.name
ORDER BY total_rock_tracks DESC
LIMIT 10;
 
Select artist.artist_id,artist.name,count(artist.artist_id) as number_of_songs
from track 
join album2 on album2.album_id=track.album_id
join artist on artist.artist_id=album2.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.artist_id,artist.name
order by number_of_songs desc
;



-- Q3) Return all the track names that have a song lenght longer than the average song length.
-- Return the name amd milliseconds for each track .Order by the song lenght with the longest songs 
-- listed first
 
 
 SELECT name,milliseconds from track where milliseconds >
 (Select avg(milliseconds) as avg_track_length from track) ORDER BY milliseconds desc ;
 
 
--  QUESTION SET 3- ADVANCE
-- Q1) find how much amount spent by each customer on artists ? Write a query to return
-- customer name, artist name and total spent 

Select c.customer_id,c.first_name,sum(il.quantity*il.unit_price) as spend ,a.name from customer c 
inner join invoice i on c.customer_id=i.customer_id
inner join invoice_line il on i.invoice_id=il.invoice_id
inner join track t on t.track_id=il.track_id
inner join album2 al on al.album_id=t.album_id
inner join artist a on a.artist_id=al.artist_id
group by c.customer_id,c.first_name,a.name
order by spend desc;


 