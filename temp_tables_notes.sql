
-- Temporary Tables in MySQL

-- Format: 
-- CREATE TEMPORARY TABLE table_name(   );

-- can only create a temp table if you hgave permission to alter the DB

show databases;

use oneil_2099;

create temporary table my_numbers
	(
	n int unsigned not null,
	named varchar(20) not null
	)
;

-- view table
show tables;

-- it wont show up 

-- insert some data

insert into my_numbers
(n, named)
values 
('1', 'a'), 
('2', 'b'), 
('3', 'c'),
('4', 'd'),
('5', 'e');

-- verify data in table
select * from my_numbers;

-- update values
update my_numbers
set named = 'BIG'
where n >=4
;

select * from my_numbers;


