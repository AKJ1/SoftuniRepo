Select Employees.FirstName, Employees.LastName, Addresses.AddressText, Concat(Managers.FirstName,Managers.LastName) as 'Manager Name' From Employees 
Join Employees as Managers On Managers.EmployeeID = Employees.ManagerID
Join Addresses On Employees.AddressID = Addresses.AddressID