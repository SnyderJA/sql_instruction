drop database if exists bank_db;
create database bank_db;
use bank_db;

create table account (
	id 				int 			not null primary key auto_increment,
	accountHolder 	varchar(50) 	not null,
	balance 		int 			not null,
	fees 			int 			not null
    );

Insert into account (accountHolder, balance, fees)
values ('Karlee Abrams', '8888', '20');
Insert into account (accountHolder, balance, fees)
values ('Brytt Lucas', '5444', '175');
Insert into account (accountHolder, balance, fees)
values ('Joelle Fulcher', '3333', '88');
Insert into account (accountHolder, balance, fees)
values ('Justin Snyder', '3322', '88');



create table transaction (
	id 				int 			not null primary key auto_increment,
	amount 			int 			not null,
	txn_type		varchar(20)		not null,
	account_id 		int 			
);

ALTER TABLE transaction
ADD FOREIGN KEY (account_id) REFERENCES account(id);
Insert into transaction (amount, txn_type)
values ('500', 'Deposit');
Insert into transaction (amount, txn_type)
values ('-200', 'Withdrawal');
Insert into transaction (amount, txn_type)
values ('200', 'Deposit');
Insert into transaction (amount, txn_type)
values ('248', 'Deposit');
