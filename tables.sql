drop database sites;
create database sites;
USE sites;

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE notes (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers (id),
    content TEXT NOT NULL
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers (id),
    date_created DATE NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE tses (
    id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders (id),
    date_created DATE NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE teams (
    id INTEGER PRIMARY KEY,
    tses_done INTEGER NOT NULL DEFAULT 0,
    description TEXT NOT NULL,
    ts_id INTEGER REFERENCES tses (id)
);

CREATE TABLE jobs (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    job_id INTEGER REFERENCES jobs (id),
    firstname VARCHAR(255) NOT NULL,
    middlename VARCHAR(255),
    lastname VARCHAR(255) NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE specialisations (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE employees_specialisations (
    employees_id INTEGER REFERENCES employees (id),
    specialisations_id INTEGER REFERENCES specialisations (id),
    PRIMARY KEY (employees_id, specialisations_id)
);
