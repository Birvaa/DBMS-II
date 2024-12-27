--Part – A
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_HELLOWORLD()
RETURNS VARCHAR(50)
AS
BEGIN 
	RETURN 'HELLO WORLD'
END
SELECT DBO.FN_HELLOWORLD()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADD(@N1 INT,@N2 INT)
RETURNS INT
AS
BEGIN 
	RETURN @N1+@N2
END
SELECT DBO.FN_ADD(14,17)

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_OddOrEven(@N1 INT)
RETURNS VARCHAR(500)
AS
BEGIN 
	IF @N1%2=0
		RETURN 'EVEN'
	RETURN 'ODD'
END

SELECT DBO.FN_OddOrEven(14);

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_NAME()
RETURNS TABLE
AS
	RETURN
	SELECT *FROM PERSON WHERE FirstName LIKE 'B%'
SELECT *FROM DBO.FN_NAME()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_DISTINCT_NAME()
RETURNS TABLE
AS
	RETURN
	SELECT DISTINCT FirstName FROM PERSON
SELECT *FROM DBO.FN_DISTINCT_NAME()

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_PRINT(@N1 INT)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @I INT,@ANS VARCHAR(50)
	SET @I = 1
	SET @ANS = ''
	WHILE @I <= @N1 
		BEGIN 
			SET @ANS = @ANS +' '+ CAST(@I AS VARCHAR(50))
			SET @I = @I + 1
		END
	RETURN @ANS
END

SELECT DBO.FN_PRINT(14)

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_Factorial(@N INT)
RETURNS INT
AS
BEGIN
	DECLARE @ANS INT
	SET @ANS = 1
	WHILE @N > 0
		BEGIN 
			SET @ANS = @ANS * @N
			SET @N = @N-1
		END
	RETURN @ANS
END

SELECT DBO.FN_Factorial(3)

--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARE(@N1 INT,@N2 INT)
RETURNS VARCHAR(500)
AS
BEGIN
	RETURN CASE
		WHEN @N1 > @N2 THEN  CAST (@N1 AS VARCHAR(50))+' IS GREATER THAN '+CAST (@N2 AS VARCHAR(50))
		WHEN @N1 < @N2 THEN  CAST (@N2 AS VARCHAR(50))+' IS GREATER THAN '+CAST (@N1 AS VARCHAR(50))
		WHEN @N1 = @N2 THEN  'BOTH ARE SAME.'
		END
END
SELECT DBO.FN_COMPARE(15,15)

--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_Even_Sum()
RETURNS INT
AS
BEGIN 
	DECLARE @N1 INT,@ANS INT
	SET @N1 = 1
	SET @ANS = 0
	WHILE @N1 <= 20
	BEGIN
		IF @N1%2=0
			SET @ANS = @ANS + @N1
			SET @N1 = @N1 + 1
	END
	RETURN @ANS
END

SELECT DBO.FN_Even_Sum()

--10. Write a function that checks if a given string is a palindromeCREATE OR ALTER FUNCTION FN_IsPalindrom(@NUM VARCHAR(500))
RETURNS VARCHAR(500)
AS
BEGIN 
	DECLARE @STR VARCHAR(50)
	SET @STR = REVERSE(@NUM)
	IF @NUM = @STR
		RETURN @NUM+' IS PALINDROM'
	RETURN @NUM+' IS NOT PALINDROM'
END

SELECT DBO.FN_IsPalindrom('ORIO')

--Part – C
--11. Write a function to check whether a given number is prime or not.
CREATE OR ALTER FUNCTION FN_PRIME(@N INT)
RETURNS VARCHAR(50)
AS
BEGIN 
	DECLARE @I INT
	SET @I = 2
	WHILE @I < @N
		BEGIN
			IF @N % @I = 0
				RETURN 'NOT PRIME'
			SET @I = @I + 1
		END
	RETURN 'PRIME'
END
SELECT DBO.FN_PRIME(5)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.

--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.