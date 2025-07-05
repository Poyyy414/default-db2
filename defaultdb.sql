-- Create database (optional)
CREATE DATABASE IF NOT EXISTS defaultdb;
USE default_db;

-- Table: user
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: department
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_code VARCHAR(10) NOT NULL UNIQUE,
    dept_name VARCHAR(100) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL
);

-- Table: course
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    user_id INT,
    dept_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL
);

-- Table: student
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    lname_e VARCHAR(50) NOT NULL,
    fname_e VARCHAR(50) NOT NULL,
    user_id INT,
    course_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE SET NULL
);

SELECT * FROM student;

DROP DATABASE defaultdb;
