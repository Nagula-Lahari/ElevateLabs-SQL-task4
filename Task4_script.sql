
mysql> -- Make sure you're using the correct database
mysql> USE task;
Database changed
mysql>
mysql> -- Create Orders Table
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY AUTO_INCREMENT, -- Corrected for MySQL
    ->     CustomerID INT NOT NULL,
    ->     OrderDate DATE NOT NULL,
    ->     TotalAmount DECIMAL(10, 2) NOT NULL,
    ->     Region VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> -- Create Products Table
mysql> CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY AUTO_INCREMENT, -- Corrected for MySQL
    ->     ProductName VARCHAR(100) NOT NULL,
    ->     Price DECIMAL(10, 2) NOT NULL,
    ->     Category VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> -- Insert Sample Data into Orders Table
mysql> INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Region) VALUES
    -> (101, '2023-01-15', 150.00, 'North'),
    -> (102, '2023-01-16', 200.50, 'South'),
    -> (101, '2023-01-17', 75.25, 'North'),
    -> (103, '2023-01-18', 300.00, 'East'),
    -> (102, '2023-02-01', 120.75, 'South'),
    -> (104, '2023-02-05', 450.00, 'West'),
    -> (101, '2023-02-10', 90.00, 'North'),
    -> (103, '2023-02-12', 180.00, 'East'),
    -> (105, '2023-03-01', 50.00, 'North'),
    -> (101, '2023-03-05', 250.00, 'North'),
    -> (102, '2023-03-10', 80.00, 'South'),
    -> (104, '2023-03-15', 600.00, 'West'),
    -> (106, '2023-03-20', 110.00, 'Central'),
    -> (103, '2023-04-01', 220.00, 'East'),
    -> (105, '2023-04-05', 35.00, 'North'),
    -> (101, '2023-04-10', 100.00, 'North'),
    -> (102, '2023-04-15', 95.00, 'South'),
    -> (106, '2023-04-20', 130.00, 'Central'),
    -> (107, '2023-05-01', 280.00, 'South'),
    -> (101, '2023-05-05', 500.00, 'North');
Query OK, 20 rows affected (0.01 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert Sample Data into Products Table
mysql> INSERT INTO Products (ProductName, Price, Category) VALUES
    -> ('Laptop Pro', 1200.00, 'Electronics'),
    -> ('Mechanical Keyboard', 150.00, 'Electronics'),
    -> ('Wireless Mouse', 45.00, 'Electronics'),
    -> ('Ergonomic Chair', 300.00, 'Office'),
    -> ('Desk Lamp', 30.00, 'Office'),
    -> ('Coffee Maker', 80.00, 'Appliances'),
    -> ('Toaster', 40.00, 'Appliances'),
    -> ('Smartphone X', 900.00, 'Electronics'),
    -> ('Smartwatch Y', 250.00, 'Electronics'),
    -> ('Printer Z', 200.00, 'Electronics'),
    -> ('Monitor UltraWide', 400.00, 'Electronics'),
    -> ('Desk Organizer', 20.00, 'Office'),
    -> ('Blender Pro', 120.00, 'Appliances');
Query OK, 13 rows affected (0.01 sec)
Records: 13  Duplicates: 0  Warnings: 0

mysql> select * from Products;
+-----------+---------------------+---------+-------------+
| ProductID | ProductName         | Price   | Category    |
+-----------+---------------------+---------+-------------+
|         1 | Laptop Pro          | 1200.00 | Electronics |
|         2 | Mechanical Keyboard |  150.00 | Electronics |
|         3 | Wireless Mouse      |   45.00 | Electronics |
|         4 | Ergonomic Chair     |  300.00 | Office      |
|         5 | Desk Lamp           |   30.00 | Office      |
|         6 | Coffee Maker        |   80.00 | Appliances  |
|         7 | Toaster             |   40.00 | Appliances  |
|         8 | Smartphone X        |  900.00 | Electronics |
|         9 | Smartwatch Y        |  250.00 | Electronics |
|        10 | Printer Z           |  200.00 | Electronics |
|        11 | Monitor UltraWide   |  400.00 | Electronics |
|        12 | Desk Organizer      |   20.00 | Office      |
|        13 | Blender Pro         |  120.00 | Appliances  |
+-----------+---------------------+---------+-------------+
13 rows in set (0.00 sec)

mysql> show tables;
+----------------+
| Tables_in_task |
+----------------+
| orders         |
| products       |
+----------------+
2 rows in set (0.02 sec)

mysql> select * from orders;
+---------+------------+------------+-------------+---------+
| OrderID | CustomerID | OrderDate  | TotalAmount | Region  |
+---------+------------+------------+-------------+---------+
|       1 |        101 | 2023-01-15 |      150.00 | North   |
|       2 |        102 | 2023-01-16 |      200.50 | South   |
|       3 |        101 | 2023-01-17 |       75.25 | North   |
|       4 |        103 | 2023-01-18 |      300.00 | East    |
|       5 |        102 | 2023-02-01 |      120.75 | South   |
|       6 |        104 | 2023-02-05 |      450.00 | West    |
|       7 |        101 | 2023-02-10 |       90.00 | North   |
|       8 |        103 | 2023-02-12 |      180.00 | East    |
|       9 |        105 | 2023-03-01 |       50.00 | North   |
|      10 |        101 | 2023-03-05 |      250.00 | North   |
|      11 |        102 | 2023-03-10 |       80.00 | South   |
|      12 |        104 | 2023-03-15 |      600.00 | West    |
|      13 |        106 | 2023-03-20 |      110.00 | Central |
|      14 |        103 | 2023-04-01 |      220.00 | East    |
|      15 |        105 | 2023-04-05 |       35.00 | North   |
|      16 |        101 | 2023-04-10 |      100.00 | North   |
|      17 |        102 | 2023-04-15 |       95.00 | South   |
|      18 |        106 | 2023-04-20 |      130.00 | Central |
|      19 |        107 | 2023-05-01 |      280.00 | South   |
|      20 |        101 | 2023-05-05 |      500.00 | North   |
+---------+------------+------------+-------------+---------+
20 rows in set (0.00 sec)