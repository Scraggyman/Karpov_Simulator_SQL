/*
По данным из таблицы user_actions определите пять пользователей, 
сделавших в августе 2022 года наибольшее количество заказов.

Выведите две колонки — id пользователей и число оформленных ими заказов. 
Колонку с числом оформленных заказов назовите created_orders.

Результат отсортируйте сначала по убыванию числа заказов, сделанных пятью пользователями, 
затем по возрастанию id этих пользователей.

Поля в результирующей таблице: user_id, created_orders
*/

-- Мое решение
SELECT
    user_id,
    COUNT(order_id) AS created_orders
FROM user_actions
WHERE action = 'create_order'
  AND time >= '2022-08-01'
  AND time < '2022-09-01'
GROUP BY user_id
ORDER BY created_orders DESC, user_id ASC
LIMIT 5

-- Правильное решение
SELECT user_id,
       count(distinct order_id) as created_orders
FROM   user_actions
WHERE  action = 'create_order'
   and date_part('month', time) = 8
   and date_part('year', time) = 2022
GROUP BY user_id
ORDER BY created_orders desc, user_id limit 5