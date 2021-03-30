-- Creating tables for PH-EmployeeDB
--Deliverable1.1
--Create columns for table employees and select columns
CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	gender VARCHAR(40) NOT NULL,
	hire_date DATE NOT NULL
);
SELECT emp_no,first_name,last_name
FROM employees;

--Deliverable1.2
--Create columns for table titles and slelect columns
CREATE TABLE titles(
     emp_no INT NOT NULL,
     title VARCHAR(40) NOT NULL,
     from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Deliverable1.3-1.7
--select columns from joined title and employee tables and make into a new table called retirement_title
select e.emp_no, e.first_name, e.last_name, 
e.birth_date,t.from_date,t.to_date,t.title
into retirement_title
from employees e
inner join titles t
on e.emp_no= t.emp_no
order by e.emp_no
--Deliverable1.8
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no,to_date DESC;
--Deliverable1.10
--export retirement_title table into csv

Deliverable1.11-1.12
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title
into unique_titles
from employees e
inner join titles t
on e.emp_no= t.emp_no
order by e.emp_no,to_date DESC
Deliverable1.13
--export unique titles to csv
--Deliverable1.16-1.18
select count(title), title 
from unique_titles
group by title
order by count(title) DESC;
--Deliverable1.19
--export retiring_titles to csv

--Deliverable2
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, 
e.birth_date,d.from_date,d.to_date,t.title
into mentorship_eligibilty
from employees e
inner join dept_emp d 
on d.emp_no =e.emp_no
inner join titles t
on e.emp_no= t.emp_no
where (e.birth_date between '1965-01-01' and '1965-12-31') and
d.to_date='9999-01-01'
order by e.emp_no
--export retirement_titles,unique_titles,retiring_titles

Deliverable3
select count(title), title 
from mentorship_eligibilty
group by title
order by count(title) DESC;


