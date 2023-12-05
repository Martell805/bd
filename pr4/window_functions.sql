SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    AVG(job.salary) OVER () AS avg_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    AVG(job.salary) OVER (PARTITION BY emp.team_id) AS avg_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    SUM(job.salary) OVER (
        PARTITION BY emp.team_id
        ORDER BY emp.id
    ) AS sum_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    SUM(job.salary) OVER (
        ORDER BY emp.id
        RANGE UNBOUNDED PRECEDING
    ) AS sum_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    SUM(job.salary) OVER (
        ORDER BY emp.id
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS sum_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    SUM(job.salary) OVER (
       ORDER BY emp.id
       ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS sum_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    COUNT(emp.id) OVER (
        PARTITION BY team_id
        ORDER BY emp.id
    ) AS team_size
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    MIN(job.salary) OVER (
        PARTITION BY team_id
    ) AS min_salary,
    MAX(job.salary) OVER (
        PARTITION BY team_id
    ) AS max_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    ROW_NUMBER() OVER (
        PARTITION BY team_id
    ) AS number
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    RANK() OVER (
        PARTITION BY team_id
        ORDER BY job.salary DESC
    ) AS number
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    DENSE_RANK() OVER (
        PARTITION BY team_id
        ORDER BY job.salary DESC
    ) AS number
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    NTILE(2) OVER (
        ORDER BY job.salary DESC
    ) AS number
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    LAG(job.salary) OVER (
        PARTITION BY emp.team_id
        ORDER BY job.salary DESC
    ) AS next_salary,
    LEAD(job.salary) OVER (
        PARTITION BY emp.team_id
        ORDER BY job.salary DESC
    ) AS prev_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;

SELECT emp.id, emp.team_id, job.id, job.title, job.salary,
    FIRST_VALUE(job.salary) OVER (
        PARTITION BY emp.team_id
    ) AS first_salary,
    LAST_VALUE(job.salary) OVER (
        PARTITION BY emp.team_id
    ) AS last_salary
    FROM employees AS emp, jobs AS job
    WHERE emp.job_id = job.id;
