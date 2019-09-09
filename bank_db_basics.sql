select count(*) from transaction;
select * from transaction;
select * from account;

select avg(balance) from account; 

select max(balance) from account; 

select min(balance) from account;

-- Alis, orderBy, 
select accountHolder as "Account Holder", concat ('$ ', Format(Balance,'2')) as Balance
	from account
    order by accountHolder desc;
    
-- Grouping    
select txn_type, sum(amount) 
	from transaction
    group by txn_type;
    
    
-- Lesson on Joins 
-- inner joins are what you will 90% of the itme
select * from account
	join transaction
    on account.ID = transaction.Account_ID;
    
-- SubQuery
select * from account
	where balance > 5000;
    
-- pull the account where the balance is more than the average of all the balances. 
select * from account 
	where balance < 
	(select avg(balance) from account); 
    
    insert into account(accountHolder)
		values ('Sean Blessing');
        
        
-- dates using a alter script
ALTER TABLE account
ADD COLUMN  birthdate date
AFTER       ID;

unlock tables;

drop database;




    

