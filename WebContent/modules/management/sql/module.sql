create table structures(id int AUTO_INCREMENT PRIMARY KEY,name varchar(100) not null,
sigle varchar(30),instance varchar(25) not null,typeof varchar(2),business varchar(5),state varchar(1),target varchar(1),
country varchar(3) not null,city varchar(200),
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int not null);


create table contacts(id int AUTO_INCREMENT PRIMARY KEY,firstName varchar(100) not null,
lastName varchar(100) not null,profession varchar(100),
country varchar(3) not null,city varchar(200),
location varchar(200),longitude varchar(50),latitude varchar(50),altitude varchar(50),telephone varchar(60),mobile varchar(60),email varchar(100),bp varchar(60),
fax varchar(60),website varchar(200),youtube varchar(200),facebook varchar(200),twitter varchar(200),
createdOn TIMESTAMP DEFAULT NOW(),createdBy int not null,structure_id int not null);