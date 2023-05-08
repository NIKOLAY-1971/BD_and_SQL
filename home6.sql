DROP DATABASE IF EXISTS home6;
CREATE DATABASE IF NOT EXISTS home6;
USE home6;

/*Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/
delimiter //
CREATE FUNCTION format_time(sec int)
RETURNS varchar(45)
DETERMINISTIC
BEGIN
DECLARE d int;
DECLARE h int;
DECLARE m int;
DECLARE s int;
set d = floor(sec / 86400);
set sec = sec - d * 86400;
set h = floor(sec / 3600);
set sec = sec - h * 3600;
set m = floor(sec / 60);
set s = sec- m * 60;
return concat(d, ' days ', h, ' hours ', m, ' minutes ', s, ' seconds');
END //
delimiter ;

select format_time(123456);

/*Выведите только четные числа от 1 до 10.
Пример: 2,4,6,8,10*/
delimiter //
CREATE FUNCTION even_numbers(a int , b int)
RETURNS varchar(45)
DETERMINISTIC
BEGIN
DECLARE result  varchar(45);
set result='';
while a <= b do
if mod(a, 2) = 0 then  set result = concat(result, ' ', a);  end if;
set a = a + 1;
end while;
return result;
end //
delimiter ;

select even_numbers(1, 10) as 'Четные числа';

