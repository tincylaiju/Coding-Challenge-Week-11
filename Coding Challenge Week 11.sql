-- create database company;
use company;

create table Department(DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(20),
    LOC VARCHAR(20));
    
    CREATE TABLE Employee (EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT,
    FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT(DEPTNO));
    
    CREATE TABLE Grade (GRADE INT,
    LOSAL INT,
    HISAL INT);

Insert into Department values (10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

Insert into Employee values (7369, 'SMITH', 'CLERK', 7902, DATE '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, DATE '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, DATE '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, DATE '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, DATE '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, DATE '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, DATE '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, DATE '1987-04-19', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, DATE '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, DATE '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, DATE '1987-05-23', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, DATE '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, DATE '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, DATE '1982-01-23', 1300, NULL, 10);

Insert into Grade values (1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);

-- Display all information about all employees.
Select * from employee;

-- Display the employee number, name, and salary of all employees.
Select Empno, Ename, Sal from Employee;

-- Display the unique job titles from the EMPLOYEE table.
Select Distinct job from Employee;

-- Display the employee name and their annual salary (SAL * 12).
Select Ename, sal*12 as Annual_Salary from Employee;

-- Display the details of all employees from department number 10.
Select * from Employee where Deptno = 10;

-- Display the name and job of employees who are ‘CLERK’.
Select Ename,job from Employee where job = "Clerk";

-- Display the name of employees whose name starts with ‘S’.
Select Ename from Employee Where Ename Like 'S%';

-- Display the name of employees where the second letter of their name is ‘L’.
Select Ename from Employee Where Ename Like '_L%';

-- Display the name of employees who have ‘AR’ in their name.
Select Ename from Employee Where Ename Like '%AR%';

-- Display the details of employees who were hired in the year 1981.
Select * from Employee Where Extract(Year From Hiredate) = 1981;

-- Display the name and salary of employees who earn more than 2500.
Select Ename,Sal From Employee Where Sal > 2500;

-- Display the details of employees who are not ‘MANAGER’.
Select * from Employee Where Job <> "Manager";

-- Display the details of employees who have a commission.
Select * From Employee where Comm Is Not Null;

-- Display the details of employees who do not have a manager.
Select * From Employee Where Mgr Is Null;

-- Display the names of all employees from department 30 who are ‘SALESMAN’.
Select * From Employee Where Deptno = 30 and Job = "Salesman";

-- Display the names of all ‘CLERK’s and ‘ANALYST’s.
Select Ename From Employee Where Job IN ("Clerk","Analyst");

-- Display the names of employees whose salary is between 1000 and 2000.
Select * From Employee Where Sal Between 1000 and 2000;

-- Display employee details sorted by their name in alphabetical order.
Select * From Employee Order By Ename ASC;

-- Display employee details sorted by department number, and then by salary in descending order
Select * From Employee Order By Deptno ASC, Sal DESC;

-- Display the total number of employees.
Select Count(*) AS Total_Employees From Employee;

-- Find the total salary paid to all employees.
Select Sum(Sal) AS Total_Salary From Employee;

-- Find the average salary of all employees.
Select Avg(Sal) AS Average_Salary From Employee;

-- Find the maximum and minimum salary from the EMPLOYEE table.
Select Max(Sal) AS Max_Salary, Min(Sal) AS Min_Salary From Employee;

-- Count the number of employees in each department.
Select Deptno, Count(*)  AS Total_Employees From Employee Group By Deptno;

-- Find the average salary for each job type.
Select Job,Avg(Sal) AS Average_Salary From Employee Group By Job;

-- Find the total salary for each department.
Select Deptno, Sum(Sal) AS Total_Salary From Employee Group by Deptno;

-- Display the department numbers that have more than 3 employees.
Select Deptno, Count(*) As Total_Employee From Employee Group By DeptNo Having Count(*)>3;

-- Display the jobs where the average salary is more than 2000.
Select Job, Avg(Sal) AS Average_Salary From Employee Group By Job Having Avg(Sal)>2000;

-- Display the employee name and their department name.
Select E.Ename, D.Dname From Employee E Inner Join Department D On E.Deptno = D.Deptno;

-- Display the employee name, department name, and location for all employees.
Select E.Ename, D.Dname, D.Loc From Employee E Inner Join Department D On E.Deptno = D.Deptno;

-- Display the name of the employee and the name of their manager.
Select E.Ename AS Employee, M.Ename AS Manager From Employee E Left Join Employee M ON E.Mgr = M.Empno;

-- Q: Display the employee name for those working in ‘NEW YORK’.
Select E.Ename  From Employee E Inner Join Department D ON E.Deptno= D.Deptno Where D.Loc = "New York";

-- Display the employee name, salary, and salary grade.
Select E.Ename,E.Sal,G.Grade From Employee E Inner Join Grade G On E.Sal Between G.Losal and G.Hisal;

-- Find the name of the department where ‘SMITH’ works.
Select D.Dname From Employee E Inner Join Department D On E.Deptno = D.Deptno Where Ename = "Smith";

-- Display the names of employees who earn more than ‘ALLEN’.
Select Ename From Employee Where Sal > (Select Sal From Employee Where Ename = "Allen");

-- Display the names of employees who work in the same department as ‘SCOTT’.
Select Ename From Employee Where Deptno = (Select Deptno From Employee Where Ename = "Scott");

-- Display the names of employees who have the same job as ‘JONES’.
Select Ename From Employee Where Job = (Select Job From Employee Where Ename = "Jones");

-- Display the names of managers who manage more than 2 employees.
Select Mgr, Count(*) AS Total_Employee From Employee Where Mgr IS NOT NULL Group By Mgr Having Count(*) > 2;

-- Display the employee names in lowercase.
Select lower(Ename) AS Lower_Name From Employee;

-- Display the first three characters of each employee’s name.
Select substr(Ename,1,3) AS First_3 From Employee;

-- Display the length of each employee’s name.
Select Ename, length(Ename) AS Len_Ename From Employee;

-- Display the salary of each employee rounded to the nearest thousand.
Select Ename, Round(Sal,-3) AS Rounded_Salary From Employee;

-- Display the remainder of dividing the salary by 1000 for each employee.
Select Ename, Mod(Sal,1000) As Remainder From Employee;

-- Display the current date and time.
Select Now();

-- Display the year each employee was hired.
Select Ename, Extract(Year From Hiredate) As Hired_Year From Employee;

-- Display the name of the month each employee was hired.
Select Ename, Extract(Month From Hiredate) As Hired_Month From Employee;
-- OR
Select Ename, Monthname(Hiredate) From Employee;

-- Display the number of years each employee has been with the company (assuming the current year is 2025).
Select Ename, 2025 - Year(HireDate) AS Year_OF_Service From Employee;

-- Write the SQL command to create the DEPARTMENT table with DEPTNO as the primary key.
Create Table Department(Deptno Int Primary Key,
Dname Varchar(20),
Loc Varchar(20));

-- Add a new column PINCODE of type INT to the DEPARTMENT table.
Alter Table Department Add Column Pincode Int;

-- Insert a new record for department 50, ‘HR’, located in ‘HOUSTON’ into the DEPARTMENT table.
Insert into Department(Deptno,Dname,Loc) Values (50,"HR","Houston");

-- Update the location of the ‘SALES’ department to ‘ATLANTA’.
Update Department Set Loc = "Atlanta" Where Dname = "Sales";

-- Delete the ‘OPERATIONS’ department from the table.
Delete From Department Where Dname = "Operations";