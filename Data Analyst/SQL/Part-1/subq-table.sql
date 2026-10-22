USE dev_db
GO

SELECT *
FROM EmployeeSalary AS Sal

SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary AS Sal) AS AllAverageSalary
FROM EmployeeSalary AS Sal

SELECT EmployeeID, Salary, AVG(Salary) OVER() AS AllAverageSalary
FROM EmployeeSalary AS Sal

SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary AS Sal) AS AllAverageSalary
FROM EmployeeSalary AS Sal


SELECT Asal.EmployeeID, AllAverageSalary
FROM (
    SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary AS Sal) AS AllAverageSalary
    FROM EmployeeSalary AS Sal
) AS ASal

SELECT Sal.EmployeeID, Emp.FirstName, Sal.JobTitle, Sal.Salary
FROM EmployeeSalary AS Sal
WHERE Sal.EmployeeID IN (
    SELECT Emp.EmployeeID 
    FROM EmployeeDemoGraphics AS Emp
    WHERE Age<25
)
