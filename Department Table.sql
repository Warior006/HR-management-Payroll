CREATE PROCEDURE dbo.uspGet_AllEmployees
AS
CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeFirstName NVARCHAR(100) NOT NULL,
    EmployeeLastName NVARCHAR(100) NOT NULL,
    DepartmentId INT NOT NULL,
    HireDate DATE NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);


BEGIN
    SET NOCOUNT ON;
    SELECT EmployeeId, EmployeeFirstName, EmployeeLastName, DepartmentId, HireDate
    FROM Employees;
END

INSERT INTO Departments (DepartmentName) VALUES ('IT'), ('HR');

INSERT INTO Employees (EmployeeFirstName, EmployeeLastName, DepartmentId, HireDate)
VALUES ('Afzal', 'Khan', 1, '2026-06-29'),
       ('Sara', 'Ali', 2, '2026-05-15');
EXEC dbo.uspGet_AllEmployees;

