DROP DATABASE IF EXISTS myDB;
CREATE DATABASE myDB;

USE myDB;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);
