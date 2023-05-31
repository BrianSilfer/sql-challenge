
CREATE TABLE Titles (
    title_id VARCHAR(30) PRIMARY KEY NOT NULL,
    title VARCHAR(30)
);

CREATE TABLE Employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date DATE  NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)  NOT NULL,
    sex VARCHAR(30),
    hire_date DATE ,
    FOREIGN KEY(emp_title_id) REFERENCES Titles(title_id) 
);

CREATE TABLE Departments (
    dept_no VARCHAR(30) PRIMARY KEY NOT NULL ,
    dept_name VARCHAR(30)   NOT NULL
   
);

CREATE TABLE Dep_Employee (
    emp_no INT  NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
    CONSTRAINT pk_Dep_Employee PRIMARY KEY (emp_no,dept_no))
;
	

CREATE TABLE dep_manager (
    dept_no VARCHAR (30)   NOT NULL,
    emp_no INT   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
    CONSTRAINT pk_dep_manager PRIMARY KEY (
        dept_no,emp_no
     )
);



CREATE TABLE Salaries (
    emp_no INT  NOT NULL,
    salary INT 
);

--Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no as employee_number, e.last_name as last_name, e.first_name as first_name, e.sex as sex, s.salary as salary
	FROM employees as e 
	JOIN salaries as s
	ON (e.emp_no = s.emp_no)
	
;


--List the first name, last name, and hire date for the 
--employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') LIKE '1986%'
;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT m.emp_no as employee_number, d.dept_name as department_name,  e.last_name as last_name, e.first_name as first_name
	FROM employees as e 
	JOIN dep_manager as m
	ON (e.emp_no = m.emp_no)
		JOIN departments as d
		ON (d.dept_no = m.dept_no)
;