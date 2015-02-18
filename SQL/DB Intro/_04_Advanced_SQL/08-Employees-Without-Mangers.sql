SELECT Count(Employees.ManagerID) FROM Employees
LEFT JOIN Employees as Managers ON Employees.ManagerID = Managers.EmployeeID
Where Managers.ManagerID IS NULL