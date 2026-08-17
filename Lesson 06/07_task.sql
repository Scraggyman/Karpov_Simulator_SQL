/*
Посчитайте максимальный возраст пользователей мужского и женского пола в таблице users. 
Возраст измерьте числом полных лет.

Новую колонку с возрастом назовите max_age. Преобразуйте значения в новой колонке в формат INTEGER, 
чтобы возраст был выражен целым числом.

Результат отсортируйте по новой колонке по возрастанию возраста.

Поля в результирующей таблице: sex, max_age
*/

-- Мое решение
SELECT sex,
       MAX(DATE_PART('year', AGE(birth_date)))::INTEGER AS max_age
FROM users
GROUP BY sex
ORDER BY max_age;

-- Правильное решение
SELECT sex,
       date_part('year', max(age(birth_date)))::integer as max_age
FROM   users
GROUP BY sex
ORDER BY max_age