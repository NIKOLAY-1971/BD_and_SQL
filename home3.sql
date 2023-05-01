DROP DATABASE IF EXISTS home3;
CREATE DATABASE IF NOT EXISTS home3;

USE home3;

DROP TABLE IF EXISTS activity_staff;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
`date_activity` DATE,
`count_pages` INT
);

INSERT `activity_staff` (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);

-- 1. Выведите id сотрудников, которые напечатали более 500 страниц за всех дни
select staff_id, sum(count_pages) as 'Количество напечатанных страниц сотрудником' from activity_staff
group by staff_id
having sum(count_pages) > 500;

-- 2. Выведите дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, которые работали в выбранные дни.
select date_activity, count(staff_id) as 'Количество сотрудников' from activity_staff
group by date_activity
having count(staff_id) > 3;

DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

select * from staff;

-- 3. Выведите среднюю заработную плату по должностям, которая составляет более 30000
select post, avg(salary) as 'Средняя заработная плата' from staff
group by post
having avg(salary) > 30000;

-- 4. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
select id, salary  from staff
order by salary desc;

select id, salary  from staff
order by salary;

-- 5.Выведите 5 максимальных заработных плат (salary)
select id, salary  from staff
order by salary desc
limit 5;

-- 6.Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
select post, sum(salary)  from staff
group by post;

-- 7.Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, count(post) FROM staff
where post = 'Рабочий' and age >= 24 and age <= 49;

-- 8. Найдите количество специальностей
select  count(distinct post) as 'Количество специальностей' from staff;

-- 9. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, avg(age) FROM staff
group by post
having avg(age) < 30;