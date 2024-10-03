-- Products Table
CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),        -- Unique identifier for the product
    Name NVARCHAR(100) NOT NULL,             -- Name of the product
    Price DECIMAL(18,2) NOT NULL,            -- Price of the product
    Stock INT NOT NULL                       -- Available stock quantity
);

-- Orders Table
CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),        -- Unique identifier for the order
    CustomerId INT NOT NULL,                 -- Identifier for the customer who placed the order
    OrderDate DATETIME NOT NULL,             -- Date when the order was placed
    TotalAmount DECIMAL(18,2) NOT NULL       -- Total amount of the order
);

-- Order Details Table
CREATE TABLE OrderDetails (
    Id INT PRIMARY KEY IDENTITY(1,1),        -- Unique identifier for the orderDetails
    OrderId INT NOT NULL,                    -- Relation to the Orders table
    ProductId INT NOT NULL,                  -- Relation to the Products table
    Quantity INT NOT NULL,                   -- Quantity of the product in the order
    UnitPrice DECIMAL(18,2) NOT NULL,        -- Unit price of the product in the order
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),    -- Relation to Orders table
    FOREIGN KEY (ProductId) REFERENCES Products(Id) -- Relation to Products table
);


-- Insert dates in Products
INSERT INTO Products (Name, Price, Stock)
VALUES 
    ('Product A', 19.99, 100),
    ('Product B', 29.99, 50),
    ('Product C', 9.99, 200),
    ('Product D', 49.99, 30),
    ('Product E', 15.49, 120);

-- Insert dates in Orders
INSERT INTO Orders (CustomerId, OrderDate, TotalAmount)
VALUES 
    (1, '2024-10-01 10:30:00', 69.97),
    (2, '2024-10-02 12:45:00', 29.99),
    (1, '2024-10-03 15:00:00', 49.99);

-- Insert dates in OrderDetails
INSERT INTO OrderDetails (OrderId, ProductId, Quantity, UnitPrice)
VALUES 
    (1, 1, 3, 19.99),  -- 3 units of Product A in Order 1
    (1, 3, 1, 9.99),   -- 1 unit of Product C in Order 1
    (2, 2, 1, 29.99),  -- 1 unit of Product B in Order 2
    (3, 4, 1, 49.99);  -- 1 unit of Product D in Order 3