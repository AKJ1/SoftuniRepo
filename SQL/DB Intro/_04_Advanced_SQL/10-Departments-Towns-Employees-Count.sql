SELECT 
	Departments.Name as 'Dept',
	Towns.Name as 'Town',
	Count(EmployeeCount.TownID) as 'Count'
FROM Employees

INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
INNER JOIN Addresses ON Employees.AddressID = Addresses.AddressID
INNER JOIN Towns ON Addresses.TownID = Towns.TownID
INNER JOIN (
	SELECT DISTINCT 
		Towns.TownID
	FROM Addresses		
	JOIN Towns ON Addresses.TownID = Towns.TownID
	) AS EmployeeCount ON EmployeeCount.TownID = Towns.TownID
GROUP BY Towns.Name, Departments.Name