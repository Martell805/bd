DROP FUNCTION IF EXISTS check_email;

CREATE FUNCTION check_email(
    email VARCHAR(255)
) RETURNS BOOL DETERMINISTIC
BEGIN
RETURN email LIKE '%@%.%' OR email IS NULL;
END;

SELECT check_email('hello@world') AS result;

DROP FUNCTION IF EXISTS calculate_payments;

CREATE FUNCTION calculate_payments() RETURNS INTEGER READS SQL DATA
BEGIN
    RETURN (SELECT SUM(job.salary) FROM employees AS emp, jobs AS job WHERE emp.job_id = job.id);
END;

SELECT calculate_payments() AS payments;

DROP FUNCTION IF EXISTS best_client;

CREATE FUNCTION best_client() RETURNS VARCHAR(255) READS SQL DATA
BEGIN
    RETURN (
        SELECT cus.name AS count FROM customers AS cus, orders AS ord
        WHERE cus.id = ord.customer_id
        GROUP BY cus.id
        ORDER BY COUNT(ord.id) DESC
        LIMIT 1
    );
END;

SELECT best_client();