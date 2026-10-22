USE dev_db
GO

SELECT *
FROM EmployeeDemoGraphics

UPDATE EmployeeDemographics
SET EmployeeID=10034
WHERE FirstName='Senku' AND LastName='Ishigami'

UPDATE EmployeeDemographics
SET EmployeeID=10035, LastName='Ooki', Gender='Male'
WHERE FirstName='Taiju'

DELETE FROM EmployeeDemographics
WHERE EmployeeID=1001