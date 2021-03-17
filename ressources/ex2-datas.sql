-- v1
SELECT * , (2021 - birth_date) AS age FROM people;
-- v2
SELECT * , CONCAT((2021 - birth_date), ' ' ,'years old') AS 'age des employés'
FROM people;