-- =====================================================
-- STUDENT RECORDS DATABASE PROJECT
-- =====================================================
-- Author: [Your Name]
-- Description: Complete student management system
-- =====================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- =====================================================
-- TABLE CREATION
-- =====================================================

-- Students Table
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    enrollment_date DATE NOT NULL,
    department VARCHAR(50)
);

-- Courses Table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT NOT NULL,
    department VARCHAR(50)
);

-- Grades Table
CREATE TABLE IF NOT EXISTS grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks INT CHECK (marks >= 0 AND marks <= 100),
    grade VARCHAR(2),
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- =====================================================
-- INSERT SAMPLE DATA
-- =====================================================

-- Insert Students
INSERT INTO students (first_name, last_name, email, phone, date_of_birth, enrollment_date, department) VALUES
('Rahul', 'Sharma', 'rahul.sharma@college.edu', '9876543210', '2003-05-15', '2021-08-01', 'Computer Science'),
('Priya', 'Patel', 'priya.patel@college.edu', '9876543211', '2003-07-22', '2021-08-01', 'Electronics'),
('Amit', 'Kumar', 'amit.kumar@college.edu', '9876543212', '2003-03-10', '2021-08-01', 'Computer Science'),
('Sneha', 'Singh', 'sneha.singh@college.edu', '9876543213', '2003-11-05', '2021-08-01', 'Mechanical'),
('Rohan', 'Gupta', 'rohan.gupta@college.edu', '9876543214', '2003-09-18', '2021-08-01', 'Electronics'),
('Anjali', 'Verma', 'anjali.verma@college.edu', '9876543215', '2003-01-30', '2021-08-01', 'Computer Science'),
('Vikram', 'Reddy', 'vikram.reddy@college.edu', '9876543216', '2003-06-12', '2021-08-01', 'Civil'),
('Neha', 'Joshi', 'neha.joshi@college.edu', '9876543217', '2003-04-25', '2021-08-01', 'Electronics');

-- Insert Courses
INSERT INTO courses (course_name, course_code, credits, department) VALUES
('Data Structures', 'CS201', 4, 'Computer Science'),
('Database Management Systems', 'CS301', 4, 'Computer Science'),
('Python Programming', 'CS101', 3, 'Computer Science'),
('Digital Electronics', 'EC201', 4, 'Electronics'),
('Microprocessors', 'EC301', 4, 'Electronics'),
('Engineering Mathematics', 'MT101', 3, 'Mathematics'),
('Operating Systems', 'CS302', 4, 'Computer Science'),
('Web Development', 'CS202', 3, 'Computer Science');

-- Insert Grades
INSERT INTO grades (student_id, course_id, marks, grade, semester) VALUES
(1, 1, 85, 'A', 'Fall 2023'),
(1, 2, 92, 'A+', 'Fall 2023'),
(1, 3, 88, 'A', 'Spring 2023'),
(1, 7, 90, 'A+', 'Fall 2023'),
(2, 4, 91, 'A+', 'Fall 2023'),
(2, 5, 87, 'A', 'Fall 2023'),
(2, 6, 78, 'B+', 'Spring 2023'),
(3, 1, 76, 'B+', 'Fall 2023'),
(3, 2, 82, 'A', 'Fall 2023'),
(3, 3, 95, 'A+', 'Spring 2023'),
(3, 8, 88, 'A', 'Fall 2023'),
(4, 6, 84, 'A', 'Spring 2023'),
(5, 4, 89, 'A', 'Fall 2023'),
(5, 5, 92, 'A+', 'Fall 2023'),
(6, 1, 94, 'A+', 'Fall 2023'),
(6, 2, 96, 'A+', 'Fall 2023'),
(6, 3, 91, 'A+', 'Spring 2023'),
(6, 7, 93, 'A+', 'Fall 2023'),
(6, 8, 90, 'A+', 'Fall 2023'),
(7, 6, 72, 'B', 'Spring 2023'),
(8, 4, 86, 'A', 'Fall 2023'),
(8, 5, 84, 'A', 'Fall 2023');

-- =====================================================
-- QUERY 1: Display all students
-- =====================================================
SELECT * FROM students;

-- =====================================================
-- QUERY 2: Display all courses
-- =====================================================
SELECT * FROM courses;

-- =====================================================
-- QUERY 3: Students from Computer Science
-- =====================================================
SELECT first_name, last_name, email, department 
FROM students 
WHERE department = 'Computer Science';

-- =====================================================
-- QUERY 4: Display student names with grades
-- =====================================================
SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    g.marks, 
    g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id
ORDER BY s.first_name;

-- =====================================================
-- QUERY 5: Calculate average marks per student
-- =====================================================
SELECT 
    s.first_name, 
    s.last_name, 
    AVG(g.marks) AS average_marks,
    COUNT(g.course_id) AS courses_taken
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_marks DESC;

-- =====================================================
-- QUERY 6: Top 3 students with highest average
-- =====================================================
SELECT 
    s.first_name, 
    s.last_name, 
    ROUND(AVG(g.marks), 2) AS average_marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_marks DESC
LIMIT 3;

-- =====================================================
-- QUERY 7: Count students per department
-- =====================================================
SELECT 
    department, 
    COUNT(*) AS student_count
FROM students
GROUP BY department
ORDER BY student_count DESC;

-- =====================================================
-- QUERY 8: Courses with average marks > 85
-- =====================================================
SELECT 
    c.course_name, 
    c.course_code,
    ROUND(AVG(g.marks), 2) AS average_marks,
    COUNT(g.student_id) AS enrolled_students
FROM courses c
JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name, c.course_code
HAVING AVG(g.marks) > 85
ORDER BY average_marks DESC;

-- =====================================================
-- QUERY 9: Students who scored above 90
-- =====================================================
SELECT DISTINCT 
    s.first_name, 
    s.last_name,
    c.course_name,
    g.marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id
WHERE g.marks > 90
ORDER BY g.marks DESC;

-- =====================================================
-- QUERY 10: Department-wise performance
-- =====================================================
SELECT 
    s.department,
    COUNT(DISTINCT s.student_id) AS total_students,
    ROUND(AVG(g.marks), 2) AS department_average
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.department
ORDER BY department_average DESC;

-- =====================================================
-- UPDATE EXAMPLES
-- =====================================================

-- Update student phone
UPDATE students 
SET phone = '9998887770' 
WHERE email = 'rahul.sharma@college.edu';

-- =====================================================
-- COURSE ENROLLMENT STATISTICS
-- =====================================================
SELECT 
    c.course_name,
    COUNT(g.student_id) AS enrolled_count,
    MAX(g.marks) AS highest_marks,
    MIN(g.marks) AS lowest_marks,
    ROUND(AVG(g.marks), 2) AS average_marks
FROM courses c
LEFT JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

-- =====================================================
-- END OF SQL PROJECT
-- =====================================================