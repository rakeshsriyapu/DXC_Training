                    
-
insert into branch_master values ('B00001','ASAF ALI ROAD','DELHI')
insert into branch_master values ('B00002','NEW DELHI MAIN BRANCH','DELHI')
insert into branch_master values ('B00003','DELHI CANTT','DELHI')
insert into branch_master values ('B00004','JASOLA','DELHI')
insert into branch_master values ('B00005','MAHIM','MUMBAI')
insert into branch_master values ('B00006','VILE PARLE','MUMBAI')
insert into branch_master values ('B00007','MANDVI','MUMBAI')
insert into branch_master values ('B00008','JADAVPUR','KOLKATA')
insert into branch_master values ('B00009','KODAMBAKKAM','CHENNAI')

insert into customer_master values('C00001','RAMESH','CHANDRA','SHARMA','DELHI','9543198345','SERVICE','1976-12-06')
insert into customer_master values('C00002','AVINASH','SUNDER','MINHA','DELHI','9876532109','SERVICE','1974-10-16')
insert into customer_master values('C00003','RAHUL',NULL,'RASTOGI','DELHI','9765178901','STUDENT','1981-09-26')
insert into customer_master values('C00004','PARUL',NULL,'GANDHI','DELHI','9876532109','HOUSEWIFE','1976-11-03')
insert into customer_master values('C00005','NAVEEN','CHANDRA','AEDEKAR','MUMBAI','8976523190','SERVICE','1976-09-19')
insert into customer_master values('C00006','CHITRESH',NULL,'BARWE','MUMBAI','7651298321','STUDENT','1992-11-06')
insert into customer_master values('C00007','AMIT','KUMAR','BORKAR','MUMBAI','9875189761','STUDENT','1981-09-06')
insert into customer_master values('C00008','NISHA',NULL,'DAMLE','MUMBAI','7954198761','SERVICE','1975-12-03')
insert into customer_master values('C00009','ABHISHEK',NULL,'DUTTA','KOLKATA','9856198761','SERVICE','1973-05-22')
insert into customer_master values('C000010','SHANKAR',NULL,'NAIR','CHENNAI','8765489076','SERVICE','1976-07-12')

insert into loan_details values('C00001','B00001',100000)
insert into loan_details values('C00002','B00002',200000)
insert into loan_details values('C00009','B00008',400000)
insert into loan_details values('C00010','B00009',500000)
insert into loan_details values('C00001','B00003',600000)
insert into loan_details values('C00002','B00001',600000)

insert into account_master values('A00001','C00001','B00001',1000,'2012-12-15','SAVING','ACTIVE')
insert into account_master values('A00002','C00002','B00001',1000,'2012-06-12','SAVING','ACTIVE')
insert into account_master values('A00003','C00003','B00002',1000,'2012-05-17','SAVING','ACTIVE')
insert into account_master values('A00004','C00002','B00005',1000,'2013-01-27','SAVING','ACTIVE')
insert into account_master values('A00005','C00006','B00006',1000,'2012-12-17','SAVING','ACTIVE')
insert into account_master values('A00006','C00007','B00007',1000,'2010-08-12','SAVING','ACTIVE')
insert into account_master values('A00007','C00007','B00001',1000,'2012-10-02','SAVING','ACTIVE')
insert into account_master values('A00008','C00001','B00003',1000,'2009-11-09','SAVING','ACTIVE')
insert into account_master values('A00009','C00003','B00007',1000,'2008-11-30','SAVING','ACTIVE')
insert into account_master values('A000010','C00004','B00002',1000,'2013-03-01','SAVING','ACTIVE')

insert into transaction_details values('T00001','A00001','2013-01-01','CHEQUE','DEPOSIT',2000)
insert into transaction_details values('T00002','A00001','2013-02-01','CASH','WITHDRAWAL',1000)
insert into transaction_details values('T00003','A00002','2013-02-01','CASH','DEPOSIT',3000)
insert into transaction_details values('T00004','A00007','2013-01-11','CASH','DEPOSIT',7000)
insert into transaction_details values('T00005','A00007','2013-01-13','CASH','DEPOSIT',9000)
insert into transaction_details values('T00006','A00001','2013-03-13','CASH','DEPOSIT',4000)
insert into transaction_details values('T00007','A00001','2013-03-14','CHEQUE','DEPOSIT',3000)
insert into transaction_details values('T00008','A00001','2013-03-21','CASH','WITHDRAWAL',9000)
insert into transaction_details values('T00009','A00001','2013-03-22','CASH','WITHDRAWAL',2000)
insert into transaction_details values('T00010','A00002','2013-03-25','CASH','WITHDRAWAL',7000)
insert into transaction_details values('T00011','A00007','2013-03-26','CASH','WITHDRAWAL',2000)
select *from account_master
select *from branch_master
select *from customer_master
select *from loan_details
select *from transaction_details

--Query 1
select account_number,customer_number,firstname,lastname,account_opening_date from
account_master left join customer_master
on account_master.f_customer_number_2=customer_master.customer_number order by account_number

select branch_city from branch_master
--Query 2
select *from customer_master
select count(customer_number) cust_count 
from customer_master 
where customer_city='DELHI'

--Query 3
select *from account_master
select customer_number,firstname,account_number from
account_master join customer_master
on account_master.f_customer_number_2=customer_master.customer_number
where day(account_opening_date)>15
order by customer_number, account_number

--Query 4
select customer_number, firstname,account_number from
account_master join customer_master
on account_master.f_customer_number_2=customer_master.customer_number
where account_status='Terminated'
order by customer_number,account_number

--Query 5
select *from account_master
select *from transaction_details
select transaction_type,count(transaction_number) Trans_Count
from account_master am JOIN transaction_details td
on am.account_number=td.f_account_number
where f_customer_number_2 like '%001'
group by transaction_type
order by transaction_type

--Query 6
select *from customer_master
select *from account_master
SELECT count(customer_number) Count_Customer
FROM customer_master
WHERE customer_number NOT IN (SELECT customer_number FROM account_master)

--Query 7
SELECT td.account_number, opening_balance+sum(transaction_amount) Deposit_Amount
FROM account_master am INNER JOIN transaction_details td
ON am.account_number=td.account_number
WHERE transaction_type='deposit'
GROUP BY  account_number
ORDER BY account_number
