
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

-- verify the update
select * from my_numbers;

-- now we delete stuff
delete from my_numbers
where n = 2;

-- verify
select * from my_numbers; -- the row is now gone

-- switch to employees DB 

use employees;

show tables;

select first_name, last_name, salary, dept_name
from employees
join dept_emp as de using (emp_no)
join salaries as s using (emp_no)
join departments using (dept_no)
where de.to_date > now()
and s.to_date > now()
and dept_name = 'customer service';

-- now we want to turn this into a temp table

create temporary table oneil_2099.curr_custserv_emps as -- save table in my DB eneil.2099
(
select first_name, last_name, salary, dept_name
from employees
join dept_emp as de using (emp_no)
join salaries as s using (emp_no)
join departments using (dept_no)
where de.to_date > now()
and s.to_date > now()
and dept_name = 'customer service'
)
;

-- Great!

select * from oneil_2099.curr_custserv_emps;

-- and it populates!

use oneil_2099;

drop table curr_custserv_emps;

select database();
use employees;

select first_name, last_name, salary, dept_name
from employees
join dept_emp as de using (emp_no)
join salaries as s using (emp_no)
join departments using (dept_no)
where de.to_date > now()
and s.to_date > now()
and dept_name = 'customer service'
;


create temporary table oneil_2099.curr_custserv_emps as -- save table in my DB eneil.2099
(
select first_name, last_name, salary, dept_name
from employees
join dept_emp as de using (emp_no)
join salaries as s using (emp_no)
join departments using (dept_no)
where de.to_date > now()
and s.to_date > now()
and dept_name = 'customer service'
)
;



