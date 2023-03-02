
--employee number, last name, first name, sex and salary
SELECT p1.emp_number, p1.last_name, p1.first_name,p1.sex, p2.salary
FROM "employee_info" as p1
INNER JOIN salaries as p2 ON
p1."emp_number"= p2."emp_no";

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT hire_date, first_name, last_name
from "employee_info"
where left(cast(hire_date as char(10)),4) = '1986'


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- need dept_no and employee_number from employeemanage table
-- need dept_name from departments tabe
-- need first and last name from employeeinfo table
-- join everything back to manager table

SELECT  p1.dept_no, p3.dept_name, p1.employee_no, p2.first_name, p2.last_name
FROM employee_manage as p1
INNER JOIN employee_info as p2 ON
p1."employee_no" = p2."emp_number"
INNER JOIN "department" as p3 ON
p1.dept_no = p3.dept_no
; 

--department number for each employee along with employee nubmber last and first name as well as department name
--need first and last name from employee info
--need dept_no from employee depts
--need dept_names from departments
-- join empoyee info to employee dept then employee departments to departments
SELECT p1.emp_number, p1.first_name, p1.last_name, p2."department_no" , p3.dept_name
from employee_info as p1
INNER JOIN "Employeedept" as p2 ON
p1.emp_number = p2."employee_number"
INNER JOIN department as p3 ON
p2."department_no" = p3.dept_no
;
--Find first name Hercules and last names beginning with the letter B
--no joins needed us employee info table
SELECT first_name, last_name, sex 
from employee_info
where first_name = 'Hercules' and last_name like 'B%'
;
--list employee #, first name and last name of all employees in the sales department
SELECT p1.emp_number, p1.first_name, p1.last_name, p2.department_no , p3.dept_name
from employee_info as p1
INNER JOIN "Employeedept" as p2 ON
p1.emp_number = p2.employee_number
INNER JOIN department as p3 ON
p2."department_no" = p3.dept_no
where p3.dept_name = 'Sales'
;

--list employee #, first name and last name of all employees in the sales and devlopment department
SELECT p1.emp_number, p1.first_name, p1.last_name, p2.department_no , p3.dept_name
from employee_info as p1
INNER JOIN "Employeedept" as p2 ON
p1.emp_number = p2.employee_number
INNER JOIN department as p3 ON
p2."department_no"= p3.dept_no
where p3.dept_name in ('Sales','Development')


--order frequency of employee's last names from ascending to descending order.
SELECT last_name, COUNT(*)
FROM employee_info
group by last_name
order by COUNT(*) DESC





