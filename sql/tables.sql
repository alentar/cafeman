DROP DATABASE `cafeman`;

CREATE DATABASE `cafeman`;

use cafeman;

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Mobile VARCHAR(15) UNIQUE KEY
);

DROP TABLE IF EXISTS `waiters`;

CREATE TABLE `waiters` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INTEGER
);

DROP TABLE IF EXISTS `chefs`;

CREATE TABLE `chefs` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INTEGER
);

DROP TABLE IF EXISTS `tables`;

CREATE TABLE `tables` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Number INTEGER UNIQUE KEY,
    Capacity INTEGER
);

DROP TABLE IF EXISTS `meals`;

CREATE TABLE `meals` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Price INTEGER,
    Description VARCHAR(225)
);

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Price INTEGER,
    Quantity INTEGER,
    Status VARCHAR(10),
    CreatedAt DATETIME,
    CustomerId INTEGER,
    FOREIGN KEY(CustomerId) REFERENCES customers(Id)
);

DROP TABLE IF EXISTS `table_reservations`;

CREATE TABLE `table_reservations` (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    CustomerId INTEGER,
    TableId INTEGER,
    StartTime DATETIME,
    EndTime DATETIME,
    FOREIGN KEY(CustomerId) REFERENCES customers(Id),
    FOREIGN KEY(TableId) REFERENCES tables(Id)
);

DROP TABLE IF EXISTS `order_serves`;

CREATE TABLE `order_serves` (
    OrderId INTEGER,
    WaiterId INTEGER,
    ServedAt DATETIME,
    FOREIGN KEY(OrderId) REFERENCES orders(Id),
    FOREIGN KEY(WaiterId) REFERENCES waiters(Id)
);

DROP TABLE IF EXISTS `meal_orders`;

CREATE TABLE `meal_orders` (
    OrderId INTEGER,
    MealId INTEGER,
    FOREIGN KEY(OrderId) REFERENCES orders(Id),
    FOREIGN KEY(MealId) REFERENCES meals(Id)
);

DROP TABLE IF EXISTS `order_prepares`;

CREATE TABLE `order_prepares` (
    OrderId INTEGER,
    ChefId INTEGER,
    StartTime DATETIME,
    EndTime DATETIME,
    FOREIGN KEY(OrderId) REFERENCES orders(Id),
    FOREIGN KEY(ChefId) REFERENCES chefs(Id)
);