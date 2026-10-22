USE dev_db
GO

DROP TABLE IF EXISTS EmployeeErrors
CREATE TABLE EmployeeErrors(
    EmployeeID varchar(50),
    FirstName varchar(50),
    LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
('1001','Senku','Ishigami'),
('1002','Taiju','Ooki'),
('1003','Byakua','Ishigami'),
('1004','Xeno','Wingfield'),
('1005  ','GEN','Asagiri'),
('  1006','RYUsui','NanaMI - Poor')

SELECT *
FROM EmployeeErrors

SELECT EmployeeID, TRIM(EmployeeID) AS TRIM_ID
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS TRIM_ID
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS TRIM_ID
FROM EmployeeErrors

SELECT FirstName + ' ' + LastName AS Fname, FirstName + ' ' + REPLACE(Lastname, ' - Poor','') as FixedFullName
FROM EmployeeErrors

SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT Err.FirstName + " " + Err.LastName AS Fname, Emp.FirstName + " " + Emp.LastName AS Emp_Fname,SUBSTRING(Err.FirstName,1,3),SUBSTRING(Emp.FirstName,1,3)
FROM EmployeeErrors AS Err
JOIN EmployeeDemographics AS Emp
    ON SUBSTRING(Err.FirstName,1,3)=SUBSTRING(Emp.FirstName,1,3)


SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors

SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors