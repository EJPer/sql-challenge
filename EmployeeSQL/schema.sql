

CREATE TABLE "department" (
    "dept_no" CHAR(10)   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);


CREATE TABLE "Employeedept" (
    "employee_number" integer   NOT NULL,
    "department_no" CHAR(10)   NOT NULL,
    CONSTRAINT "pk_Employeedept" PRIMARY KEY (
        "employee_number","department_no"
     )
);



CREATE TABLE "employee_manage" (
    "dept_no" VARCHAR   NOT NULL,
	"employee_no" integer   NOT NULL,
    CONSTRAINT "pk_employee_manage" PRIMARY KEY (
        "employee_no"
     )
);


CREATE TABLE "employee_info" (
    "emp_number" Integer   NOT NULL,
    "emp_title_id" CHAR(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" CHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee_info" PRIMARY KEY (
        "emp_number"
     )
);



CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);



CREATE TABLE "title" (
    "title_id" CHAR(5)   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title"
     )
);

ALTER TABLE "Employeedept" ADD CONSTRAINT "fk_Employeedept_department_no" FOREIGN KEY("department_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "employee_manage" ADD CONSTRAINT "fk_employee_manage_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee_info" ("emp_number");
