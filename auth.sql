drop database if exists auth;
create database if not exists auth;
use auth;
create table users
(
	user varchar(30) primary key,
	pass varchar(30)
);
create table subs
(
	email varchar(30) primary key
);
desc users;
