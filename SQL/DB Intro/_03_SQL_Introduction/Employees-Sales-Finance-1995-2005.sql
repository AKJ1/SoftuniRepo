Select Employees.FirstName, Employees.LastName, Employees.HireDate, Departments.Name from Employees
Join Departments On Employees.DepartmentID = Departments.DepartmentID
WHERE DATEDIFF(YEAR, CONVERT(date, Employees.HireDate), YEAR(1995)) < 1
AND DATEDIFF(YEAR, CONVERT(date, Employees.HireDate), YEAR(2005)) < 1
AND Departments.Name = 'Sales' OR Departments.Name = 'Finance'