/*
По данным из таблицы orders рассчитайте средний размер заказа по выходным и будням.

Группу с выходными днями (суббота и воскресенье) назовите «weekend», 
а группу с будними днями (с понедельника по пятницу) — «weekdays» (без кавычек).

В результат включите две колонки: колонку с группами назовите week_part, 
а колонку со средним размером заказа — avg_order_size. 

Средний размер заказа округлите до двух знаков после запятой.

Результат отсортируйте по колонке со средним размером заказа — по возрастанию.

Поля в результирующей таблице: week_part, avg_order_size
*/

-- Мое решение
SELECT 
    CASE
    WHEN TO_CHAR(creation_time, 'Dy') IN ('Mon', 'Tue', 'Wed', 'Thu', 'Fri') THEN 'weekdays'
    ELSE 'weekend'
    END AS week_part,
    ROUND(AVG(array_length(product_ids, 1)), 2) as avg_order_size
FROM orders
GROUP BY week_part
ORDER BY 2 ASC

-- Правильное решение
SELECT case when to_char(creation_time, 'Dy') in ('Sat', 'Sun') then 'weekend'
            else 'weekdays' end as week_part,
       round(avg(array_length(product_ids, 1)), 2) as avg_order_size
FROM   orders
GROUP BY week_part
ORDER BY avg_order_size