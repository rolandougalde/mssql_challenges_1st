/*SQL SERVER EXERCISE DEVELOPMENT*/
------------------------------------

USE Northwind;

--1. Show the records from the Employees table.

-- Solved:

SELECT * FROM Employees

--2. Show the first and last names of the employees.

-- Solved:

SELECT 
	FirstName, 
	LastName ,
	CONCAT(FirstName,  ' ', LastName) AS [Agent]
FROM Employees
