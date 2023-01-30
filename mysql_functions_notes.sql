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


