SELECT Departments.Name,
	(SELECT 
		AVG(Employees.Salary) as AvgSalary 
	FROM Employees 
	WHERE Employees.DepartmentID = '1') as AvgSalary
FROM Departments
WHERE Departments.DepartmentID = '1'