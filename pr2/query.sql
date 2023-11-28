SELECT id FROM employees;

SELECT * FROM employees ORDER BY id DESC;

SELECT * FROM employees WHERE team_id = 2;

SELECT * FROM employees WHERE team_id BETWEEN 2 AND 3;

SELECT * FROM employees WHERE team_id IN (1, 4);

SELECT * FROM employees WHERE lastname LIKE '%Дизайн%';

ALTER TABLE employees ADD COLUMN test INTEGER;
SELECT * FROM employees;

ALTER TABLE employees DROP COLUMN test;
SELECT * FROM employees;

UPDATE employees SET middlename='Без-Отчества' WHERE id=5;
SELECT * FROM employees;

ALTER TABLE employees CHANGE middlename middle_name VARCHAR(255);
SELECT * FROM employees;

DELETE FROM employees where id=5;
SELECT * FROM employees;
