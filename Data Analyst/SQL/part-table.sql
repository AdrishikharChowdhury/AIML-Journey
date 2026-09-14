USE dev_db
GO

SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM EmployeeDemoGraphics AS Demo
JOIN EmployeeSalary AS Sal
    ON Demo.EmployeeID=Sal.EmployeeID