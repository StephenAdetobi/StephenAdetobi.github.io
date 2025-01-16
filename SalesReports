--1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

SELECT 
	s.name, 
	Customer_Name, 
	s.city
FROM [dbo].[Salesman$] s
JOIN [dbo].[Customer$] c
ON s.Salesman_id = c.Salesman_ID
WHERE s.city = c.city

--2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT 
	"Order Number", 
	purchase_amount, 
	customer_name, 
	c.city
FROM [dbo].[Order$] o
JOIN [dbo].[Customer$] c
ON c.Customer_ID = o.[Customer ID]
WHERE Purchase_Amount BETWEEN 500 AND 2000

--3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT 
	customer_name AS "Customer Name", 
	c.city, s.name AS Salesman, 
	commission
FROM [dbo].[Customer$] c
JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id

--4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

SELECT 
	customer_name AS "Customer Name", 
	c.city AS "Customer City", 
	s.name AS Salesman, 
	commission
FROM [dbo].[Customer$] c
JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id
WHERE commission > 0.12

--5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  

SELECT 
	customer_name AS "Customer Name", 
	c.city AS "Customer City", 
	s.name AS Salesman, 
	s.city AS "Salesman City", 
	commission
FROM [dbo].[Customer$] c
JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id
WHERE commission > 0.12 AND s.city != c.city

--6. write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

SELECT 
	"Order Number", 
	"Order Date", 
	Purchase_Amount AS "Purchase Amount", 
	Customer_Name AS "Customer Name", 
	c.Grade, 
	s.name AS "Salesman", 
	commission
FROM [dbo].[Order$] o
JOIN [dbo].[Customer$] c
ON o.[Customer ID] = c.[Customer_ID]
JOIN [dbo].[Salesman$] s
ON c.[Salesman_id] = s.[Salesman_id]

--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

SELECT 
	[Order Number], 
	Purchase_Amount, 
	[Order Date], 
	o.[Customer ID], 
	Customer_Name, 
	c.City, 
	Grade, 
	c.Salesman_ID, 
	s.Name, 
	commission
FROM [dbo].[Order$] o
JOIN [dbo].[Customer$] c
ON o.[Customer ID] = c.[Customer_ID]
JOIN [dbo].[Salesman$] s
ON c.[Salesman_id] = s.[Salesman_id]

--8. write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

SELECT 
	Customer_Name AS "Customer Name", 
	Grade, 
	Name AS Salesman, 
	s.city AS "Salesman City"
FROM [dbo].[Customer$] c
JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id
ORDER BY Customer_ID ASC

--9. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT 
	Customer_Name AS "Customer Name", 
	c.city AS "Customer City",
	Grade, 
	Name AS Salesman, 
	s.city AS "Salesman City"
FROM [dbo].[Customer$] c
JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id
WHERE Grade < 300
ORDER BY Customer_ID ASC

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.

SELECT 
	[Customer_Name], 
	c.[City], 
	[Order Number], 
	[Order Date], 
	[Purchase_Amount]
FROM [dbo].[Customer$] c
JOIN [dbo].[Order$] o
ON c.Customer_ID = o.[Customer ID]
ORDER BY [Order Date]  ASC


--11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

SELECT 
	[Customer_Name], 
	c.[City], 
	[Order Number], 
	[Order Date], 
	[Purchase_Amount],
	s.[Salesman_id],
    [commission]
FROM [dbo].[Order$] o
LEFT JOIN [dbo].[Customer$] c
ON c.Customer_ID = o.[Customer ID]
LEFT JOIN [dbo].[Salesman$] s
ON c.Salesman_ID = s.Salesman_id

--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.

SELECT 
	[Name] AS "Salesman Name", 
	c.Customer_Name AS "Customer Name"
FROM [dbo].[Salesman$] s
RIGHT JOIN [dbo].[Customer$] c
ON s.[Salesman_ID] = c.Salesman_ID

--13. write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT 
	[Name] AS "Salesman Name", 
	c.Customer_Name AS "Customer Name", 
	c.City, Grade, 
	o.[Order Number], 
	o.[Order Date], 
	o.[Purchase_Amount] AS "Amount"
FROM [dbo].[Salesman$] s
RIGHT JOIN [dbo].[Customer$] c
ON s.[Salesman_ID] = c.Salesman_ID
RIGHT JOIN [dbo].[Order$] o
ON c.Customer_ID = o.[Customer ID]

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

SELECT 
	[Name] AS "Salesman Name", 
	c.Customer_Name AS "Customer Name"
FROM [dbo].[Salesman$] s
RIGHT JOIN [dbo].[Customer$] c
ON s.[Salesman_ID] = c.Salesman_ID
RIGHT JOIN [dbo].[Order$] o
ON c.Customer_ID = o.[Customer ID]
WHERE ([Purchase_Amount] >= 2000 AND Grade IS NOT NULL) OR [Order Number] IS NULL

--15. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount

SELECT 
	c.Customer_Name AS "Customer Name",
	c.City AS "Customer City",
	o.[Order Number], 
	o.[Order Date], 
	o.[Purchase_Amount] AS "Amount"
FROM [dbo].[Salesman$] s
RIGHT JOIN [dbo].[Customer$] c
ON s.[Salesman_ID] = c.Salesman_ID
RIGHT JOIN [dbo].[Order$] o
ON c.Customer_ID = o.[Customer ID]

--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

SELECT 
	c.Customer_Name AS "Customer Name",
	c.City AS "Customer City",
	o.[Order Number], 
	o.[Order Date], 
	o.[Purchase_Amount] AS "Amount"
FROM [dbo].[Salesman$] s
RIGHT JOIN [dbo].[Customer$] c
ON s.[Salesman_ID] = c.Salesman_ID
RIGHT JOIN [dbo].[Order$] o
ON c.Customer_ID = o.[Customer ID]
WHERE 
	(Grade IS NOT Null AND [Order Number] IS NOT NULL) 
	OR 
	([Order Number] IS NULL AND Grade IS NULL)

--17. Write a SQL query to combine each row of the salesman table with each row of the customer table.

SELECT 
	Name AS "Salesman Name", 
	[Customer_Name]
FROM [dbo].[Salesman$] s
CROSS JOIN 
[dbo].[Customer$] c

--18. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

SELECT 
	Name AS "Salesman Name", 
	[Customer_Name]
FROM [dbo].[Salesman$] s
CROSS JOIN 
[dbo].[Customer$] c
WHERE s.city = c.city

--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

SELECT 
	Name AS "Salesman Name",
	[Customer_Name]
FROM [dbo].[Salesman$] s
CROSS JOIN 
[dbo].[Customer$] c
WHERE s.city IS NOT NULL AND Grade IS NULL

--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

SELECT 
	Name AS "Salesman Name",
	[Customer_Name]
FROM [dbo].[Salesman$] s
CROSS JOIN 
[dbo].[Customer$] c
WHERE s.city != c.city AND Grade IS NOT NULL
