--Employees Table 

--drop statment if needed
DROP TABLE departments

create table departments (
	dept_no VARCHAR(60),
	dept_name VARCHAR(60),
	PRIMARY KEY (dept_no)
)


--SELECT * TO CHECK
SELECT * FROM DEPARTMENTS









---------------------------------------------------------------------
--empoyee number data
--DROP IF NEEDED
drop table employee_dept

--create empoyee number table
CREATE TABLE employee_dept (
	employee_number integer not null,
	dept_no varchar(30) not null,
	primary key (employee_number, dept_no),
	foreign key (dept_no) REFERENCES DEPARTMENTS(dept_no)
	
)


--SELECT * TO CHECK
SELECT * FROM employee_dept




---------------------------------------------------------------------
--dept manger table creation
--drop table if needed
drop table employeemanage

--creating table
CREATE TABLE employeemanage (
	dept_no VARCHAR(30) not null,
	employee_number integer not null,
	PRIMARY KEY (dept_no, employee_number),
	foreign key (dept_no) REFERENCES DEPARTMENTS(dept_no)
)

--select * to check
SELECT * FROM employeemanage

select count(*) from employeemanage


---------------------------------------------------------------------
--create employee table

--drop table if needed
DROP TABLE employeeinfo


--employee info create 
CREATE TABLE employeeinfo (
	employee_number integer NOT null,
	emp_title_id VARCHAR(60),
	birth_date VARCHAR(60),
	first_name VARCHAR(60) not null,
	last_name VARCHAR(60) not null,
	sex VARCHAR(60),
	hire_date VARCHAR(60),
	primary key (first_name,last_name,birth_date, employee_number)
	
)


--select * to chec
SELECT * FROM employeeinfo

---------------------------------------------------------------------

--drop table if needed
DROP TABLE salaries

--create salaries table
CREATE TABLE salaries (
	employee_number integer not null,
	salary integer not null,
	primary key (employee_number, salary)
	
)

--select * to check
SELECT * FROM salaries

select count(*) from salaries 

---------------------------------------------------------------------

--drop table if needed
DROP TABLE titles


--create titles table
CREATE TABLE titles (
	title_id varchar(30),
	title varchar(30),
	primary key (title_id)
)


--select * to check
select * from titles

---------------------------------------------------------------------

--employee number, last name, first name, sex and salary
SELECT p1.employee_number, p1.last_name, p1.first_name,p1.sex, p2.salary
FROM employeeinfo as p1
INNER JOIN salaries as p2 ON
p1.employee_number= p2.employee_number;


--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT birth_date, first_name, last_name
from employeeinfo
where right(hire_date,4) = '1986'


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- need dept_no and employee_number from employeemanage table
-- need dept_name from departments tabe
-- need first and last name from employeeinfo table
-- join everything back to manager table

SELECT  p1.dept_no, p3.dept_name, p1.employee_number, p2.first_name, p2.last_name
FROM employeemanage as p1
INNER JOIN employeeinfo as p2 ON
p1.employee_number= p2.employee_number
INNER JOIN departments as p3 ON
p1.dept_no = p3.dept_no
; 

--department number for each employee along with employee nubmber last and first name as well as department name
--need first and last name from employee info
--need dept_no from employee depts
--need dept_names from departments
-- join empoyee info to employee dept then employee departments to departments
SELECT p1.employee_number, p1.first_name, p1.last_name, p2.dept_no , p3.dept_name
from employeeinfo as p1
INNER JOIN employee_dept as p2 ON
p1.employee_number = p2.employee_number
INNER JOIN departments as p3 ON
p2.dept_no = p3.dept_no

--Find first name Hercules and last names beginning with the letter B
--no joins needed us employee info table
SELECT first_name, last_name, sex 
from employeeinfo
where first_name = 'Hercules' and last_name like 'B%'

--list employee #, first name and last name of all employees in the sales department
SELECT p1.employee_number, p1.first_name, p1.last_name, p2.dept_no , p3.dept_name
from employeeinfo as p1
INNER JOIN employee_dept as p2 ON
p1.employee_number = p2.employee_number
INNER JOIN departments as p3 ON
p2.dept_no = p3.dept_no
where p3.dept_name = 'Sales'

--list employee #, first name and last name of all employees in the sales and devlopment department
SELECT p1.employee_number, p1.first_name, p1.last_name, p2.dept_no , p3.dept_name
from employeeinfo as p1
INNER JOIN employee_dept as p2 ON
p1.employee_number = p2.employee_number
INNER JOIN departments as p3 ON
p2.dept_no = p3.dept_no
where p3.dept_name in ('Sales','Development')

--order frequency of employee's last names from ascending to descending order.
SELECT last_name, COUNT(*)
FROM employeeinfo
group by last_name





