Question 1
  
-- Inserting data into a new table, ensuring 1NF by splitting products into separate rows
SELECT OrderID, CustomerName, 'Laptop' AS Product
FROM ProductDetail
WHERE FIND_IN_SET('Laptop', Products) > 0
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' AS Product
FROM ProductDetail
WHERE FIND_IN_SET('Mouse', Products) > 0
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' AS Product
FROM ProductDetail
WHERE FIND_IN_SET('Tablet', Products) > 0
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product
FROM ProductDetail
WHERE FIND_IN_SET('Keyboard', Products) > 0
UNION ALL
SELECT OrderID, CustomerName, 'Phone' AS Product
FROM ProductDetail
WHERE FIND_IN_SET('Phone', Products) > 0;

Question 2
--Customers table to store OrderID and CustomerName
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

--Insert data into the Customers table
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

--Create the OrderDetails table to store OrderID, Product, and Quantity, ensuring there are no partial dependencie
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

--Insert data into the OrderDetails table (now only storing OrderID, Product, and Quantity):
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;



