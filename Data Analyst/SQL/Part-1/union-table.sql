USE dev_db
GO

SELECT *
FROM EmployeeDemoGraphics 
UNION
SELECT *
FROM WareHouseEmployeeDemographics

SELECT *
FROM EmployeeDemoGraphics 
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID DESC

SELECT EmployeeID, FirstName, Age
FROM EmployeeDemoGraphics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID