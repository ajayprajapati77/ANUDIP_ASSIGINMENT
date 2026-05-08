mysql> use ecommerce;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customer            |
| orders              |
| product             |
+---------------------+
3 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 4356787534   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
3 rows in set (0.01 sec)

mysql> desc customer;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| customer_id   | varchar(10)  | NO   | PRI | NULL    |       |
| customer_name | varchar(10)  | NO   |     | NULL    |       |
| city          | varchar(10)  | YES  |     | NULL    |       |
| email         | varchar(20)  | YES  |     | NULL    |       |
| address       | varchar(100) | YES  |     | NULL    |       |
| phone_number  | varchar(10)  | NO   |     | NULL    |       |
| pincode       | varchar(6)   | NO   |     | NULL    |       |
| bill          | int          | NO   |     | NULL    |       |
| state         | varchar(10)  | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
9 rows in set (0.01 sec)

mysql> update customer set phone_number = '7208226998' where customer_id = 'C101';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_name like '%ya';
+-------------+---------------+-------+-------------------+---------+--------------+---------+------+--------+
| customer_id | customer_name | city  | email             | address | phone_number | pincode | bill | state  |
+-------------+---------------+-------+-------------------+---------+--------------+---------+------+--------+
| C103        | Arshiya       | thane | arshiya@gmail.com | grace   | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+-------+-------------------+---------+--------------+---------+------+--------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_name like '%yes%';
+-------------+---------------+-------+------------------+---------+--------------+---------+------+-------+
| customer_id | customer_name | city  | email            | address | phone_number | pincode | bill | state |
+-------------+---------------+-------+------------------+---------+--------------+---------+------+-------+
| C101        | Ayesha        | Thane | ayesha@gmail.com | Almas   | 7208226998   | 400612  |    0 |       |
+-------------+---------------+-------+------------------+---------+--------------+---------+------+-------+
1 row in set (0.00 sec)

mysql> select * from customer where customer_name like 'Ar%';
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
2 rows in set (0.00 sec)

mysql> select * from customer where customer_name like 'A____';
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
| customer_id | customer_name | city   | email           | address        | phone_number | pincode | bill | state |
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
| C102        | Ariba         | Mumbra | ariba@gmail.com | Zoha Apartment | 2345678906   | 400612  |    0 |       |
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
1 row in set (0.00 sec)

mysql> select * from customer where address like 'M_____';
Empty set (0.00 sec)

mysql> select * from customer where city like 'M_____';
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
| customer_id | customer_name | city   | email           | address        | phone_number | pincode | bill | state |
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
| C102        | Ariba         | Mumbra | ariba@gmail.com | Zoha Apartment | 2345678906   | 400612  |    0 |       |
+-------------+---------------+--------+-----------------+----------------+--------------+---------+------+-------+
1 row in set (0.01 sec)

mysql> insert into customer values('C104','Arshiya','diva','arshiya@gmail.com','grace','937261234','10654',10,'mumbai'),('C105','mannan','kalyan','mannan@gmail.com','universe','1234567890','400612',10,'goa');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from customer;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe       | 1234567890   | 400612  |   10 | goa    |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from customer limit 3;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
3 rows in set (0.00 sec)

mysql> select distinct city from customer;
+--------+
| city   |
+--------+
| Thane  |
| Mumbra |
| diva   |
| kalyan |
+--------+
4 rows in set (0.00 sec)

mysql> select city from customer;
+--------+
| city   |
+--------+
| Thane  |
| Mumbra |
| thane  |
| diva   |
| kalyan |
+--------+
5 rows in set (0.00 sec)

mysql> desc product;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| product_id      | varchar(5)    | NO   | PRI | NULL    |       |
| product_name    | varchar(10)   | YES  |     | NULL    |       |
| category        | varchar(15)   | YES  |     | NULL    |       |
| sub_category    | varchar(15)   | YES  |     | NULL    |       |
| oringinal_price | decimal(10,0) | YES  |     | NULL    |       |
| selling_price   | decimal(10,0) | YES  |     | NULL    |       |
| stock           | varchar(10)   | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> select * from customer;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe       | 1234567890   | 400612  |   10 | goa    |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
5 rows in set (0.00 sec)

