-- GROUP BY Clause MySQL

SHOW DATABASES;

use employees;

select first_name from employees group by first_name;

select distinct first_name from employees; 
-- the two queries above return the same results

select first_name from employees group by first_name order by first_name DESC; -- returns Z-A

-- Multiple columns

select last_name, first_name from employees group by last_name, first_name;
/* The above query will return all of the unique combinations of first and last names, grouped by thier last name sorted alphebetically, and within each last name group.*/

select last_name, first_name from employees group by last_name, first_name order by first_name DESC, last_name DESC;

-- Aggregate Functions 

-- COUNT
SHOW DATABASES;
USE albums_db;
select * from albums;

select count(artist) from albums;

select count(distinct artist) from albums;

select count(artist) from albums where name like('B%');

select count(artist) from albums where artist in('celine dion');

USE employees;

select count(*) from employees;

-- CLAUSES NOTES

/*

What's so great about GROUP BY?

Indentifies unique item names

When there are multiple values for a repeating item in a list, so you want mySQL to just display one item in one row, but then you have to specify which value you want to correspond with that item.
You can count how many times that items pops up in your table, or the mean price or value of all of those same items, or you can get the sum of the values.
*/

-- In practice, this would look like...

SHOW DATABASES;
USE chipotle;

select * from orders;

DESCRIBE orders;

select item_name from orders where item_name like ('%chicken%');

select distinct item_name from orders where item_name like ('%chicken%');
-- OR (same results)
select item_name from orders where item_name like ('%chicken%') group by item_name;
-- notice the group by after where
-- the unique thing about group by vs distinct is that you can group by specific attributes

select item_name, quantity from orders 
where item_name like '%chicken%' 
group by item_name, quantity 
order by item_name;

-- Aggregate Functions

-- How many chicken bowls have been ordered?

select count(item_name) from orders where item_name like '%chicken bowl%';

-- for each chicken dish, how many times was it ordered?

select count(item_name), item_name
from orders
where item_name like '%chicken%'
group by item_name;

-- Find the min and max quantity that each chicken dish was ordered
select item_name, min(quantity), max(quantity)
from orders
where item_name like '%chicken%'
group by item_name;

-- HAVING 

-- The appropriate tool for adding a conditional to a group by is to use HAVING
-- Find all order items with chicken that have been ordered over 100 times

select item_name, count(item_name) 
as count_items 
from orders 
where item_name like '%chicken%'
group by item_name 
having count_items > 100;


