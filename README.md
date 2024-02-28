# ABC-Fashion-Sales-Order-Processing-System
This repository contains SQL scripts for the ABC Fashion Sales Order Processing System, which includes three tables: Salesman, Customer, and Orders.

**Table Descriptions**
**1. Salesman Table**
SalesmanId: Unique identifier for each salesman.
Name: Name of the salesman.
Commission: Commission percentage for the salesman.
City: City where the salesman is located.
Age: Age of the salesman.

**Salesman table creation:**

CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);

**Salesman table record insertion:**

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);
    
**2. Customer Table**
SalesmanId: Foreign key referencing the Salesman table.
CustomerId: Unique identifier for each customer.
CustomerName: Name of the customer.
PurchaseAmount: Amount of purchase made by the customer.

**Customer table creation:**
CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255) NOT NULL,
    PurchaseAmount INT
);

**Customer table record insertion:**
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);
    
**3. Orders Table**
OrderId: Unique identifier for each order.
CustomerId: Foreign key referencing the Customer table.
SalesmanId: Foreign key referencing the Salesman table.
Orderdate: Date of the order.
Amount: Order amount.

**Orders table creation:**
CREATE TABLE Orders (OrderId INT PRIMARY KEY, CustomerId INT, SalesmanId INT, Orderdate DATE, Amount MONEY);

**Orders table record insertion:**
INSERT INTO Orders (OrderId, CustomerId, SalesmanId, Orderdate, Amount)
VALUES 
    (5001, 2345, 101, '2021-07-01', 550),
    (5003, 1234, 105, '2022-02-15', 1500);
    
**Tasks Performed**
*The SQL file in this repository addresses the following tasks:*

1. Insert a new record in the Orders table.
2. Add Primary key constraint for SalesmanId column in Salesman table. Add default constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId column in Customer table. Add not null constraint in CustomerName column for the Customer table.
3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.
4. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, and the other result containing SalesmanId with duplicates from two tables.
5. Display columns Orderdate, Salesman Name, Customer Name, Commission, and City which have matching data with the range of Purchase Amount between 500 to 1500.
6. Using right join fetch all the results from Salesman and Orders table.
   
The SQL script provides solutions to these tasks and serves as a reference for the ABC Fashion Sales Order Processing System.





