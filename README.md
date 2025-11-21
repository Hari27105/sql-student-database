# Student Database Management System 🎓

A comprehensive SQL database project for managing student records, courses, and academic performance with real-world queries and analysis.

## 📋 Project Overview

Complete database management system for educational institutions featuring student enrollment, course management, grade tracking, and performance analytics.

## 🗄️ Database Design

### Entity Relationship

```
STUDENTS (1) ─────< (M) GRADES (M) >───── (1) COURSES
```

### Tables Schema

#### 1. **students**
| Column | Type | Constraints |
|--------|------|-------------|
| student_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| first_name | VARCHAR(50) | NOT NULL |
| last_name | VARCHAR(50) | NOT NULL |
| email | VARCHAR(100) | UNIQUE, NOT NULL |
| phone | VARCHAR(15) | |
| date_of_birth | DATE | |
| enrollment_date | DATE | NOT NULL |
| department | VARCHAR(50) | |

#### 2. **courses**
| Column | Type | Constraints |
|--------|------|-------------|
| course_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| course_name | VARCHAR(100) | NOT NULL |
| course_code | VARCHAR(20) | UNIQUE, NOT NULL |
| credits | INT | NOT NULL |
| department | VARCHAR(50) | |

#### 3. **grades**
| Column | Type | Constraints |
|--------|------|-------------|
| grade_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| student_id | INT | FOREIGN KEY → students |
| course_id | INT | FOREIGN KEY → courses |
| marks | INT | CHECK (0-100) |
| grade | VARCHAR(2) | |
| semester | VARCHAR(20) | |

## 🚀 Features

### ✅ Database Operations
- Complete schema design with 3 normalized tables
- Foreign key relationships
- Data integrity constraints
- Sample data insertion (8 students, 8 courses, 22 grades)

### ✅ Query Capabilities
- **Basic Queries**: SELECT, WHERE, ORDER BY
- **Joins**: INNER JOIN, LEFT JOIN
- **Aggregations**: AVG(), COUNT(), MAX(), MIN()
- **Grouping**: GROUP BY with HAVING
- **Filtering**: Complex WHERE conditions
- **Updates**: UPDATE, DELETE operations

### ✅ Analytics
- Student performance tracking
- Top performers identification
- Department-wise statistics
- Course enrollment analysis
- Grade distribution
- Average marks calculation

## 💻 Installation & Usage

### Prerequisites
- MySQL 5.7+ / PostgreSQL / SQLite
- MySQL Workbench / DBeaver / Command Line

### Setup Instructions

**Option 1: MySQL Command Line**
```bash
mysql -u root -p
source student_database.sql
```

**Option 2: MySQL Workbench**
1. Open MySQL Workbench
2. Create new SQL tab
3. Copy entire `student_database.sql` content
4. Execute script (⚡ icon)

**Option 3: phpMyAdmin**
1. Login to phpMyAdmin
2. Click "SQL" tab
3. Paste script and execute

### Verify Installation
```sql
USE student_management;
SHOW TABLES;
SELECT COUNT(*) FROM students;
```

## 📊 Sample Queries & Results

### Query 1: Top 3 Students
```sql
SELECT first_name, last_name, ROUND(AVG(marks), 2) AS avg_marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id
ORDER BY avg_marks DESC
LIMIT 3;
```

**Expected Output:**
| First Name | Last Name | Avg Marks |
|------------|-----------|-----------|
| Anjali | Verma | 92.80 |
| Rohan | Gupta | 90.50 |
| Rahul | Sharma | 88.75 |

### Query 2: Department Statistics
```sql
SELECT department, COUNT(*) AS students
FROM students
GROUP BY department;
```

## 🎯 Key SQL Concepts Demonstrated

- ✅ Database normalization (3NF)
- ✅ Primary & Foreign Keys
- ✅ CRUD operations
- ✅ JOIN operations (INNER, LEFT)
- ✅ Aggregate functions
- ✅ Subqueries
- ✅ Constraints (UNIQUE, CHECK, NOT NULL)
- ✅ ON DELETE CASCADE
- ✅ GROUP BY with HAVING
- ✅ Complex filtering

## 📚 Sample Data Summary

- **8 Students** across 4 departments
- **8 Courses** (CS, Electronics, Mathematics)
- **22 Grade Records** (Fall 2023, Spring 2023)
- **4 Departments**: Computer Science, Electronics, Mechanical, Civil

## 🔍 Query Categories

### Basic (3 queries)
- Display all records
- Filter by department
- Simple WHERE clauses

### Intermediate (4 queries)
- JOIN operations
- Student-course relationships
- Course enrollment

### Advanced (3 queries)
- Aggregate functions
- GROUP BY with HAVING
- Performance rankings

## 👨‍💻 Author

**Hariprasad J Kadu**
- 🎓 Electronics & Computer Engineering (2025)
- 💼 Aspiring Data Analyst | SQL Developer
- 📊 Database Design Enthusiast

## 🔗 Contact

- **LinkedIn**: [Hariprasad Kadu](https://www.linkedin.com/in/hariprasad-kadu-855382314/)
- **GitHub**: [Hari27105](https://github.com/Hari27105)
- **Email**: kaduhariprasad@gmail.com

## 📝 Technical Skills Demonstrated

- SQL query optimization
- Database design principles
- Data modeling
- Relational database concepts
- Real-world problem solving

## 🎓 Learning Outcomes

This project showcases:
- Industry-standard database design
- Complex query writing ability
- Data analysis using SQL
- Professional code documentation
- Real-world application scenarios

## 📄 License

Open source - Available for educational and portfolio purposes

## 🙏 Acknowledgments
