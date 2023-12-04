SELECT firstname FROM employees;

SELECT * FROM employees;

SELECT emp.id, job.salary
    FROM employees emp
    JOIN jobs job
    ON emp.job_id = job.id;

SELECT * FROM employees WHERE job_id=2
UNION
SELECT * FROM employees WHERE firstname='Просто';

SELECT * FROM jobs
WHERE EXISTS (SELECT * FROM employees WHERE employees.job_id = jobs.id);

SELECT * FROM jobs
WHERE NOT EXISTS (SELECT * FROM employees WHERE employees.job_id = jobs.id);


SELECT job_id, COUNT(id) AS count FROM employees GROUP BY job_id;

SELECT SUM(salary) AS sum FROM jobs;

SELECT MIN(salary) AS min, MAX(salary) AS max, AVG(salary) as avg FROM jobs;

SELECT * FROM employees ORDER BY id DESC;

SELECT team.id, COUNT(emp.id) AS count FROM employees AS emp
    INNER JOIN teams AS team
    WHERE emp.team_id = team.id
    GROUP BY team.id;