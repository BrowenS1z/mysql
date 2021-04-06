/* Задача 1
	Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
 */
UPDATE users 
SET created_at = NOW(),
	updated_at = NOW()
WHERE created_at IS NULL; -- Если одно поле ровно NULL. Обновляем оба

/* Задача 2
	Таблица users была неудачно спроектирована. 
	Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
	Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
 */
UPDATE users
SET created_at = STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%S'),
    updated_at = STR_TO_DATE(updated_at, '%Y-%m-%d %H:%i:%S');
   
/* Задача 3
	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
	Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех 
 */   
SELECT value FROM storehouses_products ORDER BY case when value then 0 else 1 end, value

/* Задача 4
	Подсчитайте средний возраст пользователей в таблице users.
 */
SELECT name,
AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25)) AS avg_age
FROM users;
