drop database sites;
create database sites;
USE sites;

CREATE TABLE customers (
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255),
    email        VARCHAR(255)
);

CREATE TABLE notes (
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id INTEGER NOT NULL,
    content     TEXT    NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE orders (
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id  INTEGER NOT NULL,
    date_created DATE    NOT NULL,
    description  TEXT    NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE tses (
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_id     INTEGER NOT NULL,
    date_created DATE    NOT NULL,
    description  TEXT    NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE teams (
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    tses_done   INTEGER NOT NULL DEFAULT 0,
    description TEXT    NOT NULL,
    ts_id       INTEGER,

    FOREIGN KEY (ts_id)
        REFERENCES tses (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE jobs (
      id    INTEGER PRIMARY KEY AUTO_INCREMENT,
      title VARCHAR(255) NOT NULL,
      salary INTEGER NOT NULL
);

CREATE TABLE employees (
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    job_id     INTEGER,
    firstname  VARCHAR(255) NOT NULL,
    middlename VARCHAR(255),
    lastname   VARCHAR(255) NOT NULL,
    team_id    INTEGER,

    FOREIGN KEY (job_id)
        REFERENCES jobs (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (team_id)
        REFERENCES teams (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE specialisations (
    id    INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE employees_specialisations (
    employees_id       INTEGER,
    specialisations_id INTEGER,
    PRIMARY KEY (employees_id, specialisations_id),

    FOREIGN KEY (employees_id)
        REFERENCES employees (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (specialisations_id)
        REFERENCES specialisations (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);