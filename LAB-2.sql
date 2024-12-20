-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

--Part – A
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
CREATE OR ALTER PROCEDURE PR_Department_INSERT
	@DEPTID INT , @DEPTNAME VARCHAR(50)
AS
BEGIN
	INSERT INTO Department
	VALUES(@DEPTID , @DEPTNAME)
END

exec PR_Department_INSERT 1,'Admin';
exec PR_Department_INSERT 2,'IT';
exec PR_Department_INSERT 3,'HR';
exec PR_Department_INSERT 4,'Account';

select *from Department

CREATE OR ALTER PROCEDURE PR_Designation_INSERT
	@DESID INT , @DESNAME VARCHAR(50)
AS
BEGIN
	INSERT INTO Designation
	VALUES(@DESID , @DESNAME)
END

EXEC PR_Designation_INSERT 11 , 'jobber';
EXEC PR_Designation_INSERT 12 , 'Welder';
EXEC PR_Designation_INSERT 13 , 'Clerk';
EXEC PR_Designation_INSERT 14 , 'Manager';
EXEC PR_Designation_INSERT 15 , 'CEO';

select *from Designation

CREATE OR ALTER PROCEDURE PR_Person_INSERT
	 @fname VARCHAR(50) , @lname varchar(50) , 
	@salary int , @joinDate Datetime , @deptid int ,@DESID int
AS
BEGIN
	INSERT INTO Person(FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
	VALUES(@fname , @lname  , @salary , @joinDate , @deptid , @DESID)
END

exec PR_Person_INSERT  'Rahul', 'Anshu', 56000,'1990-01-01' , 1,12
exec PR_Person_INSERT  'Hardik' , 'Hinsu', 18000, '1990-09-25', 2, 11
exec PR_Person_INSERT  'Bhavin', 'Kamani', 25000, '1991-05-14' ,NULL, 11
exec PR_Person_INSERT  'Bhoomi', 'Patel' ,39000, '2014-02-20', 1 ,13
exec PR_Person_INSERT  'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
exec PR_Person_INSERT  'Priya' ,'Mehta' ,25000, '1990-10-18', 2, NULL
exec PR_Person_INSERT  'Neha', 'Trivedi', 18000 ,'2014-02-20', 3, 15

select *from Person

create or alter procedure pr_Department_update
	@deptid int , @deptname varchar(50)
as
begin
	update Department
	set DepartmentName = @deptname
	where DepartmentID = @deptid
end

exec pr_Department_update 1 , 'abc'
--designation
create or alter procedure pr_Designation_update
	@desiid int , @desiname varchar(50)
as
begin
	update Designation
	set DesignationName = @desiname
	where DesignationID = @desiid
end

exec pr_Designation_update 11,'birva';

--person
create or alter procedure pr_person_update
	 @pid int,@fname VARCHAR(50) , @lname varchar(50) , 
	@salary int , @joinDate Datetime , @deptid int ,@DESID int
as
begin
	update Person
	set FirstName = @fname , LastName= @lname, Salary = @salary, JoiningDate= @joinDate, DepartmentID = @deptid, DesignationID=@DESID
	where PersonID = @Pid
end

exec pr_person_update 104,'Birva', 'Patel' ,39000, '2014-02-20', 1 ,13

--delete
create or alter procedure pr_department_delete
	@deptid int
as
begin
	delete from Department
	where DepartmentID = @deptid
end

exec pr_department_delete 11
exec pr_department_delete 12
exec pr_department_delete 13
exec pr_department_delete 14
exec pr_department_delete 15

create or alter procedure pr_Designation_delete
	@desid int
as
begin
	delete from Designation
	where DesignationID = @desid
end

create or alter procedure pr_Person_delete
	@pid int
as
begin
	delete from Person
	where PersonID = @pid
end

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
create or alter procedure pr_department_select
	@deptid int
as
begin
	select *from Department
	where DepartmentID = @deptid
end
--designation
create or alter procedure pr_Designation_select
	@desid int
as
begin
	select *from Designation
	where DesignationID = @desid
end
--person
create or alter procedure pr_Person_select
	@pid int
as
begin
	select *from Person
	where PersonID = @pid
end

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
--columns on select list)
--person
create or alter procedure pr_person_selectall
as
begin
	select *from Person p
	join Department d
	on p.DepartmentID = d.DepartmentID
	join Designation de
	on p.DesignationID = de.DesignationID
end

exec pr_person_selectall
--Department
create or alter procedure pr_Department_selectall
as
begin
	select *from Department 
end

exec pr_Department_selectall

--Designation
create or alter procedure pr_Designation_selectall
as
begin
	select *from Designation 
end

exec pr_Designation_selectall

--4. Create a Procedure that shows details of the first 3 persons.
create or alter procedure pr_person_top3
as
begin
	select top 3 *from person p
	join Department d
	on p.DepartmentID = d.DepartmentID
	join Designation de
	on p.DesignationID = de.DesignationID
end

exec pr_person_top3

--Part – B
--5. Create a Procedure that takes the department name as input and returns a table with all workers
--working in that department.
create or alter procedure pr_person_deptname
 @deptname varchar(50)
as
begin
	select *from person p
	join Department d
	on p.DepartmentID = d.DepartmentID
	join Designation de
	on p.DesignationID = de.DesignationID
	where  DepartmentName=@deptname
end
exec pr_person_deptname 'abc'
--6. Create Procedure that takes department name & designation name as input and returns a table with
--worker’s first name, salary, joining date & department name.
create or alter procedure pr_person_deptnameanddesname
 @deptname varchar(50) , @desname varchar(50)
as
begin
	select *from person p
	join Department d
	on p.DepartmentID = d.DepartmentID
	join Designation de
	on p.DesignationID = de.DesignationID
	where  DepartmentName=@deptname and DesignationName=@desname
end
exec pr_person_deptnameanddesname 'abc' , 'Welder'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the
--worker with their department & designation name.
--8. Create Procedure which displays department wise maximum, minimum & total salaries.
--9. Create Procedure which displays designation wise average & total salaries.