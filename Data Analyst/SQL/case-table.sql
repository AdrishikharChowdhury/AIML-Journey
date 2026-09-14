USE dev_db
GO

SELECT FirstName, LastName, Age,
CASE
    WHEN Age <30 THEN 'YOUNG'
    ELSE 'OLD'
END AS AgeGroup
FROM EmployeeDemoGraphics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
    WHEN Age >30 THEN 'OLD'
    WHEN Age BETWEEN 25 AND 30 THEN 'MIDDLE'
    ELSE 'YOUNG'
END AS AgeGroup
FROM EmployeeDemoGraphics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
    WHEN JobTitle = 'Sales Manager' THEN Salary*1.1
    WHEN JobTitle='ML Engineer' THEN Salary*1.05
    WHEN JobTitle='ML Engineer' THEN Salary*1.00001
    ELSE Salary*1.03
END AS UpdatedSalary
FROM EmployeeDemoGraphics
JOIN EmployeeSalary
    ON EmployeeDemoGraphics.EmployeeID = EmployeeSalary.EmployeeID
