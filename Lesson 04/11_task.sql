/*
Определите id и даты рождения 50 самых молодых пользователей мужского пола из таблицы users. 
Не учитывайте тех пользователей, у которых не указана дата рождения.

Поле в результирующей таблице: user_id, birth_date
*/

--Мое решение
SELECT user_id,
       birth_date
FROM   users
WHERE  birth_date is not null
   and sex = 'male'
ORDER BY birth_date desc limit 50

-- Правильное решение
SELECT user_id,
       birth_date
FROM   users
WHERE  sex = 'male'
   and birth_date is not null
ORDER BY birth_date desc limit 50