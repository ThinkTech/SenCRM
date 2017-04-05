drop database common;

create database common;

use common;

drop table structures;

create table structures(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
sigle varchar(30),typeof varchar(2),business varchar(5),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200) not null,
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int,base varchar(200) not null);

insert into structures(name,typeof,business,state,target,country,city,location,email,website,base,createdBy) 
values('ThinkTech',"1","1","1","4","SEN","Dakar","Lot 6, Sonepi, Industrial Zone,Thiaroye Azur","info@thinktech.sn","https://www.thinktech.sn","thinktech",1);

drop TABLE users;

CREATE TABLE users(id int AUTO_INCREMENT PRIMARY KEY, firstName varchar(100) not null,lastName varchar(100) not null,email varchar(100) not null, password varchar(100) not null, 
role varchar(100) not null, lang varchar(2), structure_id int not null,FOREIGN KEY (structure_id) REFERENCES structures(id));

insert INTO users(firstName,lastName,email,password,role,structure_id) VALUES("Mamadou Lamine","Ba","lamine.ba@thinktech.sn","passer","manager",1);

drop database thinktech;

create database thinktech;

use thinktech;

drop table customers;

create table customers(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
sigle varchar(30),typeof varchar(2),business varchar(5),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200) not null,
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int);


insert into customers(name,typeof,business,state,target,country,city,location,email,website,createdBy) 
values('Performat',"1","4","1","4","SEN","Dakar","Lot 6, Sonepi, Industrial Zone,Thiaroye Azur","info@performat.sn","https://www.performat.sn",1);


drop table prospects;

create table prospects(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
sigle varchar(30),typeof varchar(2),business varchar(5),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200) not null,
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int);


drop table partners;

create table partners(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
sigle varchar(30),typeof varchar(2),business varchar(5),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200) not null,
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int);