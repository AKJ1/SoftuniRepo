SELECT 
	CONCAT(Employees.FirstName,' ', Employees.LastName) as EmployeeName,
	CONCAT(Managers.FirstName,' ', Managers.LastName) as ManagerName
FROM Employees
JOIN Employees AS Managers On Employees.ManagerID = Managers.EmployeeID