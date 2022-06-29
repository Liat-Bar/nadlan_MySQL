create database _nadlan;
use liat_nadlan;
create table agents (
id int auto_increment,
fullName varchar(25),
seniority int,
telephone int,
primary key (id)
);
create table houses (
id int auto_increment,
numberOfRooms int,
numberOfporch int,
age int,
price int,
agent int,
primary key (id),
foreign key (agent) references agent(id)
);
insert into agents (fullName,seniority,telephone) values
("Liat Bar",2,53337271),
(Chen Salhov",10,537202310),
("Ori Gay",5,547520899);

insert into houses (numberOfRooms,numberOfporch,age,price,agent) values
(5,3,25,2500000,1),
(2,0,2,1500000,1),
(10,5,10,5000000,1),
(3,1,2,2000000,1),
(4,2,10,1750000,2),
(5,2,6,2900000,2),
(6,2,3,4000000,2),
(15,6,15,10000000,2),
(2,0,120,500000,3),
(4,1,30,1750000,3),
(2,0,75,3250000,3),
(2,1,250,450000,3);

select * from houses;
select * from agents;


BEGIN
DECLARE x int;
SET x = 1;
WHILE x <= 3 DO
SELECT agents.fullName,price
from houses
INNER JOIN agents
on agent = agents.id WHERE price = (SELECT max(price) FROM houses where agent = x);
-- select agent,price from houses WHERE price = (SELECT max(price) FROM houses where agent = x);
set x = x +1;
end WHILE;

END
