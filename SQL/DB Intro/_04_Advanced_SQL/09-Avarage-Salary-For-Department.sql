SELECT AVG(Employees.Salary) as AvgSalary 
FROM Employees 
JOIN Departments on Employees.DepartmentID = Departments.DepartmentID
	WHERE Employees.DepartmentID = '1') 
	

