-- SQL PROCEDURES
--Creating procedure with out parameter

CREATE PROCEDURE p_name 
AS
BEGIN
	SELECT * FROM StudentDetails
	
END ;

--Executing procedure
EXEC p_name

--Creating Procedure with parameters

CREATE PROCEDURE P1_NAME @ID INT
AS
BEGIN
	SELECT NAME FROM StudentDetails
	WHERE STUDENTDETAILS.S_ID = @ID;

END;

--Executing procedure
EXEC P1_NAME @ID=2;

--Creating procedure with multiple parameters

CREATE PROCEDURE MULTI_INFO @ID INT , @STUD_NAME VARCHAR(20)
AS
BEGIN 
	SELECT * FROM StudentDetails
	WHERE StudentDetails.S_ID =@ID AND StudentDetails.NAME=@STUD_NAME;

END;

--Executing procedure
EXEC MULTI_INFO @ID=4 , @STUD_NAME='Dhanraj';

--Rename the procedure

EXEC sp_rename 'MULTI_INFO','P3_NAME';

--Executing Multi_info procedure with new name

EXEC P3_NAME @ID=3 , @STUD_NAME='Pratik';