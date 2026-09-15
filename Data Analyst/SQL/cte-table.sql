USE dev_db
GO

WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, JobTitle, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender, AVG(Salary) OVER (PARTITION BY Salary) as AverageSalary
FROM EmployeeDemographics AS Emp
JOIN EmployeeSalary AS Sal
    ON Emp.EmployeeID=Sal.EmployeeID
    WHERE Salary >= 35000
)
SELECT FirstName + ' ' + LastName AS FullName, JobTitle, AverageSalary 
FROM CTE_Employee