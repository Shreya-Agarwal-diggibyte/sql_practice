CREATE DATABASE COMPANYDB
USE COMPANYDB

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT
);

INSERT INTO Employees (EmpID, Name, Department, Salary, Age) VALUES
(1, 'A', 'HR', 60000, 30),
(2, 'B', 'Finance', 75000, 28),
(3, 'C', 'HR', 50000, 35),
(4, 'D', 'IT', 85000, 32),
(5, 'E', 'Finance', 70000, 45),
(6, 'F', 'IT', 95000, 29),
(7, 'G', 'Marketing', 45000, 26),
(8, 'H', 'IT', 80000, 31);

SELECT * FROM Employees

--SQL CLAUSES
-- SELECT CLAUSE

SELECT Name, Salary FROM Employees;

--WHERE CLAUSE

SELECT * FROM Employees WHERE Salary > 50000;

--ORDER BY CLAUSE

SELECT Name, Salary FROM Employees ORDER BY Salary DESC;

SELECT Name, Salary FROM Employees ORDER BY NAME DESC;

--GROUP BY CLAUSE

SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department;

--HAVING CLAUSE

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 80000;

--DISTINCT CLAUSE

SELECT DISTINCT Department FROM Employees;

--IN CLAUSE

SELECT * FROM Employees WHERE Department IN ('FINANCE', 'HR');

--BETWEEN CLAUSE

SELECT * FROM Employees WHERE Salary BETWEEN 50000 AND 90000;


--LIKE CLAUSE

UPDATE Employees SET NAME ='AARU' WHERE EMPID =1
UPDATE Employees SET NAME = 'SNEHA' WHERE EMPID=2;


SELECT * FROM Employees WHERE Name LIKE 'A%'; 

SELECT * FROM Employees WHERE Name LIKE '%A';  



