USE dev_db
GO

SELECT *
FROM EmployeeDemoGraphics
WHERE FirstName = 'Adrishikhar'

SELECT *
FROM EmployeeDemoGraphics
WHERE FirstName <> 'Adrishikhar'

SELECT *
FROM EmployeeDemoGraphics
WHERE Age <= 21 AND Gender='Female'

SELECT *
FROM EmployeeDemoGraphics
WHERE Age < 21 OR Gender='Female'

SELECT *
FROM EmployeeDemoGraphics
WHERE LastName LIKE 'G%'

SELECT *
FROM EmployeeDemoGraphics
WHERE LastName IS NOT NULL

SELECT *
FROM EmployeeDemoGraphics
WHERE LastName IN ('Ghosh')