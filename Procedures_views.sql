create database
procedures;

use procedures;

create table
selected_persons
(
id int auto_increment primary key,
name varchar(300),
status varchar(300)
);

insert into selected_persons(name, status)
values
('Abbas', 'Selected'),
('Moiz', 'Selected'),
('Uzair', 'Not-Selected'),
('Anus','Not-Selected'),
('Shaheer', 'Not-Selected');

select * from selected_persons;


#--------Creating Procedures---------------
#===========================================

delimiter &&
create procedure selection_saved()
begin
select * from selected_persons where
status = 'Selected';
end;
&&
delimiter ;

select * from selected_persons;

call selection_saved();



#-----Procedures with parameters--------------
#=============================================

#creating new employee table

create table employee_info
(
sno int auto_increment primary key,
name varchar(300),
sex char(1),
age int,
Country varchar(300),
City varchar(300),
salary float
);


# inserting the values

insert into employee_info
(name, sex, age, Country, City, salary)
values
('Abbas', 'M', 25, 'Pakistan','Sindh', 35000),
('Moiz', 'M', 23, 'Bangladesh','Dhaka', 30000),
('Wajeeha', 'F', 23, 'US','Florida', 25000),
('Urooba', 'F', 27, 'Canada','Toronto', 24000),
('Anus', 'M', 25, 'Indonesia','kuala-lampur', 23000);

select * from employee_info;

#-----procedure with parameters----------

delimiter //
create procedure top_salary(IN var int)
begin
select sno, name, sex, salary from employee_info
order by salary desc limit var;
end;
//
delimiter ;


call top_salary(4);



#---------Updating values using Procedures--------------------
#=============================================================

select * from employee_info;

delimiter  //
create procedure updatevalues(IN new_name varchar(30), in new_salary float)
begin
update employee_info
set salary = new_salary where name = new_name;
end; //
delimiter ;

select * from employee_info;

call updatevalues('Anus', 50000);
call updatevalues('Abbas', 50000);


#-----Store Procedures--using OUT param-----------
#===================================================

# suppose, we have to count the total numbers of female employees in table

select * from employee_info;

Delimiter //
create procedure sp_count_emp(out total_emp int)
begin
select count(name) into total_emp from employee_info
where sex = 'F' ;
end
//
delimiter ;

call sp_count_emp(@female_emp);
select @Female_emp as Total_Female_Employees;


# insert new values to the table employee_info far checkiug the procedure


insert into employee_info
(name, sex, age, Country, City, salary)
values
('dummy_name', 'F', 25, 'China', 'Beijing', 35000);

select * from employee_info;

call sp_count_emp(@total_female_employee);
select @total_female_employee as total_F_employees;


#--------------Views in SQL--------------------------------------------------
#============================================================================
# views used to display and store/copy the columns of one table to newly created other
use classicmodels;

select * from customers;

# =======Creating Views===============================================

create view copy_customers as
select customerNumber, customerName,phone, city, creditLimit 
from customers;

select * from customers;
select * from copy_customers;

#=================================================================================
#--------------------Creating views with inner-joins------------------------------
#=================================================================================


select * from products;
select * from productlines;


#creating views
create view copy_same_productline_description as
select p.productline, p.productName,p.MSRP, pl.textDescription 
from products as p
inner join
productlines as pl
where p.productline = pl.productLine;

#--------------------checking the views----------------------
select * from products;
select * from productlines;
select * from copy_same_productline_description;


#---renaming the view-----------

rename table copy_same_productline_description to vehicle_descriptions;
 
 
#=================Displaying views================

show full tables
where table_type = 'VIEW';
