USE Samsclub7;
GO

--Multiple select* quieries to display all the records from each table--
SELECT *
FROM Suppliers

Select *
From Product

Select *
From Orders

Select *
From Membership

Select *
From Stores

Select *
From Employee

Select *
From Shipment

Select *
From Department

Select *
From Payment

--query that uses aggregate function--
SELECT  Count(Member_ID) as Number_of_Premium_Members
FROM Membership
WHERE Membership_Type = 'silver' and zip = '91765';

--query that select records from 2 or more tables using inner join--
SELECT Employee.Employee_Firstname, Employee.Employee_Lastname, Stores.Store_Number
FROM Employee INNER JOIN Stores
ON Stores.Store_ID = Employee.Store_ID;

--query that select records from two tables using left outer join--
SELECT Product.Product_Name, Suppliers.Supplier_Name
FROM Product LEFT OUTER JOIN Suppliers
ON Product.Product_ID = Suppliers.Product_ID;
--We had a empty supplier name and all of our product names were populated, so if we wanted to find the product that has no supplier name, we defined product as left hand side.Using left outer join means that the left side of the chart will always have variables and the missing variables on the right side will come out as null, so by having suppliers defined as right table we need to have left outer join to find the empty supplier.--

--query that uses a subquery--
Select Count(Payment_ID) as Total_Amount_Of_Premium_Member_Transactions
From Payment
Where Member_ID IN
(Select Member_ID from Membership
Where Membership_Type = 'Silver');

