USE dev_db
GO

SELECT *
FROM EmployeeDemoGraphics
Inner Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemoGraphics
Full Outer Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemoGraphics
Left Outer Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemoGraphics
Right Outer Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemoGraphics
Inner Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemoGraphics
Inner Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE Firstname <> 'Adrishikhar'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemoGraphics
Inner Join EmployeeSalary
    ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE JobTitle='Web Developer'
GROUP BY JobTitle

SELECT *
FROM EmployeeDemographics
Full Outer Join WareHouseEmployeeDemographics
    ON EmployeeDemographics.EmployeeID=WareHouseEmployeeDemographics.EmployeeID