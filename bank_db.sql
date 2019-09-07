-- Drop and Create the Database, DDL

drop database if exists bank_db;
create database bank_db;
use bank_db;

-- Create the account table, DDL
create table account (
	id 				int 				not null primary key auto_increment,
	accountHolder 	varchar(50) 		not null,
	balance 		decimal(6,2) 		not null,
	fees 			decimal(6,2)		not null
    );

-- Insert Data into the account table, DML
Insert into account (accountHolder, balance, fees)
values ('Karlee Abrams', '8888', '20');
Insert into account (accountHolder, balance, fees)
values ('Brytt Lucas', '5444', '175');
Insert into account (accountHolder, balance, fees)
values ('Joelle Fulcher', '3333', '88');
Insert into account (accountHolder, balance, fees)
values ('Justin Snyder', '3322', '88');


-- Create the transaction table, DDL
create table transaction (
	id 				int 			not null primary key auto_increment,
	amount 			decimal(6.2) 	not null,
	txn_type		varchar(20)		not null,
	account_id 		int 			not null
);
-- create the foregin key, DDL
ALTER TABLE transaction
ADD FOREIGN KEY (account_id) REFERENCES account(id);

--insert data in to the account table, DML
Insert into transaction (amount, txn_type, account_id)
values ('500', 'Deposit', '3');
Insert into transaction (amount, txn_type, account_id)
values ('-200', 'Withdrawal', '4');
Insert into transaction (amount, txn_type, account_id)
values ('200', 'Deposit', '4');
Insert into transaction (amount, txn_type, account_id)
values ('248', 'Deposit', '1');
