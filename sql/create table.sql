CREATE SCHEMA `minions`;
USE `minions`;
create table minions(
id INT primary key auto_increment,
name VARCHAR(45) NOT NULL,
age INT(30)
);

create table towns(
id INT primary key auto_increment,
name VARCHAR(45) 
);