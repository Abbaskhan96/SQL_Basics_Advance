create database db_tables;

# Renaming Alter Database
/*
DDL (Data Definition):
Create 
Alter 
Drop

DML (Data Manipulation):
Select
Insert 
Update
Delete


DCL (Data Control)
Grant
Revoke
*/

#---------------------Tables--Related ---Content----------
use db_tables;

CREATE TABLE CUSTOMERS(
   id int primary key auto_increment,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   gender varchar(6),
   SALARY DECIMAL (18, 2)   
);

truncate table customers;
describe CUSTOMERS;
select * from customers;
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('Ramesh', 25, 'karachi','Male', 2000.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('Ramesh', 25, 'lahore','Male', 1500.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('kaushik', 25, 'peshawar','Female', 2000.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('kaushik', 20, 'sindh','Male', 6500.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('Hardik', 25, 'quetta','Male', 8500.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('Komal', 20, 'gotki','Female', 4500.00);
insert INTO CUSTOMERS(name, age, address, gender, salary) VALUES('Muffy', 25, 'bhawalpur','Male', 10000.00);



#=========order by================
select * from customers;
select * from customers order by NAME, salary desc;

#=== Group by commands used for aggregrate functions while order for only sort====
# ----multiple groups by can be added/use for same data of multiple column gender, age
select * from customers;
select name, age, address, Avg(Salary) as My_avg_salary from customers group by age;
SELECT NAME, AGE, gender, SUM(SALARY) as SUM FROM CUSTOMERS GROUP BY name, age, gender;


#=== Having Clause used with aggregrate functions and group by clauses========
select * from customers;
select Name, gender, age, sum(salary) as SUM from customers group by gender,age having age < 25;


#====Where clause used with SELECT Clause======
select * from customers;
SELECT * FROM CUSTOMERS WHERE NAME LIKE 'k%' AND AGE >= 22 AND SALARY < 3000;
UPDATE CUSTOMERS SET name = 'Abbas' WHERE salary > 9000;
select * from customers;


#== Exists commnds used for select subquery for extracting data with multiple tables
#creating another table for car orders
create table CARS(
   ID INT NOT NULL, 
   NAME VARCHAR(20) NOT NULL, 
   PRICE INT NOT NULL, 
   PRIMARY KEY(ID)
);
describe cars;
insert INTO CARS VALUES(2, 'Maruti Swift', 450000);
insert INTO CARS VALUES(4, 'VOLVO', 2250000);
insert INTO CARS VALUES(7, 'Toyota', 2400000);

select * from customers;
select * from cars;

select * from customers where exists(select price from cars where cars.id=customers.id);
select * from customers where exists(select price from cars where price>2250000 and cars.id=customers.id);

/* Exists with update table commands */
# we can used AND, OR, NOT with them respectively
UPDATE CUSTOMERS SET NAME = 'updated_name' 
WHERE EXISTS (SELECT name FROM CARS WHERE CUSTOMERS.ID = CARS.ID AND price>2250000);
select * from customers;


# for if-else condition in SQL we used 'Case commands'
select * from customers;

#Now we want to make cases for age<22 will be genx else geny and return in new column Generation
select *,
case 
when age<22 then 'Gen-x'
else 'Gen-YYY'
end as 'GENERATIONS'
from customers;
select * from customers;

/*Let's take a look at another query where we want to provide a 25% increment to each customer
 if the salary is less than 4500 from the CUSTOMERS*/

select *,
case
when salary<2400 then (salary + ((salary * 25)/100))
end as 'INCREMENTD SALARY'
from customers;

# between operators in SQL used for ranges purposes of Characters,data, integers
select * from customers;
SELECT * from customers where salary between 1500 and 3500;
SELECT * from customers where salary in (1500,3500);
select * from customers where name between 'H' and 'k';


/* "inner join" is used for extracting common records from two tables*/
#selecting previous both tables customers, cars
select * from customers,cars;

#Both tables have common values id we will extract on the basis of these common values
select * from customers inner join cars on customers.id = cars.id;


/* for left join we will extract common values and the all excepted values of first defined 
column first */
select * from customers left join cars on customers.id=cars.id;

/* Similarly for 'Right join' common and all excepted values of second table
will be extracted */
select * from customers right join cars on customers.id = cars.id;


