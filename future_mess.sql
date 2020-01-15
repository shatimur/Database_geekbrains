use vk;

delete from messages where UNIX_TIMESTAMP(created_at) > UNIX_TIMESTAMP();
select * from messages;