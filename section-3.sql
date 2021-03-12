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
SELECT UPPER(name) AS name, email, birth_date, (2021 - birth_date) AS age
FROM people
WHERE (2021 - birth_date) > 35;