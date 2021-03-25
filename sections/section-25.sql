-- Transactions
CREATE DATABASE IF NOT EXISTS transactions;

USE transactions;

CREATE TABLE IF NOT EXISTS accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	balance INT NOT NULL 
);

INSERT INTO accounts (name, balance)
VALUES
	('Mathieu', 200),
	('Aurelie', 200);


-- Ouvrir une transaction
-- Zone virtuelle de transaction  --
BEGIN;

UPDATE accounts
SET balance = balance + 50
WHERE name = 'Mathieu';

SELECT * FROM accounts;

COMMIT;

-- Transaction clean up 
UPDATE accounts
SET balance = 200;

-- refaire 
UPDATE accounts
SET balance = balance + 50
WHERE name = 'Mathieu';

-- terminer une session de transaction manuellement --
-- dans le session manager


-- ROLLBACK MANUAL
BEGIN;

SELECT * FROM accounts;

UPDATE accounts SET balance = 22;

ROLLBACK;