USE dev_db
GO

SELECT FirstName, LastName
FROM EmployeeDemoGraphics

SELECT DISTINCT(Gender)
FROM EmployeeDemoGraphics

SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemoGraphics

SELECT MAX(Salary) AS MaxSalary
FROM EmployeeSalary

SELECT MIN(Salary) AS MinSalary
FROM EmployeeSalary

SELECT AVG(Salary) AS AvgSalary
FROM EmployeeSalary