USE dev_db
GO

SELECT JobTitle, COUNT(JobTitle) AS CountOfJobTitle
FROM EmployeeDemographics
JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle)>1

SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemographics
JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary)>35000
ORDER BY AVG(Salary)