use `cafeman`;

-- A VIEW TO CHECK POPULAR MEALS AND TOTAL EARNINGS
CREATE VIEW Popular_Meals AS
SELECT
    COUNT(meal_orders.MealId) AS Sold_Meal_Count,
    meals.Id AS Meal_Id,
    meals.Name AS Meal_Name,
    COUNT(meal_orders.MealId) * meals.Price AS Total_Earning
FROM
    meal_orders,
    meals
WHERE
    meal_orders.MealId = meals.Id
GROUP BY
    meal_orders.MealId
ORDER BY
    Sold_Meal_Count DESC;

--  FIND ALL TABLE RESERVATIONS OF CUSTOMERS BY CUSTOMER MOBILE
SELECT
    customers.Id,
    customers.FirstName,
    customers.LastName,
    TABLES.Number,
    customer_reservations.StartTime,
    customer_reservations.EndTime
FROM
    customers
    INNER JOIN customer_reservations ON customer_reservations.CustomerId = customers.Id
    INNER JOIN TABLES ON TABLES.Id = customer_reservations.Id
WHERE
    customers.Mobile = '0712345678';

-- Find Table reservation of customer on given period of time by customer 
SELECT
    customers.Id,
    customers.FirstName,
    customers.LastName,
    TABLES.Number,
    customer_reservations.StartTime,
    customer_reservations.EndTime
FROM
    customers
    INNER JOIN customer_reservations ON customer_reservations.CustomerId = customers.Id
    INNER JOIN TABLES ON TABLES.Id = customer_reservations.Id
WHERE
    customers.Mobile = '0712345678'
    AND (
        customer_reservations.StartTime >= '2020-06-01'
        AND customer_reservations.EndTime <= '2020-06-15'
    );

-- SELECT ALL ORDERS MADE BY CUSTOMER from customer mobile number
SELECT
    customers.id,
    customers.FirstName,
    customers.LastName,
    orders.id,
    orders.Price,
    orders.Quantity,
    orders.Status,
    orders.CreatedAt
FROM
    orders,
    customers
WHERE
    customers.Mobile = '0712345678'
    AND customers.Id = orders.CustomerId;

-- Select Orders done by customer in relavent time period
SELECT
    customers.id,
    customers.FirstName,
    customers.LastName,
    orders.id,
    orders.Price,
    orders.Quantity,
    orders.Status,
    orders.CreatedAt
FROM
    orders,
    customers
WHERE
    customers.Mobile = '0712345678'
    AND customers.Id = orders.CustomerId
    AND orders.CreatedAt BETWEEN '2020-06-01'
    AND '2020-06-20';

--All the Meals orderd by customer on order search by customer mobile and  order id
SELECT
    meals.Id,
    meals.Name,
    meals.Price
FROM
    meals
    INNER JOIN meal_orders ON meal_orders.MealId = meals.Id
    INNER JOIN orders ON meal_orders.OrderId = orders.Id
    INNER JOIN customers ON customers.Id = orders.CustomerId
WHERE
    customers.Mobile = '0442345678'
    AND orders.Id = '6';