/*
А теперь по данным таблицы courier_actions определите курьеров, 
которые в сентябре 2022 года доставили только по одному заказу.

В этот раз выведите всего одну колонку с id курьеров. Колонку с числом заказов в результат включать не нужно.

Результат отсортируйте по возрастанию id курьера.

Поле в результирующей таблице: courier_id
*/

-- Мое решение
SELECT 
    courier_id
FROM courier_actions
WHERE action = 'deliver_order'
    AND date_part('month', time) = 9
    AND date_part('year', time) = 2022
GROUP BY courier_id
HAVING COUNT(order_id) = 1
ORDER BY courier_id ASC

-- Правильное решение
SELECT courier_id
FROM   courier_actions
WHERE  action = 'deliver_order'
   and date_part('month', time) = 9
   and date_part('year', time) = 2022
GROUP BY courier_id having count(distinct order_id) = 1
ORDER BY courier_id