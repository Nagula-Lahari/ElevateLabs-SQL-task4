-- Make sure you're using the correct database
USE task;

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT, -- Corrected for MySQL
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Region VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT, -- Corrected for MySQL
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