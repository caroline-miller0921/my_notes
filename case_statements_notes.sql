
-- CASE STATEMENTS in MySQL

/*
IF (condition)
	
	THEN (result)
	
	OTHERWISE WHEN (conditon2) (result)
	
	OTHERWISE (result)
*/
show databases;
use chipotle;
-- use the schema 

select * from orders limit 10;
-- grab the preview of the table here

select item_name from orders;

explain orders;

-- grab true values for any instance that an item_name in a chickem item

-- this is previously how we could have done this
select item_name from orders where item_name like '%chicken%';

-- in this case I want to change to output of the cells
-- this calls for a different application of logic

select item_name, 
	if( item_name like '%chicken%', 1, 0) as chicken_type
	from orders;

-- structure:
-- IF (<truth condition>, <value if case is true>, <value if case is false>)
-- change the output of that IF statement 
select if(
item_name like '%steak%', 'steak thing', 'not steak')
from orders;

-- to go deeper
select if(
item_name like '%steak%', 
	if 
	(
	item_name like '%bowl%', 
	'steak bowl', 
	'other steak item'
	), 'not steak item')
from orders;

-- if it didnt have steak in it at all, we go directly to not_steak and not even mess with the nested condition
select if(
item_name like '%steak%', 
	if 
	(
	item_name like '%bowl%', 
	'steak bowl', 
	'other steak item'
	), 
	'not steak') as steak_col
from orders;

-- CASE STATEMENT
-- case statments are like if statement except the structure is different

-- CASE statements allow for multiple logic checks in a row 
-- STRUCTURE of a CASE statement:
select item_name, quantity,
CASE item_name 
	when 'chicken bowl' then 1
	else 0
END as chicken_bowls
from orders;

--

select item_name, quantity,
CASE item_name
-- case looks at item_name
	when 'chicken bowl' then 'bowl'
	when 'chicken burrito' then 'burrito'
	else 'not chicken that I care about'
END as chicken_bowls
from orders;

-- limitations of what we did above:
-- can only check for direct equivalency!

select item_name, 
case item_name
when like '%chicken%' then 'chickeny'
else 'not chickeny'
end as chicken_type_beat
from orders;
-- THIS WILL BREAK
-- you must provide the variable that mysql is supposed to look at

select item_name,
case
when item_name like '%chicken%' then 'chicken type'
when item_name like '%steak%' then 'steak type'
else 'other thing'
end as 'meat check'
from orders;

USE join_example_db;
select * from users;

select role_id, users.*,
case 
	when role_id > 2 then 'high roller'
	when role_id = 1 then 'some role'
	when role_id is null then 'idk'
	else 'will you see this'
end as 'case results'
from users;

-- going back to IFs

select if(role_id = 3, 1, 0)
as role_3 from users;

-- let's count 'em
-- wrap the count function around an if
select count(if(role_id = 3, 1, 0))
as role_3 from users;

-- you dont even need the if actually!
select (role_id > 2) from users;



