-- Subqueries

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255)
);

-- Create the Order_Items table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample data into Customers
INSERT INTO Customers (customer_id, customer_name, city, country) VALUES
(1, 'Alice Smith', 'New York', 'USA'),
(2, 'Bob Johnson', 'London', 'UK'),
(3, 'Charlie Brown', 'Paris', 'France'),
(4, 'David Lee', 'Tokyo', 'Japan'),
(5, 'Eve Wilson', 'Sydney', 'Australia');

-- Insert sample data into Orders
INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(101, 1, '2023-01-15'),
(102, 2, '2023-02-20'),
(103, 1, '2023-03-10'),
(104, 3, '2023-04-05'),
(105, 4, '2023-05-12'),
(106, 2, '2023-06-18'),
(107, 5, '2023-07-01');

-- Insert sample data into Products
INSERT INTO Products (product_id, product_name, category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mouse', 'Electronics'),
(3, 'Keyboard', 'Electronics'),
(4, 'T-Shirt', 'Clothing'),
(5, 'Jeans', 'Clothing'),
(6, 'Book', 'Books');

-- Insert sample data into Order_Items
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 101, 1, 1, 1200.00),
(2, 101, 2, 1, 25.00),
(3, 102, 3, 1, 75.00),
(4, 102, 2, 2, 25.00),
(5, 103, 1, 1, 1250.00),
(6, 103, 3, 1, 80.00),
(7, 104, 4, 2, 20.00),
(8, 105, 5, 1, 60.00),
(9, 106, 3, 1, 75.00),
(10, 107, 6, 3, 15.00);


--SUBQUERIES

SELECT customer_name
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders);

SELECT product_name
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Order_Items);

SELECT c.customer_name
FROM Customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
    HAVING SUM(oi.quantity * oi.unit_price) > 1000
);


SELECT c.customer_name, order_summary.total_orders
FROM Customers c
JOIN (
    SELECT customer_id, COUNT(*) AS total_orders
    FROM Orders
    GROUP BY customer_id
) AS order_summary ON c.customer_id = order_summary.customer_id;


SELECT customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id 
      AND o.order_date > '2023-01-01'
);