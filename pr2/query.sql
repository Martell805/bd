SELECT * FROM employees;

SELECT lastname FROM employees;

SELECT * FROM employees ORDER BY id DESC;

SELECT * FROM employees ORDER BY job_id, team_id;

SELECT * FROM employees WHERE team_id = 2;

SELECT * FROM employees WHERE id < 12 AND id > 4 AND id != 7;

SELECT * FROM employees WHERE id <= 12 AND id >= 4;

SELECT * FROM employees WHERE middlename IS NOT NULL;

SELECT * FROM employees WHERE middlename IS NULL;

SELECT * FROM employees WHERE team_id BETWEEN 2 AND 3;

SELECT * FROM employees WHERE team_id IN (1, 4);

SELECT * FROM employees WHERE team_id NOT IN (1, 4);

SELECT * FROM employees WHERE lastname LIKE '%Дизайн%';

ALTER TABLE employees ADD COLUMN test INTEGER;
SELECT * FROM employees;

ALTER TABLE employees DROP COLUMN test;
SELECT * FROM employees;

UPDATE employees SET middlename='Без-Отчества' WHERE middlename IS NULL;
SELECT * FROM employees;

ALTER TABLE employees CHANGE middlename middle_name VARCHAR(255);
SELECT * FROM employees;

DELETE FROM employees WHERE id=5;
SELECT * FROM employees;

DELETE FROM jobs WHERE id=1;
SELECT * FROM jobs;
