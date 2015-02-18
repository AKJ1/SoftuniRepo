SELECT 
	Employees.FirstName,
	Employees.LastName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.Name = 'Sales'