show databases;
create database if not exists bankinsurance;
show databases;
use bankinsurance;
create table branch(branch_name varchar(30),branch_city varchar(30),assets real,primary key(branch_name));
create table bankaccount(accno int,branch_name varchar(30),balance real,primary key(accno),foreign key(branch_name)references branch(branch_name));
create table bankcustomer(customer_name varchar(30),customer_street varchar(30),primary key(customer_name));
create table depositer(customer_name varchar(30),accno int,primary key(customer_name,accno),foreign key(customer_name)references bankcustomer(customer_name),foreign key(accno)references bankaccount(accno));
create table loan(loan_number varchar(30
LOAN (loan-number: int, branch-name: String, amount: real)
LOAN (loan-number: int, branch-name: String, amount: real)