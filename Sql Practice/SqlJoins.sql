Create database joinspractice;

use joinspractice;

create table user (
id int not null unique ,
name varchar(25),
age int);

describe user;

Insert into user(id,name,age) 
values(1,'John',21),
(2,'Helen',22),
(3,'Andrew',31),
(4,'Bob',19);

Create table orders(
id int primary key,
user_id int ,
amount float,
foreign key(user_id) references user(id));

Insert into orders(id,user_id,amount)
values(1,1,7.99),
(2,4,10.49),
(3,2,45.89),
(4,2,19.99),
(5,1,54.89);

Alter table user rename column id to c_id;
Alter table orders rename column id to o_id;
Alter table orders rename column user_id to c_id;



Select * from user;
select * from orders;

-- *********Inner join 
Select u.*,o.* from user u
inner join orders o on
u.c_id=o.c_id;

Select * from user u
inner join orders o on
u.c_id=o.c_id;


Select u.c_id,name,o.o_id from 
user u inner join orders o on
u.c_id=o.c_id;

-- **********left join
Select u.c_id,name,o.o_id from 
user u left join orders o on
u.c_id=o.c_id;

Select u.*,o.* from user u
left join orders o on
u.c_id=o.c_id;



-- *******Right join



Select u.c_id,name,o.o_id from 
user u right join orders o on
u.c_id=o.c_id;

Select u.*,o.* from user u
right join orders o on
u.c_id=o.c_id;

Select * from user u
right join orders o on
u.c_id=o.c_id;

 -- full outer join
 



