DROP PROCEDURE IF EXISTS change_employee_job;

CREATE PROCEDURE change_employee_job(
    IN employee_id INTEGER,
    IN new_job_id INTEGER,
    OUT error_message VARCHAR(255)
)
BEGIN
    IF new_job_id IN (SELECT id FROM jobs WHERE id=new_job_id) THEN
        UPDATE employees SET job_id=new_job_id WHERE id=employee_id;
    ELSE
        SET error_message = 'Job is not present!';
    END IF;
END;

SET @error_message = '';
CALL change_employee_job(3, 2, @error_message);
SELECT @error_message;
SELECT * FROM employees WHERE id = 3;

DROP FUNCTION IF EXISTS check_email;

CREATE FUNCTION check_email(
    email VARCHAR(255)
) RETURNS BOOL DETERMINISTIC
BEGIN
    RETURN email LIKE '%@%.%' OR email IS NULL;
END;

SELECT check_email('hello@world') as result;


DROP TRIGGER IF EXISTS customer_BEFORE_INSERT;

CREATE TRIGGER customer_BEFORE_INSERT BEFORE
    INSERT ON customers FOR EACH ROW
BEGIN
    IF NOT check_email(New.email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is not valid';
    END IF;
END;

INSERT INTO customers VALUES (6, 'Company NONE', '8(495)123-12-12', 'incorrect@email');

DROP PROCEDURE IF EXISTS clear_jobs;

CREATE PROCEDURE clear_jobs()
BEGIN
    SET @used_jobs := (
        SELECT job_id FROM employees GROUP BY job_id
    );

    SET @unused_jobs := (
        SELECT id FROM jobs WHERE id NOT IN (@used_jobs)
    );

    DELETE FROM jobs WHERE id IN (@unused_jobs);
END;

CALL clear_jobs();
SELECT * FROM jobs;
