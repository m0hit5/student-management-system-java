drop database if exists kc_5jan23;
create database if not exists kc_5jan23;
create table student
(
	rno int primary key,
	name varchar(20) not null,
	maths int not null,
	science int not null,
	social int not null,
);
desc student;
