/*
Посчитайте количество созданных и отменённых заказов в таблице user_actions.

Новую колонку с числом заказов назовите orders_count.

Результат отсортируйте по числу заказов по возрастанию.

Поля в результирующей таблице: action, orders_count
*/

-- Мое решение
SELECT action,
       COUNT(user_id) AS orders_count
FROM user_actions
GROUP BY 1
ORDER BY 2

-- Правильное решение
SELECT action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY action
ORDER BY orders_count