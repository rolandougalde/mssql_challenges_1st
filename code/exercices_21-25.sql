/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

--21. From the report obtained in response 20, show the first 5 salespeople
--for each year.

-- Solved

SELECT
	TOP 5
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	DATEPART(YEAR, T2.OrderDate) AS [Year],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate
ORDER BY 4 DESC

-- Solved as ranking using OVER(PARTITION)

SELECT
	RANK() OVER(PARTITION BY DATEPART(YEAR, T2.OrderDate) ORDER BY SUM(T3.Quantity * T3.UnitPrice) DESC) AS Ranking,
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	DATEPART(YEAR, T2.OrderDate) AS [Year],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate

-- Solved suing subquery

SELECT * FROM
(
	SELECT 
		RANK() OVER(PARTITION BY DATEPART(YEAR, T2.OrderDate) ORDER BY SUM(T3.Quantity * T3.UnitPrice) DESC) AS Ranking,
		T1.FirstName + ' ' + T1.LastName AS [Sales Man],
		DATEPART(YEAR, T2.OrderDate) AS [Year],
		COUNT (T2.OrderID) AS [Nro. Orders],
		SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate
) AS T
WHERE Ranking < 6

-- 22. Show the total sales grouped by product category.

-- Step 1: get data
SELECT * FROM Categories
SELECT * FROM "Order Details"
SELECT * FROM Products

-- Solved

SELECT
	T3.CategoryName,
	SUM(T1.Quantity * T1.UnitPrice) AS [Total sale]
FROM [Order Details] T1
INNER JOIN Products T2 ON T2.ProductID = T1.ProductID
INNER JOIN Categories T3 ON T3.CategoryID = T2.CategoryID
GROUP BY T3.CategoryName
ORDER BY 2 DESC

-- End
