-- =========== DELIVERABLE 1 ===========
-- Creating retirement_titles table
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS e
RIGHT JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Checking retirement_titles table
SELECT * FROM retirement_titles;
SELECT COUNT(title) FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows and create unique_titles table
SELECT DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Checking unique_titles table
SELECT * FROM unique_titles;
SELECT COUNT(title) FROM unique_titles;

-- Creating retiring_titles table
SELECT COUNT(emp_no) as count,title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- =========== DELIVERABLE 2 ===========
-- Creating mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
					e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- Checking mentorship_eligibility table
SELECT * FROM mentorship_eligibility;
SELECT COUNT(emp_no) FROM mentorship_eligibility;

