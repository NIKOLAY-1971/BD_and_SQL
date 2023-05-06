DROP DATABASE IF EXISTS home5;
CREATE DATABASE IF NOT EXISTS home5;
USE home5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
create or replace view cars_view1 as
select  *
FROM cars
where cost < 25000;
select * FROM cars_view1;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
alter view cars_view1 as
select  *
FROM cars
where cost < 30000;
select * FROM cars_view1;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create or replace view cars_view2 as
select  *
FROM cars
where `name` = 'Skoda' or `name` = 'Audi';
select * FROM cars_view2;