/*
Напишите SQL-запрос к таблице products и выведите всю информацию о товарах, 
цена которых не превышает 100 рублей. Результат отсортируйте по возрастанию id товара.

Поля в результирующей таблице: product_id, name, price
*/
-- Мое решение
SELECT product_id,
       name,
       price
FROM   products
WHERE  price <= 100
ORDER BY product_id

-- Правильное решение
SELECT product_id,
       name,
       price
FROM   products
WHERE  price <= 100
ORDER BY product_id