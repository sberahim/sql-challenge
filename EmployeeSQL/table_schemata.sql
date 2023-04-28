-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);

-- Create dept_manager table
CREATE TABLE dept_manager (
	dept_no varchar(5) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_emp table
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);