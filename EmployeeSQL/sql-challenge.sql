
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