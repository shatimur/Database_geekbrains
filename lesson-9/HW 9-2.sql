-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
CREATE FUNCTION hello()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour - HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN
			RETURN "ДОБРОЙ НОЧИ"
		WHEN hour BETWEEN 6 AND 11 THEN
			RETURN "ДОБРОЕ УТРО"
		WHEN hour BETWEEN 12 AND 18 THEN
			RETURN "ДОБРЫЙ ДЕНЬ"
		WHEN hour BETWEEN 18 AND 23 THEN
			RETURN "ДОБРЫЙ ВЕЧЕР"
	END CASE;
END//


-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
	
CREATE TRIGGER validate_name_descr_ins BEFORE INSERT ON prosucts
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Name and descr cannot be NULL simultaneously';
	END IF;
END//

CREATE TRIGGER validate_name_descr_upd BEFORE UPDATE ON prosucts
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Name and descr cannot be NULL simultaneously';
	END IF;
END//