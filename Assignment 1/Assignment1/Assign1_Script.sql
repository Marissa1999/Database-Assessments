--Assign1_Script.sql (Pizza-Plus Restaurant Database)
--Name: Marissa Gonçalves
--Due Date: October 2, 2018


CONNECT SYSTEM/Marissa;
SET LINESIZE 180;
SET PAGESIZE 80;
SET ECHO ON;


--Part B: Pizza-Plus Database Implementation



SPOOL "D:\Semester III\Database I\Assignments\Assignment1\Assign1_Spool.txt";




-- Question 1:

CREATE TABLE customers
(CustomerId CHAR(12),
FirstName VARCHAR2(15) CONSTRAINT customers_firstname_nn NOT NULL,
LastName VARCHAR2(15) CONSTRAINT customers_lastname_nn NOT NULL,
PhoneNumber CHAR(18) CONSTRAINT customers_phonenumber_uk UNIQUE,
Address VARCHAR2(40) CONSTRAINT customers_address_uk UNIQUE,
City VARCHAR2(15),
Province CHAR(10),
PostalCode CHAR(14) CONSTRAINT customers_postalcode_uk UNIQUE,
LoyaltyRating NUMBER(16) DEFAULT 1,
CONSTRAINT customers_loyaltyrating_check CHECK (LoyaltyRating >= 1 AND LoyaltyRating <= 5),
CONSTRAINT customers_customerid_pk PRIMARY KEY (CustomerId));




CREATE TABLE orders
(OrderId CHAR(12),
CustomerId CHAR(12) CONSTRAINT orders_customerid_nnuk NOT NULL UNIQUE,
OrderDate DATE CONSTRAINT orders_orderdate_nn NOT NULL,
OrderTime CHAR(14) CONSTRAINT orders_ordertime_nn NOT NULL,
SmallPizzas NUMBER(30) CONSTRAINT orders_smallpizzas_nn NOT NULL,
MediumPizzas NUMBER(30) CONSTRAINT orders_mediumpizzas_nn NOT NULL,
LargePizzas NUMBER(30) CONSTRAINT orders_largepizzas_nn NOT NULL,
ExtraLargePizzas NUMBER(30) CONSTRAINT orders_extralargepizzas_nn NOT NULL,
CONSTRAINT orders_orderid_pk PRIMARY KEY (OrderId),
CONSTRAINT orders_customerid_fk FOREIGN KEY (CustomerId) REFERENCES customers(CustomerId));




--Question 2:

DESCRIBE customers;

DESCRIBE orders;






--Question 3:

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02345', 'Mary', 'Fair', '(519) 477-3912', '2395 Baker Street', 'Owen Sound', 'ON', 'N0N 0N0');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02346', 'Nellie', 'Weldon', '(647) 281-3119', '1453 Front Street', 'Toronto', 'ON', 'M5J 2N1');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02347', 'Joseph', 'Rudisill', '(709) 621-4593', '4394 Glencoe Drive', 'Change Islands', 'NL', 'A1C 5H6');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02348', 'Gina', 'Watkins', '(306) 275-8785', '3907 Main St.', 'St. Brieux', 'SK', 'S0K 3V0');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02349', 'Nancy', 'Munroe', '(819) 734-5032', '2612 Rue des Églises Est.', 'Barraute', 'QC', 'J0Y 1A0');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02350', 'Bernard', 'Conroy', '(613) 628-3734', '321 Reserve St.', 'Eganville', 'ON', 'K0J 1T0');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02351', 'Theodore', 'Delgado', '(905) 405-8225', '2186 Derry Rd.', 'Malton', 'ON', 'L4T 1A8');

INSERT INTO customers (CustomerId, FirstName, LastName, PhoneNumber, Address, City, Province, PostalCode) 
VALUES ('02352', 'Michael', 'Burnett', '(416) 547-8779', '567 Eglinton Avenue', 'Toronto', 'ON', 'M4P 1A6');



INSERT INTO orders VALUES ('00137', '02345', TO_DATE ('05/10/2018', 'MM/DD/YYYY'), '12:25:39 PM', 3, 0, 1, 0);
INSERT INTO orders VALUES ('00138', '02346', TO_DATE ('06/13/2018', 'MM/DD/YYYY'), '01:10:23 PM', 2, 2, 0, 0);
INSERT INTO orders VALUES ('00139', '02347', TO_DATE ('06/29/2018', 'MM/DD/YYYY'), '01:03:46 PM', 1, 3, 0, 1);
INSERT INTO orders VALUES ('00140', '02348', TO_DATE ('07/05/2018', 'MM/DD/YYYY'), '05:16:57 PM', 2, 2, 0, 2);
INSERT INTO orders VALUES ('00141', '02349', TO_DATE ('07/19/2018', 'MM/DD/YYYY'), '11:48:02 AM', 1, 0, 0, 0);
INSERT INTO orders VALUES ('00142', '02350', TO_DATE ('07/30/2018', 'MM/DD/YYYY'), '11:32:13 AM', 0, 1, 0, 2);
INSERT INTO orders VALUES ('00143', '02351', TO_DATE ('08/07/2018', 'MM/DD/YYYY'), '01:50:59 PM', 3, 1, 1, 1);
INSERT INTO orders VALUES ('00144', '02352', TO_DATE ('08/24/2018', 'MM/DD/YYYY'), '06:27:22 PM', 2, 3, 0, 1);





--Question 4:

SELECT CustomerId as "Customer ID", FirstName as "First Name", LastName as "Last Name", PhoneNumber as "Phone Number", 
       Address as "Address", City as "City", Province as "Province", PostalCode as "Postal Code", LoyaltyRating as "Loyalty Rating"
FROM customers;


SELECT OrderId as "Order ID", CustomerId as "Customer ID", OrderDate as "Date", OrderTime as "Time", 
       SmallPizzas as "# of Small Pizzas", MediumPizzas as "# of Medium Pizzas",
	   LargePizzas as "# of Large Pizzas", ExtraLargePizzas as "# of Extra Large Pizzas"
FROM orders;





--Question 5:

SELECT table_name, constraint_name, constraint_type 
FROM user_constraints
WHERE table_name = 'CUSTOMERS';


SELECT table_name, constraint_name, constraint_type 
FROM user_constraints
WHERE table_name = 'ORDERS';





SPOOL OFF;