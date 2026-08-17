/*
Посчитайте число пользователей, попавших в каждую возрастную группу. Группы назовите соответственно «18-24», 
«25-29», «30-35», «36+» (без кавычек).

В расчётах не учитывайте пользователей, у которых не указана дата рождения. 
Как и в прошлых задачах, в качестве возраста учитывайте число полных лет.

Выведите наименования групп и число пользователей в них. Колонку с наименованием групп назовите group_age, 
а колонку с числом пользователей — users_count.

Отсортируйте полученную таблицу по колонке с наименованием групп по возрастанию.

Поля в результирующей таблице: group_age, users_count
*/

-- Мое рещение
SELECT 
    CASE 
        WHEN EXTRACT(YEAR FROM AGE(current_date, birth_date)) BETWEEN 18 AND 24 THEN '18-24'
        WHEN EXTRACT(YEAR FROM AGE(current_date, birth_date)) BETWEEN 25 AND 29 THEN '25-29'
        WHEN EXTRACT(YEAR FROM AGE(current_date, birth_date)) BETWEEN 30 AND 35 THEN '30-35'
        ELSE '36+'
    END AS group_age,
    COUNT(DISTINCT user_id) AS users_count
FROM users
WHERE EXTRACT(YEAR FROM AGE(current_date, birth_date)) >= 18
GROUP BY group_age
ORDER BY group_age;

-- Правильное решение
SELECT case when date_part('year', age(birth_date)) between 18 and
                 24 then '18-24'
            when date_part('year', age(birth_date)) between 25 and
                 29 then '25-29'
            when date_part('year', age(birth_date)) between 30 and
                 35 then '30-35'
            when date_part('year', age(birth_date)) >= 36 then '36+' end as group_age,
       count(user_id) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY group_age
ORDER BY group_age