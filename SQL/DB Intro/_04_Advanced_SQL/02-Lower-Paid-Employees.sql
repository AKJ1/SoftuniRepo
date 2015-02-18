SELECT FirstName, LastName, Salary From Employees
WHERE Salary < (SELECT MIN(Salary) as MinSalary From Employees) 
