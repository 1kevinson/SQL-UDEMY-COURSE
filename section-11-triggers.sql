CREATE DATABASE test_triggers;

USE test_triggers;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_number INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    officeCode VARCHAR(50) NOT NULL
);

SELECT * FROM employees;

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_number INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    change_date DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DROP TABLE employees_audit;

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
INSERT INTO employees_audit
SET action = 'update',
	employee_number = OLD.employee_number,
 	lastname = OLD.lastname,
 	firstname = OLD.firstname,
 	email = OLD.email,
 	change_date = NOW();
 
SHOW triggers;

INSERT INTO employees (employee_number, lastname, firstname, email, officeCode)
VALUES
	(1300, 'Graig', 'Pender', 'kkpender@gmail.com', 'XCD99'),
	(1301, 'Mathew', 'Valderne', 'kkvalderne@gmail.com', 'XCE32');
	
SELECT * FROM employees_audit;

UPDATE employees SET lastname = 'Arsene', email='kkarsene43@gmail.com' 
WHERE firstname='Pender';

DROP TRIGGER before_employee_update;