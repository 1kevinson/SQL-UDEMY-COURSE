UPDATE people 
SET name = UPPER(name) 
WHERE (2021 - birth_date) > 35 
AND name LIKE '%e%' 