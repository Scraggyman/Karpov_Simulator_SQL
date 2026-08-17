/*
Используя группировку и функцию DATE_TRUNC, приведите все даты к началу месяца и посчитайте, 
сколько заказов было сделано и сколько было отменено в каждом из них.

В этот раз расчёты проведите по таблице user_actions. Колонку с усечённой датой назовите month, 
колонку с количеством заказов — orders_count.

Результат отсортируйте сначала по месяцам — по возрастанию, затем по типу действия — тоже по возрастанию.

Поля в результирующей таблице: month, action, orders_count
*/

-- Мое решение
SELECT DATE_TRUNC('month', time) as month,
       action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY month, action
ORDER BY month, action

-- Правильное решение
SELECT date_trunc('month', time) as month,
       action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY month, action
ORDER BY month, action