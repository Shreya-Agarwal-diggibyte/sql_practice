--Views in database
--Creating StudentDetails and StudentMarks table

CREATE TABLE StudentDetails (
    S_ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    ADDRESS VARCHAR(255)
);

CREATE TABLE StudentMarks (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    Marks INT,
    Age INT
);


--Inserting data into the table

INSERT INTO StudentDetails (S_ID, NAME, ADDRESS)
VALUES
    (1, 'Harsh', 'Kolkata'),
    (2, 'Ashish', 'Durgapur'),
    (3, 'Pratik', 'Delhi'),
    (4, 'Dhanraj', 'Bihar'),
    (5, 'Ram', 'Rajasthan');

INSERT INTO StudentMarks (ID, NAME, Marks, Age)
VALUES
    (1, 'Harsh', 90, 19),
    (2, 'Suresh', 50, 20),
    (3, 'Pratik', 80, 19),
    (4, 'Dhanraj', 95, 21),
    (5, 'Ram', 85, 18);

SELECT * FROM StudentDetails;
SELECT * FROM StudentMarks;

--CREATING VIEW

CREATE VIEW STUDENT_DATA AS
SELECT NAME , ADDRESS
FROM StudentDetails ;

--DISPLAY VIEW

SELECT * FROM STUDENT_DATA

SELECT * FROM STUDENT_DATA ORDER BY NAME ASC
SELECT * FROM STUDENT_DATA ORDER BY NAME DESC
SELECT * FROM STUDENT_DATA ORDER BY ADDRESS DESC
SELECT * FROM STUDENT_DATA ORDER BY ADDRESS ASC


--UPDATING DATA IN STUDENT_DETAIL TABLE

UPDATE StudentDetails 
SET NAME ='KRISHNA',ADDRESS ='BENGALURU'
WHERE S_ID=5;


-- Creating a View From Multiple Tables

CREATE VIEW COMPLETE_DETAILS AS
SELECT StudentDetails.S_ID,StudentDetails.NAME ,StudentMarks.Age,StudentMarks.Marks
FROM StudentDetails ,StudentMarks 
WHERE StudentDetails.NAME = StudentMarks.NAME;

--DIPLAY VIEW

SELECT * FROM COMPLETE_DETAILS;

SELECT * FROM COMPLETE_DETAILS 
WHERE S_ID < 4;

-- Listing all Views in a Database

USE STUDENT
--SHOW FULL TABLES WHERE table_type LIKE "%VIEW";

SELECT name 
FROM sys.views;

USE STUDENT;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'dbo';


--Deleting View

DROP VIEW STUDENT_DATA;

