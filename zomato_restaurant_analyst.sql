CREATE DATABASE IF NOT EXISTS
zomato_restaurant_analysis;

USE zomato_restaurant_analysis;

CREATE TABLE IF NOT EXISTS
restaurant_orders (
Order_ID INT PRIMARY KEY,
Order_Date DATE,
Restaurant_Name VARCHAR(100),
City VARCHAR(50),
Cuisine VARCHAR(50),
Order_Value DECIMAL(10,2),
Rating DECIMAL(2,1),
Delivery_Time_Min INT,
Order_Status VARCHAR(30)
);

DESCRIBE restaurant_orders;

