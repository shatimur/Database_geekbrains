-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select 
	m.from_user_id
	, concat(u.firstname, ' ', u.lastname) as name
	, count(*) as 'total msg'
from messages as m
join users as u on u.id = m.from_user_id
where m.to_user_id = 1
group by m.from_user_id
order by count(*) desc
limit 1;

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

select count(*) -- количество лайков
from likes as l
join media as m on l.media_id = m.id
join profiles as p on p.user_id = m.user_id
where  ((YEAR(CURDATE()) - YEAR(birthday)) < 10);

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select 
	gender, count(*) as total_likes
from (
	select 
		user_id as user,
		(
			select gender 
			from vk.profiles
			where user_id = user
		) as gender
	from likes
) as alias
group by gender
limit 1;