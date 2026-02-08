/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

-- 16. Show the employees who have placed more than 15 orders.

SELECT EmployeeID, COUNT(OrderID)
FROM Orders
GROUP BY EMployeeID
HAVING COUNT(OrderID) > 15


-- 17. Show the customers who have placed more than 20 orders.



-- 18. Show the employees who have placed the most orders for the countries.
-- Germany and Brazil.



-- 19. Obtain a report that shows the number of orders for each Sales Representative.



-- 20. Obtain a report by Salesperson that shows the number of orders and the 
-- sales amount for each year of operations.

