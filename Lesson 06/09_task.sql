/*
Вновь разбейте пользователей из таблицы users на группы по возрасту 
(возраст по-прежнему измеряем количеством полных лет), только теперь добавьте в группировку ещё 
и пол пользователя. Затем посчитайте количество пользователей в каждой половозрастной группе.

Все NULL значения в колонке birth_date заранее отфильтруйте с помощью WHERE.

Колонку с возрастом назовите age, а колонку с числом пользователей — users_count, имя колонки с полом 
оставьте без изменений. Преобразуйте значения в колонке с возрастом в формат INTEGER, чтобы возраст был 
выражен целым числом.

Отсортируйте полученную таблицу сначала по колонке с возрастом по возрастанию, затем по колонке с полом — 
тоже по возрастанию.

Поля в результирующей таблице: age, sex, users_count
*/

-- Мое решение
SELECT DATE_PART('year', AGE(birth_date))::INTEGER AS age,
       sex,
       COUNT(user_id) as users_count
FROM users
WHERE birth_date IS NOT NULL
GROUP BY age, sex
ORDER BY age, sex

-- Правильное решение
SELECT date_part('year', age(birth_date))::integer as age,
       sex,
       count(user_id) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY age, sex
ORDER BY age, sex