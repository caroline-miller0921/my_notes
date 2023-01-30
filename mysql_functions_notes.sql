-- MySQL Functions Notes

SHOW DATABASES;

USE albums_db;

SHOW TABLES;

-- COUNT

SELECT COUNT(*) FROM albums;
-- returns 31

SELECT COUNT(name) FROM albums;
-- returns 31

-- NUMERICAL 

-- min, max, and avg

SELECT min(release_date) FROM albums;
SELECT avg(release_date) FROM albums;
SELECT max(release_date) FROM albums;

select min(release_date) as min_release_date
	, max(release_date)
	, avg(release_date)
	, round( avg(release_date), 1)
from albums; 
-- Questionable.. 
-- STRING FUNCTIONS

select concat('hello', 'world', "!");

select concat('my favorite artist is ', artist) from albums;

select concat(artist, ' - ', name) from albums;

select concat(artist, ' - ', name) as artist_title from albums;

-- SUBSTR

-- SUBSTRING(string, start, length) 

select substr('hello oneil class', 2, 3);
-- character count starts at 1 not 0

select substr(release_date, 3, 2), release_date from albums;
-- same thing as
select substr(release_date, -2), release_date from albums;


-- CASE CONVERSION

select * from albums;

select upper(artist), artist, lower(artist) from albums;

-- Replace

-- format:  REPLACE(string, from_string, new_string);

select replace('hello oneil!', 'oneil', 'O\'Neil');
SHOW DATABASES; 
USE albums_db;

select genre, replace(genre, 'rock', '******ROCK*****') from albums;

select genre, replace(lower(genre), 'rock', '*****ROCK****') as genre_ROCKS from albums;

-- TIME and DATE Functions

select now();

select current_date();

select curdate();

select curtime();

select now(), current_time(), curtime(), current_date();

select convert_tz(NOW(), '+00:00', '-06:00');

-- CASTING: change the data type of a variable
-- format:  CAST(value as);

select 1 + '2';
-- see that an int plus a string will give you the sum in MySQL

select month('2023-01-23');

select 1 + cast('2' as unsigned); -- must tell it what to cast the variable as, in this case unsigned





