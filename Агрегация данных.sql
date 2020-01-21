SELECT AVG(timestampdiff(YEAR, birthday_at, NOW())) AS age FROM users;

SELECT date_format(date(concat_ws('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at)))'%W') AS DAY, count(*) AS total FROM users GROUP BY day;