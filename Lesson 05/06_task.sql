/*
Посчитайте количество курьеров женского пола в таблице couriers. 
Полученный столбец с одним значением назовите couriers.

Поле в результирующей таблице: couriers
*/

-- Мое решение
SELECT count(courier_id) as couriers
FROM   couriers
WHERE  sex = 'female'

-- Правильное решение
SELECT count(courier_id) as couriers
FROM   couriers
WHERE  sex = 'female'