drop database IF EXISTS general;

create database general;

use general;

create table structures(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
acronym varchar(30),typeof varchar(2),business varchar(5),size varchar(1),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200),
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int);

CREATE TABLE subscriptions(id int AUTO_INCREMENT PRIMARY KEY, mailing boolean,hosting varchar(20) not null,modules varchar(15000) not null,structure_id int not null,FOREIGN KEY(structure_id) REFERENCES structures(id));

CREATE TABLE users(id int AUTO_INCREMENT PRIMARY KEY, firstName varchar(100) not null,lastName varchar(100) not null, profession varchar(100),email varchar(100) not null, password varchar(100) not null,lang varchar(2) default "en",owner boolean);

CREATE TABLE accounts(id int AUTO_INCREMENT PRIMARY KEY, 
main boolean,activated boolean,activation_code varchar(300),trial boolean,role varchar(100) not null, structure_id int not null, user_id int not null,FOREIGN KEY(user_id) REFERENCES users(id),createdOn TIMESTAMP DEFAULT NOW(),createdBy int);