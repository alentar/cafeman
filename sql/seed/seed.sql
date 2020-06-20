INSERT INTO `chefs` (`Id`, `FirstName`, `LastName`, `Salary`) VALUES (NULL, 'Alex', 'Mayor', '2000'), (NULL, 'Cat', 'Buff', '100'), (NULL, 'Harry', 'Potter', '1000'), (NULL, 'James', 'Potter', '999'), (NULL, 'Jane', 'Carter', '555')

INSERT INTO `customers` (`Id`, `FirstName`, `LastName`, `Mobile`) VALUES (NULL, 'Chathurangi', 'Silva', '0712345678'), (NULL, 'Kasun', 'Bandara', '071232345678'), (NULL, 'Chamara', 'Ekanayaka', '0772345678'), (NULL, 'Lex', 'Carter', '0442345678'), (NULL, 'Kathy', 'Cane', '0223345678')

INSERT INTO `meals` (`Id`, `Name`, `Price`, `Description`) VALUES (NULL, 'Sandwitch', '1299', 'breakfast meal'), (NULL, 'Rice with Sambol', '500', 'rice with pol sambol'), (NULL, 'Bread', '300', 'Bread with curry'), (NULL, 'String Hoppers', '450', '20 String Hoppers with sambol and dhal curry')

INSERT INTO `tables` (`Id`, `Number`, `Capacity`) VALUES (NULL, '1', '2'), (NULL, '2', '1'), (NULL, '3', '5'), (NULL, '4', '3'), (NULL, '5', '10')

INSERT INTO `waiters` (`Id`, `FirstName`, `LastName`, `Salary`) VALUES (NULL, 'Lily', 'Potter', '100'), (NULL, 'Duddly', 'Garry', '50'), (NULL, 'Karl', 'Obama', '123'), (NULL, 'Dilon', 'Silva', '100')

INSERT INTO `table_reservations` (`Id`, `CustomerId`, `TableId`, `StartTime`, `EndTime`) VALUES (NULL, '1', '3', '2020-06-01 18:48:59', '2020-06-01 21:48:59'), (NULL, '2', '2', '2020-06-10 18:48:59', '2020-06-10 21:48:59'), (NULL, '2', '3', '2020-06-10 18:48:59', '2020-06-10 21:48:59'), (NULL, '3', '1', '2020-06-20 05:50:09', '2020-06-20 07:50:09'), (NULL, '1', '5', '2020-06-12 18:50:27', '2020-06-12 20:50:27'), (NULL, '4', '5', '2020-06-20 09:50:47', '2020-06-20 14:50:47'), (NULL, '4', '3', '2020-06-16 13:51:00', '2020-06-16 18:41:00'), (NULL, '2', '5', '2020-06-01 18:51:27', '2020-06-01 20:51:27')

INSERT INTO `orders` (`Id`, `Price`, `Quantity`, `Status`, `CreatedAt`, `CustomerId`) VALUES (NULL, '2000', '1', 'queued', '2020-06-01 18:48:59', '1'), (NULL, '3222', '1', 'queued', '2020-06-10 18:48:59', '2'), (NULL, '3333', '4', 'preparing', '2020-06-20 05:50:09', '3'), (NULL, '535', '3', 'preparing', '2020-06-12 18:50:27', '1'), (NULL, '4324', '4', 'served', '2020-06-20 09:50:47', '4'), (NULL, '2222', '3', 'served', '2020-06-16 13:51:00', '4'), (NULL, '33333', '34', 'served', '2020-06-01 18:51:27', '2')

INSERT INTO `meal_orders` (`OrderId`, `MealId`) VALUES ('1', '1'), ('1', '3'), ('2', '2'), ('3', '2'), ('3', '4'), ('3', '1'), ('4', '1'), ('4', '4'), ('5', '2'), ('6', '1'), ('6', '2'), ('6', '3'), ('6', '4'), ('7', '2')

INSERT INTO `order_serves` (`OrderId`, `WaiterId`, `ServedAt`) VALUES ('5', '1', '2020-06-01 19:22:35'), ('6', '2', '2020-06-18 19:22:35'), ('7', '3', '2020-06-08 19:23:34')

INSERT INTO `order_prepares` (`OrderId`, `ChefId`, `StartTime`, `EndTime`) VALUES ('1', '1', NULL, NULL), ('2', '2', NULL, NULL), ('3', '3', '2020-06-09 19:24:33', NULL), ('4', '1', '2020-06-10 19:24:42', NULL), ('5', '1', '2020-06-09 19:24:56', '2020-06-09 20:24:56'), ('6', '5', '2020-06-17 19:25:11', '2020-06-17 20:25:11'), ('7', '4', '2020-06-12 19:30:22', '2020-06-12 20:30:22')