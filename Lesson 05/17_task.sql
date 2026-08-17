/*
Посчитайте общее количество заказов в таблице orders, количество заказов с пятью и более товарами 
и найдите долю заказов с пятью и более товарами в общем количестве заказов.

В результирующей таблице отразите все три значения — поля назовите соответственно orders, large_orders, 
large_orders_share.

Долю заказов с пятью и более товарами в общем количестве товаров округлите до двух знаков после запятой.

Поля в результирующей таблице: orders, large_orders, large_orders_share
*/

-- Мое решение 
SELECT
    COUNT(order_id) AS orders,
    COUNT(order_id) FILTER (WHERE array_length(product_ids, 1) >= 5) AS large_orders,
    ROUND(COUNT(order_id) FILTER (WHERE array_length(product_ids, 1) >= 5)::DECIMAL / COUNT(order_id), 2) AS large_orders_share
FROM orders

-- Правильное решение
SELECT count(order_id) as orders,
       count(order_id) filter (WHERE array_length(product_ids, 1) >= 5) as large_orders,
       round(count(order_id) filter (WHERE array_length(product_ids, 1) >= 5)::decimal / count(order_id),
             2) as large_orders_share
FROM   orders