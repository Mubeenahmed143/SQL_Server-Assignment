create database office;
use office;

--Question no 01--
create table Employee(
EmpID int,
EmpName varchar(255),
DeptID int,
Designation varchar(255),
Date_Of_Birth datetime,
Salary int,
Gender varchar(50)
FOREIGN KEY (DeptID) REFERENCES DepartmentS (DeptID)
);

--Question no 04--
INSERT INTO Employee (EmpID, EmpName, DeptID, Designation, Date_Of_Birth, Salary, Gender) VALUES
(1, 'Ali Ahmed', 10, 'Software Engineer', '1990-05-15', 60000, 'Male'),
(2, 'Ayesha Khan', 20, 'HR Manager', '1985-03-22', 75000, 'Female'),
(3, 'Mohammad Usman', 40, 'Data Analyst', '1992-08-10', 58000, 'Male'),
(4, 'Fatima Zahra', 30, 'Marketing Specialist', '1988-11-05', 70000, 'Female'),
(5, 'Zainab Ali', 50, 'Recruitment Officer', '1991-07-18', 65000, 'Female'),
(6, 'Hassan Ali', 70, 'DevOps Engineer', '1993-01-27', 62000, 'Male'),
(7, 'Sarah Malik', 60, 'Sales Executive', '1987-09-30', 69000, 'Female'),
(8, 'Ahmed Raza', 10, 'System Administrator', '1990-12-21', 60000, 'Male'),
(9, 'Maria Iqbal', 20, 'HR Coordinator', '1994-04-14', 61000, 'Female'),
(10, 'Hamza Siddiqui', 70, 'Backend Developer', '1992-06-17', 62000, 'Male'),
(11, 'Sana Yousuf', 30, 'Content Writer', '1989-05-11', 57000, 'Female'),
(12, 'Bilal Khan', 50, 'Frontend Developer', '1993-08-03', 60000, 'Male'),
(13, 'Nida Aslam', 40, 'HR Assistant', '1991-10-25', 58000, 'Female'),
(14, 'Usama Javed', 60, 'Network Engineer', '1990-03-14', 61000, 'Male'),
(15, 'Rabia Tariq',20 , 'Product Manager', '1986-12-30', 75000, 'Female'),
(16, 'Tariq Mahmood', 10, 'Database Administrator', '1988-07-05', 65000, 'Male'),
(17, 'Zara Noor', 70, 'Social Media Manager', '1992-09-20', 67000, 'Female'),
(18, 'Faizan Mustafa', 10, 'Full Stack Developer', '1991-11-28', 68000, 'Male'),
(19, 'Naveed Ali', 20, 'HR Specialist', '1987-02-18', 70000, 'Male'),
(20, 'Mariam Abbas', 50, 'Business Analyst', '1989-06-09', 72000, 'Female');


--Question no 02--
create table DepartmentS(
DeptID int PRIMARY KEY,
DeptName varchar(255),
DLocation varchar(255)
);

--Question no 03--
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(10 , 'Sales' , 'Hyderabad')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(20 , 'Marketing' , 'Bombay')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(30 , 'Production' , 'Kolkatta')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(40 , 'Human Resource' , 'Pune')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(50 , 'Purchases' , 'Delhi')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(60 , 'Research & Development' , 'Bengaluru')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(70 , 'Accounts' , 'Chennai')


--Question no 05--
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(80 , 'Software House' , 'Mumbai')
INSERT INTO DepartmentS(DeptID,DeptName,DLocation) VALUES(90 , 'Checking' , 'Lucknow');


--Question no 06--
alter table Employee add HireDate date;
--Question no 06 with update query --
UPDATE Employee SET HireDate = '2009-02-02' WHERE EmpID = '20';

--Question no 07--
alter table Employee alter column Salary float;

--Question no 08--
SELECT * FROM DepartmentS;

--Question no 09--
SELECT * FROM Employee;

