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
drop employee_dept

--create empoyee number table
CREATE TABLE employee_dept (
	employee_number integer not null,
	dept_no varchar(30) not null,
	primary key (employee_number),
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
	employee_number integer not null,
	dept_no VARCHAR(30) not null,
	foreign key employee_dept,
	foreign key (dept_no) REFERENCES DEPARTMENTS(dept_no)
)

--select * to check
SELECT * FROM employeemanage


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
	foreign key  (employee_number) REFERENCES employeenumbers()
	
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
	foreign key (employee_number) REFERENCES employeenumbers(employee_number)
	
)

--select * to check
SELECT * FROM salaries

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
















