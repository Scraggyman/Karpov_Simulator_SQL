/*
Выберите из таблицы products id и наименования только тех товаров, 
названия которых начинаются на букву «с» и содержат только одно слово.

Результат должен быть отсортирован по возрастанию id товара.

Поля в результирующей таблице: product_id, name
*/

-- Мое решение
SELECT product_id,
       name
FROM   products
WHERE  name like 'с%'
   and split_part(name, ' ', 2) = '' -- второй "слово-слот" пуст → только одно слово
ORDER BY product_id;

-- Правильное решение
SELECT product_id,
       name
FROM   products
WHERE  name not like '% %'
   and name like 'с%'
ORDER BY product_id