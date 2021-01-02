CREATE DATABASE Restaurant_Mgmt
USE Restaurant_Mgmt

CREATE TABLE tbl_Employee(
emp_id varchar(4) not null,
branch_id varchar(5) not null,
emp_name varchar(20) not null,
emp_address varchar(100) not null,
emp_phone varchar(20) not null,
emp_PPS varchar(15) not null,
emp_email varchar(20) not null,
emp_position varchar(20) not null,
emp_monthly_salary int,
emp_permission_level varchar(1) not null,
CONSTRAINT emp_pk PRIMARY KEY(emp_id),
CONSTRAINT emp_fk FOREIGN KEY(branch_id)
REFERENCES tbl_Branch(branch_id)
)
CREATE TABLE tbl_Branch(
branch_id varchar(5) not null,
branch_name varchar(20) not null,
branch_location varchar(50) not null,
branch_phone varchar(10),
CONSTRAINT branch_pk PRIMARY KEY(branch_id)
)
CREATE TABLE tbl_Customer(
customer_id varchar(10) not null,
customer_name varchar(30) not null,
customer_address varchar (30) not null,
customer_city varchar(20) not null,
customer_phone varchar(10),
customer_email varchar(30),
customer_type varchar (20),
CONSTRAINT customer_pk PRIMARY KEY(customer_id),
)
CREATE TABLE tbl_Order(
order_id varchar(10) not null,
branch_id varchar(5) not null,
customer_id varchar(10) not null,
menu_item_id varchar(10) not null,
menu_item_quantity int,
order_date date not null,
order_time time not null,
CONSTRAINT order_pk PRIMARY KEY (order_id),
CONSTRAINT order_fk1 FOREIGN KEY (customer_id)
REFERENCES tbl_Customer(customer_id),
CONSTRAINT order_fk2 FOREIGN KEY(branch_id)
REFERENCES tbl_Branch(branch_id),
CONSTRAINT order_fk3 FOREIGN KEY(menu_item_id)
REFERENCES tbl_MenuItem(menu_item_id),
)
CREATE TABLE tbl_Transaction(
transaction_id varchar(10) not null,
order_id varchar(10) not null,
order_item varchar(30),
order_item_quantity int,
order_discount varchar(3),
total_bill float
CONSTRAINT transaction_pk PRIMARY KEY(transaction_id),
CONSTRAINT transation_fk FOREIGN KEY(order_id)
REFERENCES tbl_Order(order_id)
)
CREATE TABLE tbl_Payment(
payment_id varchar(10) not null,
transaction_id varchar(10) not null,
payment_method varchar(20) not null,
payment_date date not null,
payment_time time not null,
CONSTRAINT payment_pk PRIMARY KEY (payment_id),
CONSTRAINT payment_fk FOREIGN KEY (transaction_id)
REFERENCES tbl_Transaction(transaction_id),
)
CREATE TABLE tbl_MenuItem(
menu_item_id varchar(10) not null,
menu_item_price float not null,
CONSTRAINT menu_item_pk PRIMARY KEY (menu_item_id)
)
CREATE TABLE tbl_Product_Ingredient(
prod_id varchar(10) not null,
supplier_id varchar(10) not null,
menu_item_id varchar(10) not null,
CONSTRAINT product_pk PRIMARY KEY (prod_id),
CONSTRAINT product_fk1 FOREIGN KEY (supplier_id)
REFERENCES tbl_Supplier(supplier_id),
CONSTRAINT product_fk2 FOREIGN KEY(menu_item_id)
REFERENCES tbl_MenuItem(menu_item_id),
)
CREATE TABLE tbl_Supplier(
supplier_id varchar(10) not null,
supplier_type varchar(10) not null,
supplier_name varchar(30) not null,
supplier_address varchar(30) not null,
supplier_city varchar(20) not null,
sales_rep varchar(20),
contact_number varchar(15),
list_products xml
CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
)
INSERT INTO tbl_Branch VALUES(12345, 'Unit 1', '7 Wexford Street, Dublin 2', '017383838')
INSERT INTO tbl_Branch VALUES(11236, 'Unit 2', '10 Church Street, Dublin 7', '017455566')
INSERT INTO tbl_Branch VALUES(44299, 'Unit 3', '52 Northumberland Road, Dublin 4', '016520155')
INSERT INTO tbl_Branch VALUES(33177, 'Unit 5', '25 Kevin Street, Dublin 1', '016930882')
INSERT INTO tbl_Branch VALUES(55679, 'Unit 4', '7 North King Street, Dublin 3', '017230999')
SELECT * FROM tbl_Branch

