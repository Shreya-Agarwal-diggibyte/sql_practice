CREATE DATABASE SCHOOLDB;

USE SCHOOLDB;

--SQL CONSTRAINTS
-- PRIMARY KEY, NOT NULL,UNIQUE, CHECK ,DEFAULT

CREATE TABLE Students (
StudentID INT PRIMARY KEY,                          
Name VARCHAR(100) NOT NULL,                         
Email VARCHAR(100) UNIQUE,                          
Age INT CHECK (Age >= 18),                          
City VARCHAR(50) DEFAULT 'Unknown')

-- PRIMARY KEY , NOT NULL , CHECK

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
DurationInMonths INT CHECK (DurationInMonths > 0))

--PRIMARY KEY ,NOT NULL, FOREIGN KEY

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Students (StudentID, Name, Email, Age) VALUES (1, 'SHREYA', 'shreya@email.com', 20);
INSERT INTO Students (StudentID, Name, Email, Age, City) VALUES (2, 'MIKE', 'mike@email.com', 22, 'Delhi');

INSERT INTO Courses (CourseID, CourseName, DurationInMonths) VALUES (101, 'Math', 6);
INSERT INTO Courses (CourseID, CourseName, DurationInMonths) VALUES (102, 'Science', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID) VALUES (1001, 1, 101);
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID) VALUES (1002, 2, 102);

SELECT * FROM Students
SELECT * FROM Courses
SELECT * FROM Enrollments


