----------------
-- EXERCICE 3 --
----------------
SELECT name, email
FROM people
WHERE birth_date > 1986

----------------
-- EXERCICE 4 --
----------------
SELECT name
FROM people
WHERE birth_date IN (1988,1989,1990) AND name LIKE 'P%';

----------------
-- EXERCICE 5 --
----------------
UPDATE people 
SET name = UPPER(name) 
WHERE (2021 - birth_date) > 35 
AND name LIKE '%e%' 