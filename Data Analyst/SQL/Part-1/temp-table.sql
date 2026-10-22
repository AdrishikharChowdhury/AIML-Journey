USE dev_db
GO

DROP TABLE IF EXISTS #temp_Employee
CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(50),
Salary int
)

INSERT INTO #temp_Employee VALUES
(10035, 'HR', 45000)

INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary AS Sal


SELECT *
FROM #temp_Employee

DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2(
    JobTitle varchar(50),
    EmployeesPerJob int,
    AvgSalary int,
    AvgAge int
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Salary), AVG(Age)
FROM EmployeeDemoGraphics AS Emp
JOIN EmployeeSalary AS Sal
    ON Emp.EmployeeID=Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2