--Question no 10--
SELECT * FROM Employee INNER JOIN DepartmentS ON DepartmentS.DeptID = Employee.DeptID;

--Question no 11--
SELECT EmpID, UPPER(EmpName) AS Emp_Name, LOWER(Designation) AS Designation, Date_Of_Birth, Salary, Gender FROM Employee;

--Question no 12--
SELECT *, DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) AS Age FROM Employee;

--Question no 13--
SELECT * FROM Employee WHERE Designation != 'HR MANAGER';

--Question no 14--
SELECT * FROM Employee ORDER BY HireDate;  

--Question no 15--
SELECT * FROM Employee INNER JOIN DepartmentS ON DepartmentS.DeptID = Employee.DeptID WHERE DepartmentS.DeptName IN('Accounts','Purchases');

--Question no 16--
SELECT * FROM Employee WHERE Salary > 65000;

--Question no 17--
SELECT * FROM Employee WHERE Salary BETWEEN 60000 AND 65000;

--Question no 18--
SELECT * FROM Employee WHERE Designation LIKE '%MANAGER' ;

--Question no 19--
SELECT departs.*, COUNT(emp.EmpID) AS Employees FROM DepartmentS departs JOIN Employee emp 
ON departs.DeptID = emp.DeptID GROUP BY departs.DeptID, departs.DeptName, departs.DLocation;

--Question no 20--
SELECT departs.*, AVG(emp.Salary) AS AVG_Salary FROM DepartmentS departs JOIN Employee emp 
ON departs.DeptID = emp.DeptID GROUP BY departs.DeptID, departs.DeptName, departs.DLocation;

--Question no 21--
SELECT departs.*, MAX(emp.Salary) AS Max_Salary FROM DepartmentS departs JOIN Employee emp 
ON departs.DeptID = emp.DeptID GROUP BY departs.DeptID, departs.DeptName, departs.DLocation;

SELECT departs.*, MIN(emp.Salary) AS Min_Salary FROM DepartmentS departs JOIN Employee emp 
ON departs.DeptID = emp.DeptID GROUP BY departs.DeptID, departs.DeptName, departs.DLocation;

--Question no 22--
SELECT * FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--Question no 23--
SELECT * FROM Employee WHERE EmpName LIKE 'A%' ;

--Question no 24--
SELECT * FROM Employee WHERE DATEDIFF(YEAR, Date_Of_Birth, GETDATE()) <= 34 ORDER BY Date_Of_Birth;

--Question no 25 (some changes)--
SELECT * FROM Employee WHERE HireDate LIKE '2024%' OR HireDate LIKE '2022%';

--Question no 26--
SELECT * FROM Employee WHERE Gender = 'Female';

--Question no 27--
SELECT * FROM Employee WHERE Gender = 'Female' AND Salary >= 65000;

--Question no 28--
SELECT * FROM Employee WHERE Designation != 'HR Manager' AND Designation != 'Sales Executive' ;

--Question no 29--
SELECT * FROM Employee WHERE LEN(EmpName) >= 5 AND LEN(EmpName) <= 10;

--Question no 30--
UPDATE Employee SET Salary = Salary + (Salary * 10/100) WHERE Salary <= 62000;

--Question no 31--
UPDATE Employee SET Salary = Salary + (Salary * 5/100) WHERE DeptID = 20;

--Question no 32--
UPDATE Employee
SET Salary = CASE
    WHEN Salary < 65000 THEN Salary * 5/100
    WHEN Salary BETWEEN 65000 AND 70000 THEN Salary * 10/100
    WHEN Salary > 70000 THEN Salary * 15/100
END;

--Question no 33--
SELECT *, 
       HireDate, 
       DATEDIFF(YEAR, HireDate, GETDATE()) AS Experience_Years,
       CASE
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) < 1 THEN 0
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 1 AND 3 THEN 100
           WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 3 AND 5 THEN 200
           ELSE 0 
       END AS Bonus_Shares
FROM Employee;