INSERT INTO tbl_Customer VALUES(8822830481, 'April Samaniego', '10 Valentia Parade, Dublin 7', 'Dublin', '0899455786', 'april@gmail.com', 'student')
INSERT INTO tbl_Customer VALUES(5512231231, 'Edlyn Garcia', '20 Phibsborough Road, Dublin 1', 'Dublin', '0834328976', 'edlyn@gmail.com', 'student')
INSERT INTO tbl_Customer VALUES(1234156001, 'Nupur', '23 George Street, Dublin 2', 'Dublin', '0834567863', 'nupur@gmail.com', 'student')
INSERT INTO tbl_Customer VALUES(2031152567, 'Paarth Vora', '19 Camden Street, Dublin 2', 'Dublin', '0874367824', 'paarth@gmail.com', 'student')
INSERT INTO tbl_Customer VALUES(5521789999, 'Raquel H. Rodriguez', '15 Rathmines Road, Dublin 6', 'Dublin', '0879798933', 'raquel@gmail.com', 'regular')
SELECT * FROM tbl_Customer

INSERT INTO tbl_Employee VALUES(1111, 12345, 'John Smith', '76 Henry Street, Dublin 1', '084837890', 'AA1923483', 'john@gmail.com', 'cashier', 1550, '1')
INSERT INTO tbl_Employee VALUES(9999, 12345, 'Laura Murray', '32 Mary Street, Dublin 1', '0885990342', 'LL1324576', 'laura@gmail.com', 'Supervisor', 1700, '2')
INSERT INTO tbl_Employee VALUES(2222, 12345, 'Samantha Morgan', '15 Thomas Street, Dublin 8', '0862900098', 'SS1234599', 'samantha@gmail.com', 'Manager', 2000, '3')
INSERT INTO tbl_Employee VALUES(5555, 33177, 'Patrick Peterson', '82 Nortumberland Road, Dublin 4', '08679888081', 'PP9988009', 'patrick@gmail.com', 'Manager', 2000, '3')
INSERT INTO tbl_Employee VALUES(6666, 44299, 'Joseph Ramirez', '10 Grafton Street, Dublin 2', '08223443548', 'JJ1055623', 'joseph@gmail.com', 'Manager', 2000, '3')
SELECT * FROM tbl_Employee

INSERT INTO tbl_MenuItem VALUES(2233112378, 10.50, 'Beef burrito', 'Main')
INSERT INTO tbl_MenuItem VALUES(2233112379, 10.00, 'Chicken burrito', 'Main')
INSERT INTO tbl_MenuItem VALUES(2233112380, 8.50, 'Veggie burrito', 'Main')
INSERT INTO tbl_MenuItem VALUES(2233112381, 3.50, 'Nachos', 'Side')
INSERT INTO tbl_MenuItem VALUES(2233112382, 1.90, 'Bottled water', 'Drink')
ALTER TABLE tbl_MenuItem  ALTER COLUMN menu_item_name VARCHAR(30)
ALTER TABLE tbl_MenuItem ADD menu_item_category VARCHAR(20)
SELECT * FROM tbl_MenuItem

INSERT INTO tbl_Order VALUES(10001, 12345, 5521789999, 2233112378, 1, '2020-12-20', '10:00')
INSERT INTO tbl_Order VALUES(10002, 12345, 8822830481, 2233112380, 1, '2020-12-20', '11:10')
INSERT INTO tbl_Order VALUES(10003, 12345, 5512231231, 2233112379, 1, '2020-12-20', '12:05')
INSERT INTO tbl_Order VALUES(10004, 12345, 2031152567, 2233112381, 1, '2020-12-20', '13:30')
INSERT INTO tbl_Order VALUES(10005, 12345, 1234156001, 2233112382, 2, '2020-12-20', '14:20')
SELECT * FROM tbl_Order

INSERT INTO tbl_Payment VALUES(5001, 4001, 'Visa', '2020-12-20', '14:21')
INSERT INTO tbl_Payment VALUES(5002, 4002, 'MasterCard', '2020-12-21', '18:11')
INSERT INTO tbl_Payment VALUES(5003, 4003, 'Visa', '2020-12-22', '16:38')
INSERT INTO tbl_Payment VALUES(5004, 4004, 'AmercianExpress', '2020-12-23', '15:26')
INSERT INTO tbl_Payment VALUES(5005, 4005, 'Visa', '2020-12-19', '19:45')
SELECT * FROM tbl_Payment


