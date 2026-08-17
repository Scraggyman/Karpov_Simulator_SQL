/*
Посчитайте количество товаров в каждом заказе, примените к этим значениям группировку и 
рассчитайте количество заказов в каждой группе. Учитывайте только заказы, оформленные по будням. 
В результат включите только те размеры заказов, общее число которых превышает 2000. 
Для расчётов используйте данные из таблицы orders.

Выведите две колонки: размер заказа и число заказов такого размера. 
Колонки назовите соответственно order_size и orders_count.

Результат отсортируйте по возрастанию размера заказа.

Поля в результирующей таблице: order_size, orders_count
*/

-- Мое решение
SELECT 
    array_length(product_ids, 1) AS order_size,
    COUNT(array_length(product_ids, 1)) AS orders_count
FROM orders
WHERE TO_CHAR(creation_time, 'Dy') IN ('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
GROUP BY array_length(product_ids, 1)
HAVING COUNT(array_length(product_ids, 1)) > 2000
ORDER BY order_size
-- Правильное решение
SELECT array_length(product_ids, 1) as order_size,
       count(order_id) as orders_count
FROM   orders
WHERE  to_char(creation_time, 'Dy') not in ('Sat', 'Sun')
GROUP BY order_size having count(order_id) > 2000
ORDER BY order_size