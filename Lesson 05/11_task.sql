/*
Посчитайте стоимость заказа, в котором будут три пачки сухариков, две пачки чипсов и один энергетический напиток. 
Колонку с рассчитанной стоимостью заказа назовите order_price.

Для расчётов используйте таблицу products.

Поле в результирующей таблице: order_price
*/

-- Мое решение
SELECT SUM(
    CASE
    WHEN name='сухарики' then price*3
    WHEN name='чипсы' then price*2
    WHEN name='энергетический напиток' then price
    ELSE 0
    END
) AS order_price
FROM products

-- Правильное решение
SELECT sum(case when name = 'сухарики' then price * 3
                when name = 'чипсы' then price * 2
                when name = 'энергетический напиток' then price
                else 0 end) as order_price
FROM   products