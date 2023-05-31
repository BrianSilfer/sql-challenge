
--Data Analysis

-- Q1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no as employee_number, e.last_name as last_name, e.first_name as first_name, e.sex as sex, s.salary as salary
	FROM employees as e 
	JOIN salaries as s
	ON (e.emp_no = s.emp_no)
	
;


--Q2) List the first name, last name, and hire date for the 
--employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') LIKE '1986%'
;

--Q3) List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT m.emp_no as employee_number, d.dept_name as department_name,  e.last_name as last_name, e.first_name as first_name
	FROM employees as e 
	JOIN dep_manager as m
	ON (e.emp_no = m.emp_no)
		JOIN departments as d
		ON (d.dept_no = m.dept_no)
;

--Q4) List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.
SELECT dpt.dept_no as department_number, e.emp_no as employee_number,
e.last_name as last_name, e.first_name as first_name, d.dept_name
	FROM employees as e
	JOIN dep_employee as dpt
	ON (dpt.emp_no=e.emp_no)
		JOIN departments as d
		ON (d.dept_no=dpt.dept_no)
;

--Q5)List first name, last name, and sex of each employee whose first 
--name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

--Q6)List each employee in the Sales department,
--including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
	FROM employees as e
	JOIN dep_employee as dpt
	ON (dpt.emp_no=e.emp_no)
		JOIN departments as d
		ON (d.dept_no=dpt.dept_no)
	WHERE d.dept_name = 'Sales'
;

--Q7) List each employee in the Sales and Development departments, including their 
--employee number,last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees as e
	JOIN dep_employee as dpt
	ON (dpt.emp_no=e.emp_no)
		JOIN departments as d
		ON (d.dept_no=dpt.dept_no)
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;

--Q8)List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).

SELECT e.last_name, COUNT(e.last_name)
FROM employees as e
GROUP BY e.last_name
ORDER BY e.last_name DESC
;
