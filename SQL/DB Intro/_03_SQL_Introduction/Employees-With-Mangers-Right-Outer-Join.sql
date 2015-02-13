Select Employees.FirstName, Employees.LastName, Concat(Managers.FirstName, Managers.LastName) as 'Manager' From Employees 
Right outer join Employees as Managers on Managers.EmployeeID = Employees.ManagerID
where Employees.LastName is NOT NULL