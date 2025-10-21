show databases;
create database if not exists bankinsurance;
show databases;
use bankinsurance;
create table branch(branch_name varchar(30),branch_city varchar(30),assets real,primary key(branch_name));
create table bankaccount(accno int,branch_name varchar(30),balance real,primary key(accno),foreign key(branch_name)references branch(branch_name));
create table bankcustomer(customer_name varchar(50),customer_street varchar(30),primary key(customer_name));
create table depositer(customer_name varchar(50),accno int,primary key(customer_name,accno),foreign key(customer_name)references bankcustomer(customer_name),foreign key(accno)references bankaccount(accno));
create table loan(loan_number int,branch_name varchar(30),amount real,primary key(loan_number),foreign key(branch_name)references bankaccount(branch_name));
alter table bankcustomer add (customer_city varchar(30));
insert into branch values("SBI_Chamrajpet","Bangalore",50000);
insert into branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into branch values("SBI_ShivajiRoad","Bombay",20000);
insert into branch values("SBI_ParliamentRoad","Delhi",10000);
insert into branch values("SBI_Jantarmantar","Delhi",20000);
select *from branch;
insert into bankaccount values(1,"SBI_Chamrajpet",2000);
insert into bankaccount values(2,"SBI_ResidencyRoad",5000);
insert into bankaccount values(3,"SBI_ShivajiRoad",6000);
insert into bankaccount values(4,"SBI_Parliament",9000);
insert into bankaccount values(5,"SBI_Jantarmantar",8000);
insert into bankaccount values(6,"SBI_ShivajiRoad",4000);
insert into bankaccount values(8,"SBI_ResidencyRoad",4000);
insert into bankaccount values(9,"SBI_Parliament",3000);
insert into bankaccount values(10,"SBI_Residency",5000);
insert into bankaccount values(11,"SBI_Jantarmantar",2000);
select *from bankaccount;
insert into bankcustomer values("Avinash","Bull_Temple_Road","Bangalore");
insert into bankcustomer values("Dinesh","Bannergatta_Road","Bangalore");
insert into bankcustomer values("Mohan","NationalCollege_Road","Bangalore");
insert into bankcustomer values("Nikil","Akbar_Road","Delhi");
insert into bankcustomer values("Ravi","Prithviraj_Road","Delhi");
select *from bankcustomer;
insert into depositer values("Avinash",1);
insert into depositer values("Dinesh",2);
insert into depositer values("Nikil",4);
insert into depositer values("Ravi",5);
insert into depositer values("Avinash",8);
insert into depositer values("Nikil",9);
insert into depositer values("Dinesh",10);
insert into depositer values("Nikil",11);
select *from depositer;
insert into loan values(1,"SBI_Chamrajpet",1000);
insert into loan values(2,"SBI_ResidencyRoad",2000);
insert into loan values(3,"SBI_ShivajiRoad",3000);
insert into loan values(4,"SBI_Parliament",4000);
insert into loan values(5,"SBI_Jantarmantar",4000);
select *from loan;

SELECT branch_name,(assets / 100000) AS `assets in lakhs`FROM branch;
SELECT depositer.customer_name FROM depositer JOIN bankaccount ON depositer.accno = bankaccount.accno WHERE bankaccount.branch_name = 'ResidencyRoad' GROUP BY depositer.customer_name HAVING COUNT(depositer.accno)>= 2;
CREATE VIEW branch_loan_sums AS SELECT branch_name, SUM(amount) AS total_loan_amount FROM loan GROUP BY branch_name;
select *from branch loan;
SELECT d.customer_name FROM depositer d JOIN bankaccount b ON d.accno = b.accno JOIN branch br ON b.branch_name = br.branch_name WHERE br.branch_city = 'Delhi' GROUP BY d.customer_name HAVING COUNT(DISTINCT br.branch_name) = (SELECT COUNT(branch_name) FROM branch WHERE branch_city = 'Delhi');
SELECT DISTINCT l.branch_name FROM loan l WHERE l.branch_name NOT IN ( SELECT DISTINCT b.branch_name FROM bankaccount b JOIN depositer d ON b.accno = d.accno ); 
SELECT DISTINCT d.customer_name FROM depositer d JOIN bankaccount b ON d.accno = b.accno WHERE b.branch_name IN (SELECT branch_name FROM branch WHERE branch_city = 'Bangalore') AND b.branch_name IN (SELECT branch_name FROM loan);
SELECT branch_name FROM branch WHERE assets > ALL (SELECT assets FROM branch WHERE branch_city = 'Bangalore');
DELETE FROM bankaccount WHERE branch_name IN (SELECT branch_name FROM branch WHERE branch_city = 'Bombay');
UPDATE bankaccount SET balance = balance * 1.05 WHERE accno >= 0;





