USE dev_db
GO

CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics AS Emp

EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics AS Emp
JOIN EmployeeSalary AS Sal
    ON Emp.EmployeeID=Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_employee

EXEC Temp_Employee

ALTER PROCEDURE Temp_Employee
@JobTitle nvarchar(100)
AS
CREATE TABLE #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, COUNT(Sal.JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics AS Emp
JOIN EmployeeSalary AS Sal
    ON Emp.EmployeeID=Sal.EmployeeID
WHERE JobTitle=@JobTitle
GROUP BY JobTitle

SELECT *
FROM #temp_employee

EXEC Temp_Employee @JobTitle='ML Engineer'
EXEC Temp_Employee @JobTitle='Python Developer'