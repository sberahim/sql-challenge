-- List the employee number, last name, first name, sex, 
-- and salary of each employee

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
LEFT JOIN salaries as sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

-- List the first name, last name, and hire date for the employees 
-- who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('Year', hire_date) = '1986';

-- List the manager of each department along with their department 
-- number, department name, employee number, last name, and first name

SELECT dept.dept_no, dept.dept_name, deptm.emp_no, emp.last_name, emp.first_name
FROM departments as dept
LEFT JOIN dept_manager as deptm
ON dept.dept_no = deptm.dept_no
LEFT JOIN employees as emp
ON deptm.emp_no = emp.emp_no;

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name

SELECT dept.dept_no, depemp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments as dept
LEFT JOIN dept_emp as depemp
ON dept.dept_no = depemp.dept_no
LEFT JOIN employees as emp
ON depemp.emp_no = emp.emp_no
ORDER BY depemp.emp_no;

-- List first name, last name, and sex of each employee whose first
-- name is Hercules and whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List each employee in the Sales department, including their employee 
-- number, last name, and first name

SELECT depemp.emp_no, emp.last_name, emp.first_name
FROM departments as dept
LEFT JOIN dept_emp as depemp
ON dept.dept_no = depemp.dept_no
LEFT JOIN employees as emp
ON depemp.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales'
ORDER BY depemp.emp_no;

-- List each employee in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name

SELECT depemp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments as dept
LEFT JOIN dept_emp as depemp
ON dept.dept_no = depemp.dept_no
LEFT JOIN employees as emp
ON depemp.emp_no = emp.emp_no
WHERE dept.dept_name in ('Sales', 'Development')
ORDER BY depemp.emp_no;

-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name)

SELECT last_name, Count(*) as frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;