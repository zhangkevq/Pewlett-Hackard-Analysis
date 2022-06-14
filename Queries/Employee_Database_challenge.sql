-- Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name,
				ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no
;

SELECT * FROM retirement_titles;
-- DROP TABLE retirement_titles;

-- use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
				first_name,
				last_name,
				title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;
-- DROP TABLE unique_titles;

SELECT count(title) "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2: employees eligible for mentorship program
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
							de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN titles as ti
on (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;