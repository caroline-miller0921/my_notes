-- WHERE, LIMIT, and other clauses
-- LIMIT
-- use my fruits DB
USE fruits_db;
SHOW TABLES;
SELECT * FROM fruits;
SELECT * FROM fruits LIMIT 5;
-- You don't have to wait for the whole table to populate, just the first 5ths
USE employees;
SELECT * from employees LIMIT 10;

SELECT * FROM fruits_db.fruits;
-- did not change schema, used dot notation to point out a more absolute path
-- to actually move there :
USE fruits_db;


-- there is a table called employees in the stema called employees

SELECT * FROM employees.employees LIMIT 5;

SELECT * FROM fruits;
SELECT * FROM fruits WHERE name = 'cantelope';
SELECT * FROM fruits WHERE quantity = 2;
SELECT * FROM fruits WHERE quantity between 2 and 10;

SELECT quantity FROM fruits WHERE name = 'apple';
SELECT name, quantity FROM fruits WHERE name = 'apple';
-- Redundant yet effective

SELECT * FROM fruits;

SELECT * FROM fruits WHERE name LIKE '%fruit';
-- If we wanted to find an instance where the name not only ends in the word "fruit", but "fruit" is somewhere in the word, what would we do?
SELECT * FROM fruits WHERE name LIKE '%fruit%';
-- BAM got em

-- Note:  wildcard can. be used to pad for zero or more characters
-- IN
-- Show me fruits that are only apples or dragonfruits 
SELECT * FROM fruits WHERE name IN('apple', 'dragonfruit');
SELECT * FROM fruits WHERE name IN(LIKE '%apple', 'dragonfruit');

SELECT * FROM fruits
WHERE name IN('apple', 'dragonfruit')
OR name LIKE '%apple';
-- We did it!

/* AND 
	Both True = True
	One False = False
	Both False = False
	
	OR
		Both True = True
		One True = False
		Both False = False
		*/

SELECT * FROM fruits;

DESCRIBE fruits;

-- Where comparison operators chnage by what we are comparing!
-- numbers can use < > =, etc.

SELECT * FROM fruits WHERE quantity > 5;
SELECT * FROM fruits WHERE quantity >= 5;
-- What about all fruits whose quantity does not = 5?
SELECT * FROM fruits WHERE quantity <> 5;
SELECT * FROM fruits WHERE quantity != 5;
-- Same thing!

SELECT * FROM fruits WHERE quantity BETWEEN 1 and 5;
-- range is inclusive of the two values

SELECT * FROM fruits WHERE name IS NOT NULL;
-- Everything is there
SELECT * FROM fruits WHERE name IS NULL;
-- Nothing is there

