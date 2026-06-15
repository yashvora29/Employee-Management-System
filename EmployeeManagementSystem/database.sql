-- Create Database
CREATE DATABASE IF NOT EXISTS EmployeeManagementSystem;
USE EmployeeManagementSystem;

-- Create Users table for Authentication
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Create Employees table for Data
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    designation VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Insert Default Users
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'Admin');
INSERT INTO users (username, password, role) VALUES ('employee', 'emp123', 'Employee');

-- Insert 20 Employee Records for Testing Pagination/Sorting
INSERT INTO employees (first_name, last_name, email, phone, designation, salary, hire_date) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'Software Engineer', 60000.00, '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'Team Lead', 85000.00, '2022-05-20'),
('Michael', 'Brown', 'michael.brown@example.com', '1122334455', 'Project Manager', 95000.00, '2021-11-10'),
('Emily', 'Davis', 'emily.davis@example.com', '2233445566', 'UI/UX Designer', 55000.00, '2023-03-12'),
('David', 'Wilson', 'david.wilson@example.com', '3344556677', 'Backend Developer', 65000.00, '2022-08-05'),
('Sarah', 'Miller', 'sarah.miller@example.com', '4455667788', 'QA Analyst', 50000.00, '2023-06-18'),
('James', 'Taylor', 'james.taylor@example.com', '5566778899', 'DevOps Engineer', 75000.00, '2021-02-25'),
('Linda', 'Anderson', 'linda.anderson@example.com', '6677889900', 'HR Manager', 70000.00, '2020-09-15'),
('Robert', 'Thomas', 'robert.thomas@example.com', '7788990011', 'Marketing Specialist', 52000.00, '2022-12-01'),
('Barbara', 'Jackson', 'barbara.jackson@example.com', '8899001122', 'Data Analyst', 58000.00, '2023-04-30'),
('William', 'White', 'william.white@example.com', '9900112233', 'Full Stack Developer', 68000.00, '2022-01-10'),
('Elizabeth', 'Harris', 'elizabeth.harris@example.com', '1011121314', 'Support Executive', 45000.00, '2023-07-05'),
('Richard', 'Martin', 'richard.martin@example.com', '1516171819', 'Senior Architect', 120000.00, '2019-10-20'),
('Susan', 'Thompson', 'susan.thompson@example.com', '2021222324', 'Content Writer', 48000.00, '2023-02-14'),
('Joseph', 'Garcia', 'joseph.garcia@example.com', '2526272829', 'SEO Expert', 53000.00, '2022-03-22'),
('Jessica', 'Martinez', 'jessica.martinez@example.com', '3031323334', 'Business Analyst', 62000.00, '2021-08-11'),
('Charles', 'Robinson', 'charles.robinson@example.com', '3536373839', 'Cloud Consultant', 90000.00, '2020-12-05'),
('Margaret', 'Clark', 'margaret.clark@example.com', '4041424344', 'Receptionist', 35000.00, '2023-08-10'),
('Thomas', 'Rodriguez', 'thomas.rodriguez@example.com', '4546474849', 'Web Developer', 54000.00, '2022-07-28'),
('Patricia', 'Lewis', 'patricia.lewis@example.com', '5051525354', 'System Administrator', 67000.00, '2021-05-15');
