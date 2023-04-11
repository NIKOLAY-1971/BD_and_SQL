/*
create database phone;
use phone;

create table nomenclature
(
idnomenclature int primary key not null,
phone_brand varchar(30) not null,
phone_model varchar(100) not null,
phone_price varchar(10),
number_of_phones varchar(10)
);
*/
insert nomenclature
(
idnomenclature, phone_brand, phone_model, phone_price, number_of_phones
)
values
(1, 'Samsung', 'Samsung Galaxy A53 5G 6/256 ГБ, Dual nano SIM, белый', '31180', '10'),
(2, 'Samsung', 'Samsung Galaxy A33 5G 6/128 ГБ, Dual nano SIM, черный', '20790', '8'),
(3, 'Samsung', 'Samsung Galaxy S22 8/128 ГБ, Dual: nano SIM + eSIM, фиолетовый', '61310', '18'),
(4, 'Samsung', 'Samsung Galaxy A23 4/64 ГБ, Dual nano SIM, черный', '14602', '1'),
(5, 'Xiaomi', 'Xiaomi Redmi A1+ 2/32 GB, зеленый', '4990', '8'),
(6, 'Xiaomi', 'Xiaomi Redmi 10C 4GB/64GB серый', '9999', '40'),
(7, 'Honor', 'Honor X6 4/64Gb, VNE-LX1, черная полночь', '9990', '15');

select * from nomenclature
where number_of_phones > 2;

select * from nomenclature
where phone_brand = 'Samsung';