ALTER TABLE tbl_Transaction DROP COLUMN order_item 
ALTER TABLE tbl_Transaction DROP COLUMN order_item_quantity
ALTER TABLE tbl_Transaction DROP COLUMN order_discount

INSERT INTO tbl_Transaction VALUES (4001, 10001, 10.50)
INSERT INTO tbl_Transaction VALUES (4002, 10002, 8.50)
INSERT INTO tbl_Transaction VALUES (4003, 10003, 10.00)
INSERT INTO tbl_Transaction VALUES (4004, 10004, 3.50)
INSERT INTO tbl_Transaction VALUES (4005, 10005, 1.90)
SELECT * FROM tbl_Transaction

INSERT INTO tbl_Product_Ingredient VALUES (6001, 7001, 2233112378)
INSERT INTO tbl_Product_Ingredient VALUES (6002, 7001, 2233112381)
INSERT INTO tbl_Product_Ingredient VALUES (6003, 7003, 2233112382)
INSERT INTO tbl_Product_Ingredient VALUES (6004, 7002, 2233112379)
SELECT * FROM tbl_Product_Ingredient

SELECT * FROM tbl_Branch
SELECT * FROM tbl_Employee

SELECT eb.*, ec.branch_name
FROM tbl_Employee as eb
Left Join tbl_Branch ec on eb.branch_id=eb.branch_id
WHERE ec.branch_name='Unit 1'

CREATE TRIGGER [dbo].[new_Employee] ON [dbo].[tbl_Employee]
	AFTER INSERT
AS
BEGIN
	DECLARE @emp_id VARCHAR(4);
	DECLARE @branch_id VARCHAR(5);
	DECLARE @emp_name VARCHAR(20);
	DECLARE @emp_address VARCHAR(100);
	DECLARE @emp_phone VARCHAR(20);
	DECLARE @emp_PPS VARCHAR(15);
	DECLARE @emp_email VARCHAR(20);
	DECLARE @emp_position VARCHAR(20);
	DECLARE @emp_monthly_salary INT;
	DECLARE @emp_permission_level VARCHAR(1);

	SELECT @emp_id=empList.emp_id FROM inserted empList
	SELECT @branch_id=empList.branch_id FROM inserted empList
	SELECT @emp_name=empList.emp_name FROM inserted empList
	SELECT @emp_address=empList.emp_address FROM inserted empList
	SELECT @emp_phone=empList.emp_phone FROM inserted empList
	SELECT @emp_PPS=empList.emp_PPS FROM inserted empList
	SELECT @emp_email=empList.emp_email FROM inserted empList
	SELECT @emp_position=empList.emp_position FROM inserted empList
	SELECT @emp_monthly_salary=empList.emp_monthly_salary FROM inserted empList
	SELECT @emp_permission_level=empList.emp_permission_level FROM inserted empList

	INSERT INTO tbl_Employee(emp_id, branch_id, emp_name, emp_address, emp_phone, emp_PPS, emp_email, emp_position, emp_monthly_salary, emp_permission_level)
	VALUES(@emp_id, @branch_id, @emp_name, @emp_address, @emp_phone, @emp_PPS, @emp_email, @emp_position, @emp_monthly_salary, @emp_permission_level)
END


CREATE TABLE tbl_Record
(
emp_id varchar(4) not null,
status varchar(30)
)

SELECT * FROM tbl_Record

CREATE TRIGGER Delete_Emp ON tbl_Employee
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE @emp_id varchar(4)
SELECT @emp_id =DELETED.emp_id
FROM DELETED

INSERT INTO tbl_Record
VALUES (@emp_id, 'DELETED')
END

DELETE FROM tbl_Employee WHERE emp_id= '1111'

SELECT * FROM tbl_Employee
SELECT * FROM tbl_Record

BEGIN TRANSACTION
INSERT  INTO dbo.tbl_Employee(emp_id, branch_id, emp_name, emp_address, emp_phone, emp_PPS, emp_email, emp_position, emp_monthly_salary, emp_permission_level)
        SELECT  2121, '12345', 'Mark Robins', 'North Circular Road, D7', '0877655466', 'MR2233242', 'mark@gmail.com', 'Cashier', 1550, '1'
        UNION ALL
        SELECT  '3333', '12345', 'Julia Rodriguez', 'South Circular Road, D8', '0897655411', 'JR2233240', 'julia@gmail.com', 'Cashier', 1550, '1'
SELECT  *
FROM    dbo.tbl_Employee

ROLLBACK TRANSACTION
