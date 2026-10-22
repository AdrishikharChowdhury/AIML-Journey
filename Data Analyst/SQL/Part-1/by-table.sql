USE dev_db
GO

SELECT *
FROM EmployeeDemoGraphics

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemoGraphics
GROUP BY Gender, Age

SELECT Gender, Age, FirstName, COUNT(Gender) AS CountGender
FROM EmployeeDemoGraphics
WHERE Age<21 AND Gender='Female'
GROUP BY Gender, Age, FirstName
ORDER BY CountGender

SELECT Gender, Age, FirstName, COUNT(Gender) AS CountGender
FROM EmployeeDemoGraphics
WHERE Age<=21
GROUP BY Gender, Age, FirstName
ORDER BY Gender

SELECT *
FROM EmployeeDemoGraphics
ORDER BY Age , Gender DESC
