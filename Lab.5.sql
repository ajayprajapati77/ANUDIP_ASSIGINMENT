Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database joints;
Query OK, 1 row affected (0.06 sec)

mysql> use joints;
Database changed


mysql> create table department( dept_id int primary key not null, dept_name varchar(30) not null);
Query OK, 0 rows affected (0.13 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.06 sec)

mysql> insert into department values ( 1, 'HR' ) , (2, 'IT'), (3, 'FINANCE'), (4, 'MARKETING');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.01 sec)

mysql> create table employe(emp_id int primary key not null, emp_name varchar (20) not null, dept_id int, foreign key (dept_id) references department(dept_id));
Query OK, 0 rows affected (0.12 sec)


mysql> desc employe;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | NO   | PRI | NULL    |       |
| emp_name | varchar(20) | NO   |     | NULL    |       |
| dept_id  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into employe values(1, 'amit', 1), (2, 'ajay', 2), (3, 'Ayush', 1),(4, 'ankit', null),(5,'anddy', 4);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from employe;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
|      1 | amit     |       1 |
|      2 | ajay     |       2 |
|      3 | Ayush    |       1 |
|      4 | ankit    |    NULL |
|      5 | anddy    |       4 |
+--------+----------+---------+
5 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | FINANCE   |
|       4 | MARKETING |
+---------+-----------+
4 rows in set (0.01 sec)


mysql> select emp_name, dept_name from employe inner join department on employe.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | HR        |
| Ayush    | HR        |
| ajay     | IT        |
| anddy    | MARKETING |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name, dept_name from employe left join department on employe.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | HR        |
| ajay     | IT        |
| Ayush    | HR        |
| ankit    | NULL      |
| anddy    | MARKETING |
+----------+-----------+
5 rows in set (0.07 sec)

mysql> select emp_name, dept_name from employe right join department on employe.dept_id=department.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | HR        |
| Ayush    | HR        |
| ajay     | IT        |
| NULL     | FINANCE   |
| anddy    | MARKETING |
+----------+-----------+
5 rows in set (0.01 sec)

mysql> select emp_name, dept_name from employe full join department;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | MARKETING |
| amit     | FINANCE   |
| amit     | IT        |
| amit     | HR        |
| ajay     | MARKETING |
| ajay     | FINANCE   |
| ajay     | IT        |
| ajay     | HR        |
| Ayush    | MARKETING |
| Ayush    | FINANCE   |
| Ayush    | IT        |
| Ayush    | HR        |
| ankit    | MARKETING |
| ankit    | FINANCE   |
| ankit    | IT        |
| ankit    | HR        |
| anddy    | MARKETING |
| anddy    | FINANCE   |
| anddy    | IT        |
| anddy    | HR        |
+----------+-----------+
20 rows in set, 1 warning (0.02 sec)

mysql> select emp_name, dept_name from employe cross join department;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| amit     | MARKETING |
| amit     | FINANCE   |
| amit     | IT        |
| amit     | HR        |
| ajay     | MARKETING |
| ajay     | FINANCE   |
| ajay     | IT        |
| ajay     | HR        |
| Ayush    | MARKETING |
| Ayush    | FINANCE   |
| Ayush    | IT        |
| Ayush    | HR        |
| ankit    | MARKETING |
| ankit    | FINANCE   |
| ankit    | IT        |
| ankit    | HR        |
| anddy    | MARKETING |
| anddy    | FINANCE   |
| anddy    | IT        |
| anddy    | HR        |
+----------+-----------+
20 rows in set (0.00 sec)



mysql> use store_procedure_example;
Database changed
mysql> create table employee(id int primary key not null, name varchar(20) not null,dept varchar(20) not null, salary int not null); 
Query OK, 0 rows affected (0.046 sec)

mysql> insert into employee value (1,'Mannan','HR',10000);
Query OK, 1 row affected (0.010 sec)

mysql> select * from employee;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Mannan | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.001 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployees()
    -> BEGIN
    ->     SELECT * FROM Employee;
    -> END //
