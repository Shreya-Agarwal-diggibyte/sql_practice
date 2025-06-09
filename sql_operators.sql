-- SQL OPERATOR
-- Arithmetic Operator

--Addition
SELECT Name, Salary, Salary + 1000 AS SalaryWithBonus FROM Employees;

--Multiplication
SELECT Name, Age * 2  AS DoubleAge FROM Employees;

--Subtraction
SELECT Name,Salary, Salary - 5000 AS ReducedSalary FROM Employees WHERE EmpID=6;

--Division
SELECT Name, Salary / 2 AS HalfSalary FROM Employees WHERE NAME='E';

--Modulus
SELECT Name, Age % 2 AS AgeModulus FROM Employees;

--Comparison Operators
-- Equal (=)
SELECT * FROM Employees WHERE Department = 'Finance';

-- Not Equal (!= or <>)
SELECT * FROM Employees WHERE Department <> 'HR';

-- Greater Than (>)
SELECT * FROM Employees WHERE Salary > 70000;

-- Less Than (<)
SELECT * FROM Employees WHERE Age < 30;

-- Greater Than or Equal To (>=)
SELECT * FROM Employees WHERE Age >= 30;

-- Less Than or Equal To (<=)
SELECT * FROM Employees WHERE Salary <= 70000;

-- Logical Operators
-- AND
SELECT * FROM Employees WHERE Department = 'IT' AND Salary > 80000;

-- OR
SELECT * FROM Employees WHERE Department = 'HR' OR Department = 'Finance';

-- NOT
SELECT * FROM Employees WHERE NOT Department = 'IT';

--Bitwise Operators
-- AND (&)
SELECT 5 & 3 AS BitwiseAND;  

-- OR (|)
SELECT 5 | 3 AS BitwiseOR;    

-- XOR (^)
SELECT 5 ^ 3 AS BitwiseXOR;   


--Set Operator
-- IN
SELECT *
FROM Employees 
WHERE Department IN ('HR', 'IT', 'Finance');

-- NOT IN
SELECT * FROM Employees WHERE Department NOT IN ('HR', 'Finance');

-- BETWEEN
SELECT * FROM Employees WHERE Salary BETWEEN 60000 AND 90000;

-- NOT BETWEEN
SELECT * FROM Employees WHERE Age NOT BETWEEN 28 AND 35;

--Pattern Matching Operators 
-- Starts with 'A'
SELECT * FROM Employees WHERE Name LIKE 'A%';

-- Ends with 'e'
SELECT * FROM Employees WHERE Name LIKE '%e';

-- Contains 'a'
SELECT * FROM Employees WHERE Name LIKE '%a%';

-- NOT LIKE
SELECT * FROM Employees WHERE Name NOT LIKE '%a%';

-- Null Check Operator
-- Add Bonus column (if not exists)
ALTER TABLE Employees ADD Bonus DECIMAL(10,2);
SELECT * FROM Employees

-- Update some rows
UPDATE Employees SET Bonus = 2000 WHERE EmpID IN (2, 4, 6);

-- IS NULL
SELECT * FROM Employees WHERE Bonus IS NULL;

-- IS NOT NULL
SELECT * FROM Employees WHERE Bonus IS NOT NULL;
