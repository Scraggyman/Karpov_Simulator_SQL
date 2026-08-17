/*
Воспользуйтесь функцией AGE и рассчитайте разницу в возрасте между самым старым и 
самым молодым пользователями женского пола в таблице users. 

Разницу в возрасте выразите количеством лет, месяцев и дней, переведя её в тип VARCHAR. 

Колонку с посчитанным значением назовите age_diff.

Поле в результирующей таблице: age_diff
*/
-- Мое решение
SELECT (MAX(AGE(current_date, birth_date)) - MIN(AGE(current_date, birth_date)))::VARCHAR AS age_diff
FROM users
WHERE sex = 'female'

-- Правильное решение
SELECT age(max(birth_date), min(birth_date))::varchar as age_diff
FROM   users
WHERE  sex = 'female'