SELECT 
	Departments.Name,
	(SELECT 
		AVG(Employees.Salary) as AvgSalary 
	FROM Employees 
	JOIN Departments On Employees.DepartmentID = Departments.DepartmentID
	WHERE Departments.Name = 'Sales') as AvgSalary
FROM Departments
WHERE Departments.Name = 'Sales'