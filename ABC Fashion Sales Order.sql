-- Salesman table creation
CREATE TABLE Salesman (
    SalesmanId INT PRIMARY KEY,  -- Define as primary key directly
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255) DEFAULT 'Unknown', -- Default constraint for City
    Age INT
);

-- Salesman table record insertion 
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

-- Customer table creation
CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255) NOT NULL,
    PurchaseAmount INT
);

-- Customer table record insertion 
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

-- Orders table Creation
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    SalesmanId INT,
    Orderdate DATE,
    Amount MONEY,
    FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)
);

-- Orders table record insertion 
INSERT INTO Orders (OrderId, CustomerId, SalesmanId, Orderdate, Amount)
VALUES 
    (5001, 2345, 101, '2021-07-01', 550),
    (5003, 1234, 105, '2022-02-15', 1500);

-- Insert a new record in your Orders table
INSERT INTO Orders (OrderId, CustomerId, SalesmanId, Orderdate, Amount)
VALUES (5004, 5678, 102, '2022-03-10', 1200);

-- Identify SalesmanId values in Customer without a match in Salesman
SELECT DISTINCT C.SalesmanId
FROM Customer C
LEFT JOIN Salesman S ON C.SalesmanId = S.SalesmanId
WHERE S.SalesmanId IS NULL;

SELECT *
FROM Customer
WHERE SalesmanId NOT IN (SELECT SalesmanId FROM Salesman);

UPDATE Customer
SET SalesmanId = SalesmanId
WHERE SalesmanId NOT IN (SELECT SalesmanId FROM Salesman);

DELETE FROM Customer
WHERE SalesmanId NOT IN (SELECT SalesmanId FROM Salesman);

-- Foreign key constraint for SalesmanId in Customer table
ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Salesman
FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId);

-- Not null constraint for CustomerName in Customer table
ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

-- Fetch customers with names ending in "N" and purchase amount > 500
SELECT Customer.CustomerName, Customer.PurchaseAmount
FROM Customer
WHERE Customer.CustomerName LIKE '%N' AND Customer.PurchaseAmount > 500;

-- Unique IDs from both tables
SELECT DISTINCT SalesmanId
FROM Salesman
UNION
SELECT DISTINCT SalesmanId
FROM Orders;

-- IDs without duplicates from both tables
SELECT SalesmanId
FROM Salesman
UNION ALL
SELECT SalesmanId
FROM Orders;

-- Display matching data with Purchase Amount between 1500 and 3000
SELECT o.Orderdate, s.Name AS SalesmanName, c.CustomerName, s.Commission, s.City
FROM Orders o
INNER JOIN Salesman s ON o.SalesmanId = s.SalesmanId
INNER JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE o.Amount BETWEEN 1500 AND 3000;

-- Right join to fetch all data from Salesman and Orders
SELECT s.*, o.*
FROM Salesman s
RIGHT JOIN Orders o ON s.SalesmanId = o.SalesmanId;
