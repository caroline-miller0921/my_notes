-- ORDER BY, LIMIT, OFFSET

-- Reasons behing these:
-- Order BY: a clause to sort by columns
-- LIMIT: cut off our values at a certain point
-- OFFSET: skip a number of values

USE fruits_db;

SELECT * FROM fruits;

SELECT * FROM fruits ORDER BY quantity; -- ascending
SELECT * FROM fruits ORDER BY quantity ASC;
SELECT * FROM fruits ORDER BY quantity DESC;

-- ORDER BY will arrange a table by sorting the values from the fields(s) specified 
-- we can clarify on what we want to go ascending with ASC or descending by DSEC

USE albums_db;

SELECT * FROM albums;
SELECT * FROM albums ORDER BY artist;
SELECT * FROM albums ORDER BY artist, release_date;
-- If we sort by two things, the secind options will only come into play if there are duplicate values

SELECT * FROM albums ORDER BY artist, release_date DESC;
-- See that the release dates for duplicate artists are sorted in a descending order (i.e. Celine Dion)

SELECT * FROM albums; -- returns everything 
SELECT * FROM albums LIMIT 13;
-- Only returns the first 13 rows

SELECT * FROM albums ORDER BY id DESC LIMIT 4;
-- How to see the tail instead of the head of the dataset
-- Order matters here - would break if you put LIMIT before ORDER BY
-- Current layout:
-- SELECT 
-- What field(s)
-- What table?
-- Optional:  Where (what condition?)
-- Optional:  LIMIT (do we want to cut off the results?)

-- EXTRA THING

SELECT * FROM albums; 

SELECT * FROM albums LIMIT 10 OFFSET 5;
-- OFFSET is compunded with LIMIT with the potential to paginate information 
-- In this case, we skipped the first 5 results and then displayed the next 10 results  




