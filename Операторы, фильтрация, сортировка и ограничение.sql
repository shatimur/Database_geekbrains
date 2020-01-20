update users set created_at=NOW(), updated_at=NOW();

update users set created_at = STR_TO_DATE(created_at, '%d.%m.%Y. %k:%i'), updated_at = STR_TO_DATE(created_at, '%d.%m.%Y. %k:%i');

alter table users change created_at created_at DATETIME default current_timestamp;

alter table users change updated_at updated_at DATETIME default current_timestamp on update current_timestamp;

select * from storehouses_products order by IIF(value>0, 0, 1), value;