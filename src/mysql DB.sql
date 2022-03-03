create database payroll_service;
show databases;
use payroll_service;

create table employee_payroll(id int not null auto_increment,
								employee_name Varchar(10) not null,
                                salary float,
                                start_date date,
                                primary key(id));
                                
insert into employee_payroll values(1,'ABC', 1000.48, '2022-03-03'),
									(2,'DEF', 1010.48, '2022-03-04'),
                                    (3,'GHI', 1020.58, '2022-03-02'),
                                    (5,'JKL', 1030.29, '2022-02-03');
                                    
select salary from employee_payroll where name = 'DEF';
select * from employee_payroll where start_date between cast('2022-03-02' as date) and date(now());

alter table employee_payroll modify gender char(1) after employee_name;
desc employee_payroll;
update employee_payroll set gender = 'M' where id = 1;
update employee_payroll set gender = 'F' where employee_name = 'DEF' or id = 3 or start_date ='2022-02-03' ;
select * from employee_payroll;

select sum(salary) from employee_payroll where gender = 'F' group by gender;
select avg(salary) from employee_payroll where gender = 'F';
select min(salary) from employee_payroll group by gender;
select max(salary) from employee_payroll;
select count(gender) from employee_payroll group by gender;

drop table employee_payroll;
create table employee_payroll (id int unsigned not null  auto_increment, 
								employee_name varchar(150),
                                primary key(id));
alter table employee_payroll add  (phoneNo varchar(250), 
									address varchar(250), 
                                    department varchar(150));
desc employee_payroll;
alter table employee_payroll alter address set default 'Mumbai';
alter table employee_payroll change employee_name employee_name varchar(150) not null;
alter table employee_payroll change department department varchar(150) not null;

alter table employee_payroll add gender char(1) after department;
alter table employee_payroll add  (basic_pay double not null, 
									deductions double not null, 
                                    taxable_pay double not null,
                                    incometax double not null,
                                    net_pay double not null);
desc employee_payroll;
alter table employee_payroll add start_date date not null;

select * from employee_payroll;
insert into employee_payroll values (2, 'Terrisa','NULL' ,'NULL', 'sales', 'F', 3000000,0 ,0 , 0, 0, '2019-11-13'),
									(6, 'Terrisa','NULL' ,'NULL', 'Marketting','F', 3000000,1000000, 2000000, 500000, 1500000,'2020-11-13');
insert into employee_payroll values(3, 'Rekha','NULL' ,'NULL', 'IT','F', 6000000,1000000, 5000000, 200000, 1500000,'2020-12-27'),
									(4, 'Sai','NULL' ,'NULL', 'Sales','M', 8000000,1000000, 9000000, 700000, 1500000,'2020-12-22');
select * from employee_payroll where employee_name = 'Terrisa';