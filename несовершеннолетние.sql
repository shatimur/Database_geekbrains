
use vk;

update profiles 
set is_active = 'false'
where  ((YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))) < 18;
select * from profiles;