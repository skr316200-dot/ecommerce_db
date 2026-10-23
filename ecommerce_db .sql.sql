USE ecommerce_db;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(15),
city VARCHAR(50),
state VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, email, phone, city, state)
VALUES
(1, 'Santosh', 'sant7397.bca@gmail.com', '6204989536', 'Hazaribag', 'Jharkhand'),
(2, 'Vikash Rana', 'vik9ash@gmail.com', '6206524571', 'Hazaribag', 'Jharkhand'),
(3, 'Sandip Rana', 'skr316200@gmail.com', '7397316200', 'Hazaribag', 'Jharkhand'),
(4, 'Vijay Rana', 'vijay123@gmail.com', '9153268365', 'Hazaribag', 'Jharkhand'),
(5, 'Vamika', 'vamu123@gmail.com', '9631780864', 'Hazaribag', 'Jharkhand');

SELECT * FROM customrs;

USE ecommerce_db;

DESCRIBE customers;

USE ecommerce_db;

INSERT INTO customers (customer_id, customer_name, email, phone, city, state)
VALUES
(1, 'Santosh Kumr', 'sant7397.bca@gmail.com', '6204989536', 'Hazaribag', 'Jharkhand'),
(2, 'Vikash Rana', 'vik9ash@gmail.com', '6206524570', 'Hazaribag', 'Jharkhand'),
(3, 'Sandip Rana', 'skr316200@gmail.com', '7397316200', 'Hazaribag', 'Jharkhand'),
(4, 'Vijay Rana', 'vijay123@gmail.com', '9153268365', 'Hazaribag', 'Jharkhand');
(5, 'Vamika', 'vamu123@gmail.com', '9631780864', 'Hazaribag', 'Jharkhand');

SELECT * FROM customers;

USE ecommerce_db;

CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);

USE ecommerce_db;

INSERT INTO products (product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Smartphone', 'Electronics', 25000.00, 20),
('Headphones', 'Electonics', 1500.00, 30),
('Shoes', 'Fashion', 2500.00, 30),
('T-Shirt', 'Fashion', 800.00, 40);

SELECT * FROM products;

USE ecommerce_db;

CREATE TABLE orders (order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
product_id INT NOT NULL,
order_date DATE,
quantity INT,
total_amount DECIMAL(10,2)
);

USE ecommerce_db;

SELECT * FROM orders;

INSERT INTO orders (customer_id, product_id, order_date, quantity, total_amount)
VALUES
(1, 1, '2026-10-01', 1, 35000),
(79, 2, '2026-10-02', 2, 5000),
(1, 3, '2026-10-03', 1, 15000),
(79, 4, '2026-10-04', 2, 5000),
(1, 5, '2026-10-05', 3, 75000);

SELECT * FROM orders;

DESCRIBE orders;

USE ecommerce_db;

INSERT INTO ordrs (customer_id, order_date, order_status)
VALUES
(1, '2026-10-01', 'Delivered'),
(79, '2026-1002', 'Pending'),
(1, '2026-10-03', 'Delivered'),
(79, '2026-10-04', 'Shipped'),
(1, '2026-10-05', 'Delivered');

SELECT * FROM orders;
USE ecommerce_db;

DESCRIBE orders;


.
USE ecommerce_db;

ALTER TABLE orders ADD COLUMN product_id INT NOT NULL AFTER cstomer_id, ADD COLUMN quantity INT NOT NULL AFTER order_date, ADD COLUMN total_amount DECIMAL(10,2) NOT NULL AFTER quantity;

DESCRIBE orders

USE ecommerce_db;

ALTER TABLE orders ADD COLUMN product_id INT;

ALTER TABLE orders ADD COLUMN quantity INT;

ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2);

DESCRIBE orders;

USE ecommerce_db;

INSERT INTO orders (customer_id, product_id, order_date, quantity, total_amount, order_status)
VALUES
(1, 1, '2026-10-01', 2, 10000.00, 'Delivered'),
(2, 2, '2026-10-02', 1, 25000.00, 'Shipped'),
(3, 3, '2026-10-03', 2, 15000.00, 'Delivered'),
(4, 4, '2026-10-04', 1, 12000.00, 'Pending'),
(5, 5, '2026-10-05', 2, 15000.00, 'Delivered');

SELECT * FROM orders;

USE ecommerce_db;
SELECT * FROM customers;
SELECT * FROM products

INSERT INTO orders (customer_id, product_id, order_date, quantity, total_amount, order_status)
VALUES
(1, 1, '2026-10-01', 2, 10000.00, 'Delivered');

SELECT * FROM orders;

USE ecommerce_db;

SELECT * FROM orders;

SELECT o.order_id,
c.customer_name,
p.product_name,
o.order_date,
o.quantity,
o.total_amount,
o.order_status FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN products p ON o.product_id = p.product_id;

SELECT SUM(total_amount) AS total_sales,
COUNT(*) AS total_orders,
AVG(total_amount) AS average_order_value FROM orders;

SELECT product_id,
SUM(quantity) AS total_quantity,
SUM(total_amount) AS total_sales FROM orders GROUP BY product_id;

USE ecommerce_db;

SELECT
customer_id,
COUNT(order_id) AS total_orders,
SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id ORDER BY total_spent DESC;

SELECT order_status,
COUNT(order_id) AS total_orders FROM orders GROUP BY order_status;

SELECT order_date,
SUM(total_amount) AS daily_sales FROM orders GROUP BY order_date ORDER BY order_date;

SELECT p.product_name,
SUM(o.quantity) AS units_sold,
SUM(o.total_amount) AS total_sales FROM orders o JOIN products p ON o.product_id = p.product_id GROUP BY p.product_id, p.product_name ORDER BY units_sold DESC;

USE ecommerce_db;

SELECT p.product_name,
SUM(o.quantity) AS units_sold,
SUM(o.total_amount) AS total_sales FROM orders o JOIN products p ON o.product_id = p.product_id GROUP BY p.product_id,
p.product_name ORDER BY units_sold DESC LIMIT 5;

USE ecommerce_db;
SELECT SUM(total_amount) AS total_sales,
COUNT(order_id) AS total_orders,
AVG(total_amount) AS average_order_value FROM orders;

SELECT order_status,
COUNT(order_id) AS total_orders FROM orders GROUP BY order_status;

SELECT p.product_name,
SUM(o.quantity) AS units_sold,
SUM(o.total_amount) AS total_sales FROM orders o JOIN products p ON o.product_id = p.product_id GROUP BY p.product_id, 
p.product_name ORDER BY total_sales DESC;

SELECT 
order_date,
SUM(total_amount) AS daily_sales FROM orders GROUP BY order_date ORDER BY order_date;
