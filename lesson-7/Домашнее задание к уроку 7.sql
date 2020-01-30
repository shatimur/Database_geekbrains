-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
select u.id, u.name from users AS u join orders as o where u.id=o.user_id;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
select p.id, p.name, c.name from products as p join catalogs as c where p.catalog_id = c.id;