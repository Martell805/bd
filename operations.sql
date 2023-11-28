SELECT firstname FROM employees;

SELECT * FROM employees WHERE team_id = 2;

SELECT emp.id, job.salary
    FROM employees emp
    JOIN jobs job
    ON emp.job_id = job.id;

SELECT * FROM employees WHERE job_id=2
UNION
SELECT * FROM employees WHERE job_id=3;

SELECT * FROM jobs
WHERE EXISTS (SELECT * FROM employees WHERE employees.job_id = jobs.id);

SELECT * FROM jobs
WHERE NOT EXISTS (SELECT * FROM employees WHERE employees.job_id = jobs.id);


SELECT job_id, COUNT(id) AS count FROM employees GROUP BY job_id;

SELECT * FROM employees ORDER BY id DESC;

SELECT job.title, COUNT(emp.id) AS count FROM employees AS emp
    INNER JOIN jobs AS job
    WHERE emp.job_id = job.id
    GROUP BY job.id;