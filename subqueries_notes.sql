-- SUBQUERIES in MySQL

/*
What is it?
A query enclosed inside another sql query

Can find in WHERE, SELECT, or FROM 
-- typically found in where clauses

Whatever is returned from the subquery is used in the outer query

Steps;
1. Write inner query
2. Write outer query
3. Combine queries

Example:  Which employees have higer than avg salaries
-- Determine the avg salary
SELECT avg(salary) from salaries;
	returns avg salary
SELECT emp_no from salaries
Where salary > (SELECT avg(salary) from salaries);
	Combines inner and outer
	
-- Names of current dept managers

select emp_no from dept_manager 
Where dept_manager.to_date > NOW();

select first_name, last_name
from employees
Where emp_no IN (
select emp_no from dept_manager 
Where dept_manager.to_date > NOW()
);
-- BAM

Tables Subqueeries 

Subquery:

select * from salaries 
where to_date > now();

Outer Query

select current_salary.emp_no, current_salary.salary, first_name
	FROM (** insert subquery ** select * from salaries 
where to_date > now()
	) as current salary 
JOIN employees using (emp_no);
	** NOTE: when referencing a subquery that is a table, you must give the table a name. In this example the table name is salary
*/

SHOW DATABASES;

USE employees;

-- Which employees have higher than avg salaries 

	-- SUBQUERY
select avg(salary) from salaries;

	-- OUTER QUERY
select * from salaries 
where salary > -- you can use any traditional operator 
(
	-- Insert subquery
	select avg(salary) from salaries
)
;

-- Find first and last names of the above query
select first_name, last_name, salaries.* -- brings back everything from the salaries table if you don't want/need to specify which columns you want
from salaries
	JOIN employees 
		USING (emp_no)
where salary > -- you can use any traditional operator 
(
	-- Insert subquery
	select avg(salary) from salaries
)
;

-- How to add the avg salary to the previous query?

select (select avg(salary) from salaries), first_name, last_name, salary -- brings back everything from the salaries table if you don't want/need to specify which columns you want
from salaries
	JOIN employees 
		USING (emp_no)
where salary > -- you can use any traditional operator 
(
	-- Insert subquery
	select avg(salary) from salaries
)
LIMIT 20
;

select * from employees LIMIT 100;

select * from salaries LIMIT 100;

-- Names of current dept managers
select * from dept_manager;

select emp_no from dept_manager
Where dept_manager.to_date > NOW();

select first_name, last_name
from employees
Where emp_no IN (
select emp_no from dept_manager 
Where dept_manager.to_date > NOW()
);

-- Find the dept managers and their birthdays
select * from dept_manager limit 10;
select * from employees limit 10;

-- subquery
select * from dept_manager
where to_date > now();

-- outer query
select  first_name, last_name, birth_date from employees
where emp_no IN -- make sure your variable matches the output in the inner query
(
	select emp_no -- both needed to say emp_no
	from dept_manager
	where to_date > NOW()
) -- subquery wrapped in parentheses 
;

-- Add in each dept the dept managers work in

-- which is the linking table?? Lets use dept_manager table
select  first_name, last_name, birth_date, dept_name 
from employees
	join dept_manager 
		using (emp_no)
	join departments 
		using (dept_no)
where emp_no IN -- make sure your variable matches the output in the inner query
(
	select emp_no -- both needed to say emp_no
	from dept_manager
	where to_date > NOW()
) -- subquery wrapped in parentheses 
;

select * from dept_manager limit 20;
select * from departments limit 20;

-- how many duplicate usernames are there from your username query?
select
	lower
	(
		concat(
			substr(frist_name, 1, 1)
			substr(last_name, 1, 4)
			' ',
			lpad(month(birth_date), 2, 0)
			substr(birth_date, 3, 2)
			)
		) as username 
		
		, count * as un
	)