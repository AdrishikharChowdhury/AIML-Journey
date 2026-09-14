USE dev_db
GO

SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics

SELECT AVG(Age) AS AverageAge
FROM EmployeeDemographics

SELECT Demo.FirstName + ' ' + Demo.LastName AS FullName , Demo.Gender
FROM EmployeeDemographics AS Demo
ORDER BY Demo.Gender

SELECT Demo.FirstName + ' ' + Demo.LastName AS FullName , ESalary.JobTitle , ESalary.Salary
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS ESalary
    ON Demo.EmployeeID=ESalary.EmployeeID