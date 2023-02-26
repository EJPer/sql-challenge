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
















