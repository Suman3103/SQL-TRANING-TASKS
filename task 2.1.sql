-- task 2.1
--  creatinig department table

create table  department(
	department_id int primary key ,
    department_name varchar(50) not null,
    location varchar(30),
    manager_name varchar(50),
    budget decimal(20,2));
    
--  we need a foreign key in the employee table to link it with department table so adding department_ id in empployee table

alter table employee 
add column department_id int; 


-- updating employee table with respect to department 
update employee
set department_id = case
when department = 'hr' then 10
when department = 'finance' then 20
when department = 'it' then 30
when department = 'operations' then 40
when department = 'sales' then 50
when department = 'marketing' then 60
end;
--  droping department  from employee table because we already have it in department table
alter table employee
drop column department;
-- inserting values into department table before creating foreign key in employee table
insert into department (department_id, department_name, location, manager_name,budget)
values (10, 'hr', 'bangalore', 'vijay sharma', 5000000),
	   (20,'finance', 'Bangalore', 'Rahul Sharma', 5000000.00),
(30,'it', 'Mumbai', 'Priya Verma', 2000000.00),
(40,'operations', 'Delhi', 'Amit Kumar', 3500000.00),
(50,'sales','chennai','rohan das',4500000),
(60,'marketing','delhi','Meera iyer',300000);
-- adding foreign key in employee table
alter table  employee
add foreign key (department_id) references department(department_id); 

-- creating project table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    budget DECIMAL(12,2)
);

-- inserting values into to projrct table

INSERT INTO projects 
(project_id, project_name, start_date, end_date, status, budget)
VALUES
(1, 'HR Portal', '2023-01-10', '2023-06-30', 'Completed', 150000),
(2, 'Finance System', '2022-07-01', '2023-02-28', 'Completed', 80000),
(3, 'IT Infrastructure', '2023-03-15', '2024-01-31', 'Active', 300000),
(4, 'Sales Dashboard', '2024-02-01', '2024-08-31', 'Active', 75000),
(5, 'Marketing Campaign', '2023-05-01', '2023-11-30', 'Completed', 90000),
(6, 'Operations Audit', '2023-09-01', '2024-06-30', 'On Hold', 120000),
(7, 'Cloud Migration', '2023-11-01', '2024-10-31', 'Active', 400000);

-- creating employee projects table  and linking both employee and projects table into employee_project
CREATE TABLE employee_projects (
    ep_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    assigned_date DATE,
    hours_worked INT,
    foreign key (employee_id) references employee(id),
    foreign key(project_id) references projects(project_id)
);
-- inserting values into employee_project table
INSERT INTO employee_projects
(ep_id, employee_id, project_id, role, assigned_date, hours_worked)
VALUES
(1, 1, 1, 'Manager', '2023-01-10', 120),
(2, 2, 1, 'Developer', '2023-01-15', 100),
(3, 7, 2, 'Analyst', '2022-07-01', 150),
(4, 13, 2, 'Developer', '2022-07-05', 130),
(5, 3, 3, 'Tester', '2023-03-15', 80),
(6, 5, 3, 'Developer', '2023-03-20', 200),
(7, 9, 3, 'Manager', '2023-03-25', 180),
(8, 19, 3, 'Developer', '2023-04-01', 220),
(9, 10, 4, 'Analyst', '2024-02-01', 90),
(10, 16, 4, 'Tester', '2024-02-05', 75),
(11, 8, 5, 'Manager', '2023-05-01', 110),
(12, 14, 5, 'Developer', '2023-05-10', 95),
(13, 11, 6, 'Analyst', '2023-09-01', 140),
(14, 17, 6, 'Developer', '2023-09-05', 160),
(15, 6, 7, 'Developer', '2023-11-01', 170);
