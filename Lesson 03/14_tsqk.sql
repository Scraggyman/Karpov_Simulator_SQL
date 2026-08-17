-- Мое решение 
SELECT product_id,
       name,
       price as old_price,
       case when name = 'икра' then price
            when price > 100 then price * 1.05
            else price end as new_price
FROM   products
ORDER BY new_price desc, product_id asc

-- Правильное решение
SELECT product_id,
       name,
       price as old_price,
       case when price <= 100 or
                 name = 'икра' then price
            else price * 1.05 end new_price
FROM   products
ORDER BY new_price desc, product_id