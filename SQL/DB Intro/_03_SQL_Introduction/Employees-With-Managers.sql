Select Employees.FirstName, Employees.LastName, Addresses.AddressText, Managers.FirstName, Managers.LastName From Employees 
Join Employees as Managers On Managers.EmployeeID = Employees.ManagerID
Join Addresses On Employees.AddressID = Addresses.AddressID