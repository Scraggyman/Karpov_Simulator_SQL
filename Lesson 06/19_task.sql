/*

*/

-- Мое решение
SELECT
    DATE_PART('isodow', time)::INTEGER AS weekday_number,
    TO_CHAR(time, 'Dy') AS weekday,
    COUNT(order_id) FILTER (WHERE action = 'create_order') AS created_orders,
    COUNT(order_id) FILTER (WHERE action = 'cancel_order') AS canceled_orders,
    COUNT(*) FILTER (WHERE action = 'create_order')
      - COUNT(*) FILTER (WHERE action = 'cancel_order') AS actual_orders ,
    ROUND(
        (
            COUNT(*) FILTER (WHERE action = 'create_order')
            - COUNT(*) FILTER (WHERE action = 'cancel_order')
        )::DECIMAL
        / COUNT(*) FILTER (WHERE action = 'create_order'), 3) AS success_rate
FROM user_actions
WHERE time BETWEEN '2022-08-24' AND '2022-09-07'
GROUP BY weekday_number, weekday
ORDER BY weekday_number

-- Правильное решение
SELECT date_part('isodow', time)::int as weekday_number,
       to_char(time, 'Dy') as weekday,
       count(order_id) filter (WHERE action = 'create_order') as created_orders,
       count(order_id) filter (WHERE action = 'cancel_order') as canceled_orders,
       count(order_id) filter (WHERE action = 'create_order') - count(order_id) filter (WHERE action = 'cancel_order') as actual_orders,
       round((count(order_id) filter (WHERE action = 'create_order') - count(order_id) filter (WHERE action = 'cancel_order'))::decimal / count(order_id) filter (WHERE action = 'create_order'),
             3) as success_rate
FROM   user_actions
WHERE  time >= '2022-08-24'
   and time < '2022-09-07'
GROUP BY weekday_number, weekday
ORDER BY weekday_number