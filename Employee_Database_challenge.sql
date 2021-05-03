-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
    ti.from_date,
    ti.to_date
Into retirement_titles
FROM titles AS ti
JOIN employees AS e
ON ti.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

Select * From retirement_titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
	rt.last_name,
	rt.title
Into unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

--Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
  	de.from_date,
	de.to_date,
	ti.title
Into mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (ti.to_date = '9999-01-01')
ORDER BY e.emp_no;
