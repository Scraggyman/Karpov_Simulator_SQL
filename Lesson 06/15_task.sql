/*
Разбейте заказы из таблицы orders на 3 группы в зависимости от количества товаров, попавших в заказ:

Малый (от 1 до 3 товаров);
Средний (от 4 до 6 товаров);
Большой (7 и более товаров).
Посчитайте число заказов, попавших в каждую группу. Группы назовите соответственно 
«Малый», «Средний», «Большой» (без кавычек).

Выведите наименования групп и число заказов в них. Колонку с наименованием групп назовите order_size, 
а колонку с числом заказов — orders_count.

Отсортируйте полученную таблицу по колонке с числом заказов по возрастанию.

Поля в результирующей таблице: order_size, orders_count
*/

-- Мое решение
SELECT 
       CASE 
       WHEN  array_length(product_ids, 1) < 4 THEN 'Малый'
       WHEN  array_length(product_ids, 1) < 7 THEN 'Средний'
       ELSE 'Большой'
       END AS order_size,
       COUNT(order_id) AS orders_count
FROM orders
GROUP BY order_size

-- Правильное решение
SELECT case when array_length(product_ids, 1) >= 7 then 'Большой'
            when array_length(product_ids, 1) >= 4 then 'Средний'
            else 'Малый' end as order_size,
       count(order_id) as orders_count
FROM   orders
GROUP BY order_size
ORDER BY orders_count