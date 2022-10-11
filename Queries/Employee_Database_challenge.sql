--Deliverable 1: The Number of Retiring Employees by Title
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key. (used inner join; primary key emp_no from both tables)
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955.
--verify table and export retirement_titles.csv to data folder 

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
    t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--verify table and export retiring_titles.csv to data folder 
SELECT * FROM retirement_titles;

--experiment to duplicate above table using inner join titles and dept_emp

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
    t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles2
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--verify table same as above (not saved)
SELECT * FROM retirement_titles2;

-- Use Dictinct with Orderby to remove duplicate rows
--Exclude those employees that have already left the company by
--filtering on to_date to keep only those dates that are equal to '9999-01-01'.
-- Then, order by the employee number.

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--verify table and export unique_titles.csv to data folder 
SELECT * FROM unique_titles;

--Write another query  to retrieve the number of employees by their most recent job title
--who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.
ALTER
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC; 

--verify table and export retiring_titles.csv to data folder 
SELECT * FROM retiring_titles

--Deliverable 2: The Employees Eligible for the Mentorship Program
--write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Join the Employees and the Titles tables on the primary key.
--Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are 
--between January 1, 1965 and December 31, 1965.
--Order the table by the employee number.


SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility

FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)    
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)  
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no

--verify table and export mentorship_eligibility.csv to data folder 
SELECT * FROM mentorship_eligibility;























