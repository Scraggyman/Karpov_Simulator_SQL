/*
Рассчитайте среднюю цену товаров в таблице products, в названиях которых присутствуют слова «чай» или «кофе». 
Любым известным способом исключите из расчёта товары, содержащие в названии «иван-чай» или «чайный гриб».

Среднюю цену округлите до двух знаков после запятой. Столбец с полученным значением назовите avg_price.

Поле в результирующей таблице: avg_price
*/

-- Мое решение
SELECT ROUND(AVG(price), 2) AS avg_price
FROM products
WHERE
    (name LIKE '%чай%' OR name LIKE '%кофе%')
    AND name NOT LIKE '%иван-чай%'
    AND name NOT LIKE '%чайный гриб%';

-- Правильное решение
SELECT round(avg(price), 2) as avg_price
FROM   products
WHERE  (name ilike '%чай%'
    or name ilike '%кофе%')
   and name not ilike '%иван-чай%'
   and name not ilike '%чайный гриб%'