mysql> insert into customer values('C104','Arshiya','diva','arshiya@gmail.com','grace','937261234','10654',11,'mumbai');
ERROR 1062 (23000): Duplicate entry 'C104' for key 'customer.PRIMARY'
mysql> insert into customer values('C106','Arshiya','diva','arshiya@gmail.com','grace','937261234','10654',11,'mumbai');
Query OK, 1 row affected (0.00 sec)

mysql> select * from customer where bill<10;
+-------------+---------------+--------+------------------+----------------+--------------+---------+------+-------+
| customer_id | customer_name | city   | email            | address        | phone_number | pincode | bill | state |
+-------------+---------------+--------+------------------+----------------+--------------+---------+------+-------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com | Almas          | 7208226998   | 400612  |    0 |       |
| C102        | Ariba         | Mumbra | ariba@gmail.com  | Zoha Apartment | 2345678906   | 400612  |    0 |       |
+-------------+---------------+--------+------------------+----------------+--------------+---------+------+-------+
2 rows in set (0.01 sec)

mysql> select * from customer where bill>10;
+-------------+---------------+------+-------------------+---------+--------------+---------+------+--------+
| customer_id | customer_name | city | email             | address | phone_number | pincode | bill | state  |
+-------------+---------------+------+-------------------+---------+--------------+---------+------+--------+
| C106        | Arshiya       | diva | arshiya@gmail.com | grace   | 937261234    | 10654   |   11 | mumbai |
+-------------+---------------+------+-------------------+---------+--------------+---------+------+--------+
1 row in set (0.00 sec)

mysql> select * from customer where bill<=10;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe       | 1234567890   | 400612  |   10 | goa    |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from customer where customer_name ='Ayesha' and bill= 10;
Empty set (0.00 sec)

mysql> select * from customer where customer_name ='Ayesha' or bill= 10;
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address  | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas    | 7208226998   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace    | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace    | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe | 1234567890   | 400612  |   10 | goa    |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
4 rows in set (0.00 sec)

mysql> Select * from customer where customer_id between 'C101' to 'C104';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to 'C104'' at line 1
mysql> Select * from customer where customer_id between 'C101' and 'C104';
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
4 rows in set (0.00 sec)

mysql> Select * from customer where customer_id not between 'C101' and 'C104';
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address  | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| C105        | mannan        | kalyan | mannan@gmail.com  | universe | 1234567890   | 400612  |   10 | goa    |
| C106        | Arshiya       | diva   | arshiya@gmail.com | grace    | 937261234    | 10654   |   11 | mumbai |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
2 rows in set (0.00 sec)

mysql> select * from customer;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe       | 1234567890   | 400612  |   10 | goa    |
| C106        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   11 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
6 rows in set (0.00 sec)

mysql> select * from customer where customer_id in ('C101','C104','C105');
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address  | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas    | 7208226998   | 400612  |    0 |        |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace    | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe | 1234567890   | 400612  |   10 | goa    |
+-------------+---------------+--------+-------------------+----------+--------------+---------+------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id not in ('C101','C104','C105');
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C106        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   11 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer where email is null;
Empty set (0.00 sec)

mysql> select * from customer where email is not null;
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| customer_id | customer_name | city   | email             | address        | phone_number | pincode | bill | state  |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
| C101        | Ayesha        | Thane  | ayesha@gmail.com  | Almas          | 7208226998   | 400612  |    0 |        |
| C102        | Ariba         | Mumbra | ariba@gmail.com   | Zoha Apartment | 2345678906   | 400612  |    0 |        |
| C103        | Arshiya       | thane  | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C104        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   10 | mumbai |
| C105        | mannan        | kalyan | mannan@gmail.com  | universe       | 1234567890   | 400612  |   10 | goa    |
| C106        | Arshiya       | diva   | arshiya@gmail.com | grace          | 937261234    | 10654   |   11 | mumbai |
+-------------+---------------+--------+-------------------+----------------+--------------+---------+------+--------+
6 rows in set (0.00 sec)

mysql>