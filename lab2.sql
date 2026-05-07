Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.11 sec)

mysql> use ecommerce;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| orders              |
| product             |
+---------------------+
3 rows in set (0.04 sec)

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.03 sec)

mysql> select * from customer;
Empty set (0.05 sec)

mysql> insert into customer(Customer_ID, name, city,email_ID,address,phone_no,pin_code)values('c101','prasenjeet','mumbai','@gmail.com','sairoad','8355918353','421306');
Query OK, 1 row affected (0.07 sec)

mysql> select * from customer;
+-------------+------------+--------+------------+---------+------------+----------+
| Customer_ID | name       | city   | email_ID   | address | phone_no   | pin_code |
+-------------+------------+--------+------------+---------+------------+----------+
| c101        | prasenjeet | mumbai | @gmail.com | sairoad | 8355918353 | 421306   |
+-------------+------------+--------+------------+---------+------------+----------+
1 row in set (0.05 sec)

mysql> select Customer_ID,name from customer;
+-------------+------------+
| Customer_ID | name       |
+-------------+------------+
| c101        | prasenjeet |
+-------------+------------+
1 row in set (0.01 sec)

mysql> insert customer values('c102', 'ayush', 'kalyan', '@gmail.com', 'sonapur', '2266554455', '400078');
Query OK, 1 row affected (0.04 sec)

mysql> Select * from customer;
+-------------+------------+--------+------------+---------+------------+----------+
| Customer_ID | name       | city   | email_ID   | address | phone_no   | pin_code |
+-------------+------------+--------+------------+---------+------------+----------+
| c101        | prasenjeet | mumbai | @gmail.com | sairoad | 8355918353 | 421306   |
| c102        | ayush      | kalyan | @gmail.com | sonapur | 2266554455 | 400078   |
+-------------+------------+--------+------------+---------+------------+----------+
2 rows in set (0.00 sec)

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.09 sec)

mysql> alter table customer modify Customer_ID varchar(10)  not null;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> desc customer
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> alter table customer add bill_no int not null;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
| bill_no     | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> alter table customer add state varchar(20) not null, add country varchar(20) not null;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_ID | varchar(10) | NO   | PRI | NULL    |       |
| name        | varchar(15) | NO   |     | NULL    |       |
| city        | varchar(10) | NO   |     | NULL    |       |
| email_ID    | varchar(10) | NO   |     | NULL    |       |
| address     | varchar(10) | NO   |     | NULL    |       |
| phone_no    | varchar(10) | NO   |     | NULL    |       |
| pin_code    | varchar(10) | YES  |     | NULL    |       |
| bill_no     | int         | NO   |     | NULL    |       |
| state       | varchar(20) | NO   |     | NULL    |       |
| country     | varchar(20) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
10 rows in set (0.04 sec)

mysql> alter table customer change column name customer_name varchar(20) not null;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc customer;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Customer_ID   | varchar(10) | NO   | PRI | NULL    |       |
| customer_name | varchar(20) | NO   |     | NULL    |       |
| city          | varchar(10) | NO   |     | NULL    |       |
| email_ID      | varchar(10) | NO   |     | NULL    |       |
| address       | varchar(10) | NO   |     | NULL    |       |
| phone_no      | varchar(10) | NO   |     | NULL    |       |
| pin_code      | varchar(10) | YES  |     | NULL    |       |
| bill_no       | int         | NO   |     | NULL    |       |
| state         | varchar(20) | NO   |     | NULL    |       |
| country       | varchar(20) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
10 rows in set (0.02 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| Customer_id  | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(5)  | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.04 sec)

mysql> create table demo(id varchar(20) not null primary key, name varchar(20) not null);
Query OK, 0 rows affected (0.11 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(20) | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.07 sec)

mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| demo                |
| orders              |
| product             |
+---------------------+
4 rows in set (0.02 sec)

mysql> use ecommerce;
Database changed
mysql> select * from customer;
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
| Customer_ID | customer_name | city   | email_ID   | address | phone_no   | pin_code | bill_no | state | country |
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
| c101        | prasenjeet    | mumbai | @gmail.com | sairoad | 8355918353 | 421306   |       0 |       |         |
| c102        | ayush         | kalyan | @gmail.com | sonapur | 2266554455 | 400078   |       0 |       |         |
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
2 rows in set (0.08 sec)

mysql> delete from customer where Customer_id = 'c102';
Query OK, 1 row affected (0.04 sec)

mysql> select * from customer;
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
| Customer_ID | customer_name | city   | email_ID   | address | phone_no   | pin_code | bill_no | state | country |
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
| c101        | prasenjeet    | mumbai | @gmail.com | sairoad | 8355918353 | 421306   |       0 |       |         |
+-------------+---------------+--------+------------+---------+------------+----------+---------+-------+---------+
1 row in set (0.01 sec)

mysql> select * from demo;
Empty set (0.09 sec)

mysql> truncate table orders;
Query OK, 0 rows affected (0.18 sec)

mysql> desc orders;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| order_id     | int         | NO   | PRI | NULL    | auto_increment |
| Customer_id  | varchar(5)  | NO   | MUL | NULL    |                |
| product_id   | varchar(5)  | NO   | MUL | NULL    |                |
| quantity     | int         | NO   |     | NULL    |                |
| total_price  | double      | NO   |     | NULL    |                |
| payment_mode | varchar(20) | NO   |     | NULL    |                |
| order_date   | date        | NO   |     | NULL    |                |
| order_status | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.05 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(20) | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.08 sec)

mysql> insert into demo values('101', 'Ajay');
Query OK, 1 row affected (0.03 sec)

mysql> select * from demo;
+-----+------+
| id  | name |
+-----+------+
| 101 | Ajay |
+-----+------+
1 row in set (0.00 sec)

mysql> truncate table demo;
Query OK, 0 rows affected (0.10 sec)

mysql> select * from demo;
Empty set (0.03 sec)

mysql> desc demo;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(20) | NO   | PRI | NULL    |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.03 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.05 sec)

mysql> desc orders;
ERROR 1146 (42S02): Table 'ecommerce.orders' doesn't exist
mysql>