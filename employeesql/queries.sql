--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s 
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees 
WHERE date_part('year', hire_date) = 1986;

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, dm.emp_no, dp.dept_name, e.first_name, e.last_name
FROM departments AS dp
INNER JOIN dept_manager AS dm ON 
dm.dept_no=dp.dept_no
 INNER JOIN employees AS e 
 ON (e.emp_no=dm.emp_no);
 
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM dep_emp AS de
INNER JOIN employees AS e
ON e.emp_no = de.emp_no
 INNER JOIN departments AS dp
 ON (de.dept_no = dp.dept_no);
--SELECT dp.dept_name, e.emp_no, e.last_name, e.first_name
--FROM departments AS dp 
--INNER JOIN dep_emp as de
--ON dp.dept_no = de.dept_no
-- INNER JOIN employees AS e 
-- ON (de.emp_no = e.emp_no);

--does it make a difference the order?

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B." (((REMEMBER TO USE 'LIKE' WHEN USING WILDCARDS)))
SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT dp.dept_name, e.emp_no, e.last_name, e.first_name 
FROM dep_emp AS de 
INNER JOIN departments AS dp
ON de.dept_no = dp.dept_no
 INNER JOIN employees AS e 
 ON de.emp_no = e.emp_no
 WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dp.dept_name, e.emp_no, e.last_name, e.first_name 
FROM dep_emp AS de 
INNER JOIN departments AS dp
ON de.dept_no = dp.dept_no
 INNER JOIN employees AS e 
 ON de.emp_no = e.emp_no
 WHERE dept_name = 'Sales' OR dept_name = 'Development';
 
-- In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;
