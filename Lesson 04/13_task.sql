/*
Из таблицы user_actions получите id всех заказов, сделанных пользователями сервиса в августе 2022 года.

Результат отсортируйте по возрастанию id заказа.

Поле в результирующей таблице: order_id
*/

-- Мое решение
SELECT order_id
FROM   user_actions
WHERE  time between '2022-08-1'
   and '2022-09-01'
   and action = 'create_order'
ORDER BY order_id

-- Правильное решение
SELECT order_id
FROM   user_actions
WHERE  action = 'create_order'
   and date_part('month', time) = 8
   and date_part('year', time) = 2022
ORDER BY order_id