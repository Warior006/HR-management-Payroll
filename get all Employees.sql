USE HRDatabase;
GO

CREATE PROCEDURE dbo.uspGet_AllEmployees
AS
BEGIN
    SET NOCOUNT ON;
    SELECT EmployeeId, EmployeeFirstName, EmployeeLastName, DepartmentId, HireDate
    FROM Employees;
END
GO

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeFirstName NVARCHAR(100) NOT NULL,
    EmployeeLastName NVARCHAR(100) NOT NULL,
    DepartmentId INT NOT NULL,
    HireDate DATE NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