Query OK, 0 rows affected (0.012 sec)

mysql> 
mysql> DELIMITER ;
mysql> call GetEmployees();
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Mannan | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.007 sec)

Query OK, 0 rows affected (0.008 sec)

mysql> call GetEmployees;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Mannan | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.001 sec)

Query OK, 0 rows affected (0.001 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employees
    ->     WHERE department = dept_name;
    -> END //
Query OK, 0 rows affected (0.008 sec)


mysql> DELIMITER //
mysql> mysql> 
    -> mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    ->     -> BEGIN
    ->     ->     SELECT * 
    ->     ->     FROM Employees
    ->     ->     WHERE department = dept_name;
    ->     -> END //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    ' at line 1
mysql> Query OK, 0 rows affected (0.008 sec)
    -> 
    -> mysql> 
    -> ;
    -> ;;
    -> 
    ->     -> END //                                                                                                                ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 0 rows affected (0.008 sec)

mysql> 
;
;;

    -> END' at line 1
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employee
    ->     WHERE department = dept_name;
    -> END //

t
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employee
    ->     WHERE department = dept_name;
    -> END //
ERROR 1304 (42000): PROCEDURE GetEmployeeByDept already exists
mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept1(IN dept_name VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employee
    ->     WHERE department = dept_name;
    -> END //
Query OK, 0 rows affected (0.005 sec)

mysql> 
mysql> DELIMITER ;
mysql> call GetEmployeeByDept1('IT');
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> ;
ERROR: 
No query specified

mysql> DELIMITER //
mysql> CREATE PROCEDURE GetEmployeeByDept3(IN dept VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employee
    ->     WHERE dept = name;
    -> END //
Query OK, 0 rows affected (0.006 sec)

mysql> 
mysql> DELIMITER ;
mysql> call GetEmployeeByDept3('IT');
Empty set (0.003 sec)

Query OK, 0 rows affected (0.003 sec)

mysql> call GetEmployeeByDept3('HR');
Empty set (0.001 sec)

Query OK, 0 rows affected (0.001 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeByDept4(IN name VARCHAR(50))
    -> BEGIN
    ->     SELECT * 
    ->     FROM Employee
    ->     WHERE dept = name;
    -> END //
Query OK, 0 rows affected (0.008 sec)

mysql> 
mysql> DELIMITER ;
mysql> call GetEmployeeByDept4('HR');
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Mannan | HR   |  10000 |
+----+--------+------+--------+
1 row in set (0.003 sec)

Query OK, 0 rows affected (0.003 sec)

mysql> call GetEmployeeByDept4('IT');
Empty set (0.001 sec)

Query OK, 0 rows affected (0.001 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE AddEmployee(
    ->     IN  id INT,
    ->     IN name VARCHAR(50),
    ->     IN dept VARCHAR(50),
    ->     IN salary INT
    -> )
    -> BEGIN
    ->     INSERT INTO Employee(id, name, dept, salary)
    ->     VALUES(id, name, dept, salary);
    -> END //
Query OK, 0 rows affected (0.005 sec)

mysql> 
mysql> DELIMITER ;
mysql> call AddEmployee(2,'Khan','IT',12000);
Query OK, 1 row affected (0.005 sec)

mysql> select * from employee;
+----+--------+------+--------+
| id | name   | dept | salary |
+----+--------+------+--------+
|  1 | Mannan | HR   |  10000 |
|  2 | Khan   | IT   |  12000 |
+----+--------+------+--------+
2 rows in set (0.001 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetEmployeeCount(OUT total INT)
    -> BEGIN
    ->     SELECT COUNT(*) INTO total
    ->     FROM Employee;
    -> END //
Query OK, 0 rows affected (0.004 sec)

mysql> 
mysql> DELIMITER ;
mysql> 
mysql> CALL GetEmployeeCount(@total);
Query OK, 1 row affected (0.006 sec)

mysql> SELECT @total;
+--------+
| @total |
+--------+
|      2 |
+--------+
1 row in set (0.000 sec)

mysql> 
mysql>