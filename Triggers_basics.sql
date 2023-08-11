show databases;
create database abbas;
show databases;
use abbas;
create table table_abbas (Name varchar(10), age int,
sex varchar(1), doj Date, salary float);

show tables;
describe table_abbas;

select * from table_abbas;


insert into table_abbas
values("Abbas", 25, "M", "2022-09-30", 40000),
("Moiz", 20, "M", "2022-09-31", 35000 ),
("Uzair", 20, "M", "2921-08-30", 45000);

select * from table_abbas;

select avg(age) from table_abbas;

select * from table_abbas where salary in (35000, 40000);

select * from table_abbas;


create database
sql_join;

use sql_join;



create table
cricket
(person_id int auto_increment, primary key(person_id),
name varchar(30)
);

describe cricket;

create table
football
(person_id int auto_increment, primary key(person_id),
name varchar(30)
);



describe cricket;
describe football;

insert into cricket (name)
values
('Abbas'),
('Moiz'),
('Uzair'),
('Wajeeha'),
('Urooba');

select * from cricket;

insert into football (name)
values
('Abbas'),
('Moiz'),
('Shaheer'),
('Anus'),
('Rayan');


select * from football;

# merging both common names tables

# using command innerjoin
select * from cricket inner join football 
using (name);

# on command innerjoin
select * from cricket as c inner join football as f 
on c.name = f.name;


alter table file_example_csv_5000
rename to sample_file;
 

select * from sample_file;


create table
sample_file_2
(s_no int , FirstName varchar(30), lastName varchar(30), Country 
varchar(30));

 
select * from sample_file_2;
describe sample_file_2;

insert into sample_file_2(s_no)
select MyUnknowncolumn from sample_file;

create table
soccer
(
person_id int auto_increment,
primary key(person_id),
Name varchar(30)
);

insert into soccer (name)
values
('Abbas'),
('uzair'),
('wajeeha'),
('urooba');

select * from soccer;


select * from cricket as c
inner join football as f
on c.name = f.name;

# subquery in sql

show databases;

create database	subquery;

use subquery;

show tables;

create table employee
(employee_id int auto_increment, primary key(employee_id),
employee_name varchar(30),
salary float);

select * from employee;

create table new_employee_table
(employee_id_new int auto_increment, primary key(employee_id_new),
employee_name_new varchar(30),
salary_new float);

select * from new_employee_table;

insert into employee(employee_name, salary)
values
('abbas', 75000),
('moiz',80000),
('uzair',90000),
('wajeeha',100000),
('urooba',110000),
('anus',120000);

select * from employee;
select * from new_employee_table;

# inserting using subquery

insert into new_employee_table
select employee_id, employee_name, salary 
from employee 
where
salary < (select avg(salary) from employee);


truncate new_employee_table;

select * from new_employee_table;

# subqueries with update statement ~~ set statement

#creating table 

create table
cricket_subquery_db
(person_id int auto_increment, primary key(person_id),
name varchar(30)
);


insert into cricket_subquery_db(name)
values
('Abbas'),
('Moiz'),
('Uzair'),
('Wajeeha'),
('Urooba');

select * from cricket_subquery_db;

delete from cricket_subquery_db
where name = 'updated name';

create table
football_subquery_db
(person_id int auto_increment, primary key(person_id),
name varchar(30)
);

insert into football_subquery_db (name)
values
('Abbas'),
('Moiz'),
('Shaheer'),
('Anus'),
('Rayan');

select * from football_subquery_db;


# subqueries with update statement ~~ set statement

update cricket_subquery_db 
set name = 'updated name'
where person_id < 
(select avg(person_id) from football_subquery_db);

select * from cricket_subquery_db;


# ===== delete satatement------in subqueries---------

create table
deletion (sno int auto_increment, primary Key(sno),
age int);

create table
deletion_2 (sno_2 int auto_increment, primary Key(sno_2),
age_2 int);

insert into deletion(age)
values

(50),
(60),
(70),
(80);


insert into deletion_2(age_2)
values
(60),
(80),
(90),
(100),
(110),
(120);

select * from deletion_2;


#==== command for delete subquery======
delete from deletion
where age in (select age from deletion_2 where age<90);
 
 

select * from deletion;

 show databases;
 use subquery;
 
 select * from deletion;
 
#=========Triggers=========
#creating databases for trigger

create database trigger_;
use trigger_;

# creating tables
create table 
trigger1
(id int auto_increment primary key,
email varchar(30),
age int
);

create table 
trigger3
(id int auto_increment primary key,
name varchar(30),
birthdate date
);


select * from trigger1;
select * from trigger2;
select * from trigger3;




# creating tables
create table 
trigger2
(id int auto_increment,
MessageID int,
primary key(id, messageId),
Message varchar(300)
);

# creating trigger

# before trigger
delimiter //
create trigger before_trigger
before insert on trigger1 for each row
if new.age<0 then set new.age = 0;
end if
//

insert into trigger1
(email, age)
values
(concat('abbaas','@','gmail.com'), -30),
(concat('abbaas','@','gmail.com'), 30),
(concat('abbaas','@','gmail.com'), -50),
(concat('abbaas','@','gmail.com'), 50);

 
select * from trigger2;
select * from trigger3;
 
# After inserting trigger
Delimiter //
create trigger after_trigger
after insert on trigger3 for each row

if new.birthdate is null then
insert into trigger2
values
(concat("Hi", new.name, "please Enter your Birthdate!"));
end if;
//
delimiter;



#======== using elseif with trigger========
create table salary_info
(
id int auto_increment primary key,
name varchar(300),
salary float
);

#===giving condition if salary is greater then 15000 then set value 1 otherwise it will 0

delimiter \\
create trigger elseif_trigger
before insert on salary_info
for each row

if new.salary <= 15000 then
set new.salary = 0;    # we can also update values (update salary_info set new.salary=xxx)
elseif new.salary >15000 then
set new.salary =1;
end if;
\\
delimiter;

select * from salary_info;

insert into salary_info(name, salary)
values
('Abbas', 16000),
('Wajeeha', 17000),
('Moiz', 15000),
('Urooba', 14000),
('Uzair', 15500);

#==== storing delete data with triggers--=====

create database
del_storing;
use del_storing;

create table salary_info
(
id int auto_increment primary key,
name varchar(300),
salary float,
validdate date
);

insert into salary_info(name, salary, validdate)
values
('Abbas', 16000, '2022-10-01'),
('Wajeeha', 17000,'2022-10-02'),
('Moiz', 15000,'2022-10-03'),
('Urooba', 14000,'2022-10-04'),
('Uzair', 15500, '2022-10-10');


create table
delete_salary
(
id int auto_increment,
primary key(id),
amount float,
validfrom date,
date_delete timestamp default now()
);


select * from salary_info;
select * from delete_salary;
describe delete_salary;

alter table salary_info
drop column name;


delimiter $$
create trigger salary_delete_trigger
before delete
on salary_info
for each row
begin
insert into delete_salary
(amount, validfrom)
values
(old.amount, old.validfrom);
end ;
$$
#delimiter;

use sql_join;
select * from users;

show tables;

use abbas;
show tables;
select * from table_abbas;
insert into table_abbas(Name, salary)
values
("Abbas", "35000"),
("Moiz", "35000")

select * from abbas.dbo.table_abbas a inner join my_sql.dbo.users as b 
where a.Name = b.FirstColumn;


