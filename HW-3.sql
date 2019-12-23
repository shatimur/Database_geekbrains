USE vk;

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    edited_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS music;
CREATE TABLE music(
	id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    author varchar(50),
    media_type_id BIGINT UNSIGNED NOT NULL,
    `length` TIME,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
    );

DROP TABLE IF EXISTS video;
CREATE TABLE video(
	id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    owner ENUM ('user_id', 'free'),
    author varchar(50),
    media_type_id BIGINT UNSIGNED NOT NULL,
    `length` TIME,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
    );
