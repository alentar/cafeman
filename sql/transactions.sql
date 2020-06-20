-- order processing
use `cafeman`;

START TRANSACTION;

-- find the user
SELECT
    @userId := Id as Id
FROM
    `customers`
WHERE
    Mobile = '0772345678';

-- add an order
INSERT INTO
    `orders` (
        `Id`,
        `Price`,
        `Quantity`,
        `Status`,
        `CreatedAt`,
        `CustomerId`
    )
VALUES
    (
        NULL,
        '2000',
        '100',
        'queued',
        '2021-06-01 18:48:59',
        @userId
    );

-- get inserted order id
SET
    @insertedOrderId = LAST_INSERT_ID();

-- add meals to order
INSERT INTO
    `meal_orders` (`OrderId`, `MealId`)
VALUES
    (@insertedOrderId, '1'),
    (@insertedOrderId, '2'),
    (@insertedOrderId, '3');

-- assign a chef to prepare meal
INSERT INTO
    `order_prepares` (`OrderId`, `ChefId`, `StartTime`, `EndTime`)
VALUES
    (@insertedOrderId, '1', NOW(), NULL);

-- book  a table
INSERT INTO
    `table_reservations` (
        `Id`,
        `CustomerId`,
        `TableId`,
        `StartTime`,
        `EndTime`
    )
VALUES
    (
        NULL,
        @userId,
        '2',
        '2020-06-01 18:48:59',
        '2020-06-01 21:48:59'
    );

COMMIT;

-- serve order
START TRANSACTION;

-- finish cooking
UPDATE
    `order_prepares`
SET
    `EndTime` = NOW()
WHERE
    `OrderId` = 1;

-- update order status
UPDATE
    `orders`
SET
    `Status` = 'served'
WHERE
    `Id` = 1;

-- assign a waiter to serve
INSERT INTO
    `order_serves` (`OrderId`, `WaiterId`, `ServedAt`)
VALUES
    ('1', '1', NULL);

COMMIT;