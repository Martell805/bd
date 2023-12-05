DROP TRIGGER IF EXISTS customer_BEFORE_INSERT;

CREATE TRIGGER customer_BEFORE_INSERT BEFORE
    INSERT ON customers FOR EACH ROW
BEGIN
IF NOT check_email(New.email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email is not valid';
END IF;
END;

INSERT INTO customers VALUES (6, 'Company NONE', '8(495)123-12-12', 'incorrect@email');

DROP TRIGGER IF EXISTS customer_BEFORE_INSERT;

CREATE TRIGGER customer_BEFORE_INSERT AFTER
    INSERT ON customers FOR EACH ROW
BEGIN
    CALL addNote(New.id,  CONCAT('Start date of the cooperation: ', NOW()));
END;

INSERT INTO customers VALUES (6, 'Company NEW', '8(495)123-12-12', 'correct@email.com');
SELECT * FROM notes WHERE customer_id = 6;

DROP TRIGGER IF EXISTS job_BEFORE_UPDATE;

CREATE TRIGGER job_BEFORE_UPDATE BEFORE
    UPDATE ON jobs FOR EACH ROW
BEGIN
    SET @salary = (SELECT salary FROM jobs WHERE id = New.id LIMIT 1);

    IF @salary > New.salary THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'We are not lowering salaries!';
    END IF;

END;

UPDATE jobs SET salary = 10 WHERE id = 1;
