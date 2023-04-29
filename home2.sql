drop schema if exists home2;
create schema if not exists home2;
use home2;

/*1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.*/

drop table if exists sales;
create table if not exists sales
(
id int primary key auto_increment,
order_data date not null,
count_product int not null
);
insert into sales (order_data, count_product)
values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

select * from sales;

/*2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ*/

select
id as 'id заказа',
if (count_product < 100, 'Маленький заказ',
if (count_product > 300, 'Большой заказ','Средний заказ'))
as 'Тип заказа'
from sales;

/*3. Создайте таблицу “orders”, заполните ее значениями
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»*/

drop table if exists orders;
create table if not exists orders
(
id int primary key auto_increment,
employee_id varchar(10) not null,
amount float not null,
order_status varchar(45) not null
);

insert into orders (employee_id, amount, order_status)
values
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

select * from orders;

select id,
case
	when order_status = 'OPEN' then 'Order is in open state'
    when order_status = 'CLOSED' then 'Order is closed'
    when order_status = 'CANCELLED' then 'Order is cancelled'
end as full_order_status
from orders;