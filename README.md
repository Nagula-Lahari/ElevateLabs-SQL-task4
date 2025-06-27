

# SQL Aggregate Functions and Grouping for Data Summarization

-----

## Overview

This repository provides a practical, hands-on guide to using SQL aggregate functions (`SUM`, `COUNT`, `AVG`) and the `GROUP BY` clause for summarizing and analyzing tabular data. It also demonstrates how to filter grouped results using the `HAVING` clause. The SQL commands are specifically tailored for **MySQL**.

-----

## Objective

The primary goal of this project is to help users understand and effectively apply SQL's powerful aggregation and grouping capabilities to extract meaningful insights from raw data. You'll learn how to transform detailed records into concise summaries, essential for reporting and data analysis.

-----

## Key Concepts Covered

  * **`COUNT()`**: Counting the total number of rows or distinct values.
  * **`SUM()`**: Calculating the sum of values in a numeric column.
  * **`AVG()`**: Determining the average value of a numeric column.
  * **`GROUP BY`**: Grouping rows based on common values in one or more columns to apply aggregate functions to each group.
  * **`HAVING`**: Filtering groups based on conditions applied to aggregate functions (similar to `WHERE` but for groups).

-----

## Tools

  * **MySQL Database**: The SQL commands are written for a MySQL environment.
  * **MySQL Workbench / MySQL Command Line Client**: Recommended tools for executing the SQL queries.

-----

## Getting Started

Follow these steps to set up your environment and run the SQL queries.

### 1\. Create a Database

First, connect to your MySQL server and create a new database named `task`.

```sql
CREATE DATABASE task;
USE task;
```

### 2\. Create Tables and Insert Sample Data

Execute the following SQL block to create the `Orders` and `Products` tables. These tables will be populated with sample data that we'll use for our aggregate queries.

```sql
-- Use the 'task' database
USE task;

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Region VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(50)
);

-- Insert Sample Data into Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Region) VALUES
(101, '2023-01-15', 150.00, 'North'),
(102, '2023-01-16', 200.50, 'South'),
(101, '2023-01-17', 75.25, 'North'),
(103, '2023-01-18', 300.00, 'East'),
(102, '2023-02-01', 120.75, 'South'),
(104, '2023-02-05', 450.00, 'West'),
(101, '2023-02-10', 90.00, 'North'),
(103, '2023-02-12', 180.00, 'East'),
(105, '2023-03-01', 50.00, 'North'),
(101, '2023-03-05', 250.00, 'North'),
(102, '2023-03-10', 80.00, 'South'),
(104, '2023-03-15', 600.00, 'West'),
(106, '2023-03-20', 110.00, 'Central'),
(103, '2023-04-01', 220.00, 'East'),
(105, '2023-04-05', 35.00, 'North'),
(101, '2023-04-10', 100.00, 'North'),
(102, '2023-04-15', 95.00, 'South'),
(106, '2023-04-20', 130.00, 'Central'),
(107, '2023-05-01', 280.00, 'South'),
(101, '2023-05-05', 500.00, 'North');

-- Insert Sample Data into Products Table
INSERT INTO Products (ProductName, Price, Category) VALUES
('Laptop Pro', 1200.00, 'Electronics'),
('Mechanical Keyboard', 150.00, 'Electronics'),
('Wireless Mouse', 45.00, 'Electronics'),
('Ergonomic Chair', 300.00, 'Office'),
('Desk Lamp', 30.00, 'Office'),
('Coffee Maker', 80.00, 'Appliances'),
('Toaster', 40.00, 'Appliances'),
('Smartphone X', 900.00, 'Electronics'),
('Smartwatch Y', 250.00, 'Electronics'),
('Printer Z', 200.00, 'Electronics'),
('Monitor UltraWide', 400.00, 'Electronics'),
('Desk Organizer', 20.00, 'Office'),
('Blender Pro', 120.00, 'Appliances');
```

### 3\. Run Aggregate and Grouping Queries

Once the tables are created and populated, you can execute the following queries to summarize and analyze the data. Copy and paste these into your MySQL client and run them one by one or in blocks.

#### Count Examples

```sql
-- Total number of orders
SELECT COUNT(OrderID) AS TotalOrders
FROM Orders;

-- Total number of unique customers
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Orders;
```

#### Sum Examples

```sql
-- Total revenue from all orders
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

-- Total value of products in a specific category (e.g., 'Electronics')
SELECT SUM(Price) AS TotalElectronicsValue
FROM Products
WHERE Category = 'Electronics';
```

#### Average Examples

```sql
-- Average order amount
SELECT AVG(TotalAmount) AS AverageOrderAmount
FROM Orders;

-- Average price of products in each category
SELECT Category, AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;
```

#### Group By Examples

```sql
-- Total revenue per customer
SELECT CustomerID, SUM(TotalAmount) AS TotalRevenuePerCustomer
FROM Orders
GROUP BY CustomerID;

-- Number of orders per region
SELECT Region, COUNT(OrderID) AS NumberOfOrders
FROM Orders
GROUP BY Region;

-- Average order amount per region and per customer
SELECT Region, CustomerID, AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
GROUP BY Region, CustomerID
ORDER BY Region, CustomerID;
```

#### Having Examples

```sql
-- Regions with more than 5 orders
SELECT Region, COUNT(OrderID) AS NumberOfOrders
FROM Orders
GROUP BY Region
HAVING COUNT(OrderID) > 5;

-- Customers whose total order amount exceeds $500
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 500;

-- Categories where the average product price is greater than $100 and there are more than 3 products
SELECT Category, AVG(Price) AS AveragePrice, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY Category
HAVING AVG(Price) > 100 AND COUNT(ProductID) > 3;
```

-----

## Outcome

Upon completing this exercise, you'll be proficient in using SQL's aggregate functions and grouping clauses to perform various data summarization and analytical tasks. This foundational knowledge is crucial for anyone working with relational databases and reporting.

-----
