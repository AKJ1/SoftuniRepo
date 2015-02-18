SELECT 
	ManagerName,
	EmployeeCount
FROM (SELECT 
		Concat(Managers.FirstName, ' ' ,Managers.LastName) as ManagerName,
		Count(Employees.ManagerID) as EmployeeCount
	  FROM Employees
	  JOIN Employees as Managers ON Employees.ManagerID = Managers.EmployeeID
	  GROUP BY Managers.FirstName, Managers.LastName
	  ) as X
WHERE EmployeeCount = 5