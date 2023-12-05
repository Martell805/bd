DROP PROCEDURE IF EXISTS change_employee_job;

CREATE PROCEDURE change_employee_job(
    IN employee_id INTEGER,
    IN new_job_id INTEGER
)
BEGIN
    IF new_job_id IN (SELECT id FROM jobs WHERE id=new_job_id) THEN
        UPDATE employees SET job_id=new_job_id WHERE id=employee_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Job is not present!';
    END IF;
END;

CALL change_employee_job(3, 2);
SELECT * FROM employees WHERE id = 3;

DROP PROCEDURE IF EXISTS clear_jobs;

CREATE PROCEDURE clear_jobs()
BEGIN
    DELETE FROM jobs AS job WHERE id NOT IN (
        SELECT emp.job_id FROM employees AS emp WHERE emp.job_id = job.id GROUP BY emp.job_id
    );
END;

CALL clear_jobs();
SELECT * FROM jobs;

DROP PROCEDURE IF EXISTS addNote;

CREATE PROCEDURE addNote(
    IN client_id INTEGER,
    IN note_text TEXT
)
BEGIN
    IF client_id NOT IN (SELECT id FROM customers) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer not found!';
    END IF;

    IF note_text IS NULL OR note_text = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Note should be present!';
    END IF;

    INSERT INTO notes (customer_id, content) VALUES (client_id, note_text);
END;

CALL addNote(5, 'Любимый клиент');
SELECT * FROM notes;