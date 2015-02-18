SELECT Employees.FirstName,
	   Employees.LastName,
	   Employees.Salary,
	   Departments.Name
FROM Employees
JOIN Departments on Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary = (
	SELECT MIN(Employees.Salary) as MinSalary 
	FROM Employees 
	WHERE Employees.DepartmentID = Departments.DepartmentID
) 
