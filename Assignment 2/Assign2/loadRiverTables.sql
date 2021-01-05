--loadRiverTables.sql
--Name: Marissa Gonçalves
--Due Date: November 16, 2018


--Part 3: Populate the Tables and Show Contents

--a)

/*****   CUSTOMER DATA   *****************************************************/

INSERT INTO CUSTOMER VALUES(
	1,'Stanley', 'Elizabeth','555-236-7789', 'ES@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	2,'Price', 'Fred', '555-236-0091', 'FP@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	3,'Becky', 'Linda', '555-236-0392', 'LB@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	4,'Birch', 'Pamela', '555-236-4493', 'PB@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	5,'Romez', 'Ricardo', '555-236-3334', 'RR@somewhere.com');
INSERT INTO CUSTOMER VALUES(
	6,'Jackson', 'Samantha', '555-236-1095', 'SJ@somewhere.com');



/*****   ITEM DATA   ************************************************************/

INSERT INTO ITEM VALUES(1,'Gold Bracelet',   120.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(2,'Gold Necklace',   100.00, 'Baker');
INSERT INTO ITEM VALUES(3,'Bead Earrings',    50.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(4,'Gold Bracelet',   180.00, 'Baker');
INSERT INTO ITEM VALUES(5,'Silver Necklace',  35.00, 'Baxter');
INSERT INTO ITEM VALUES(6,'Bead Earrings',    25.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(7,'Bead Earrings',    22.50, 'Mary Josephson');
INSERT INTO ITEM VALUES(8,'Gold Earrings',    50.00, 'John Lintz');
INSERT INTO ITEM VALUES(9,'Gold Necklace',   160.00, 'John Lintz');
INSERT INTO ITEM VALUES(10,'Bead Earrings',   12.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(11,'Bead Earrings',   35.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(12,'Bead Earrings',    4.00, 'Mary Josephson');
INSERT INTO ITEM VALUES(13,'Gold Necklace',  225.00, 'John Lintz');
INSERT INTO ITEM VALUES(14,'Silver Earrings', 55.00, 'John Lintz');
INSERT INTO ITEM VALUES(15,'Gold Bracelet',  200.00, 'John Lintz');



/*****   PURCHASE   *************************************************************/

INSERT INTO PURCHASE VALUES(1, to_date('05-05-15', 'DD-MM-YY'),  1);
INSERT INTO PURCHASE VALUES(2, to_date('07-05-15', 'DD-MM-YY'),  2);
INSERT INTO PURCHASE VALUES(3, to_date('11-05-15', 'DD-MM-YY'),  3);
INSERT INTO PURCHASE VALUES(4, to_date('15-05-15', 'DD-MM-YY'),  4);
INSERT INTO PURCHASE VALUES(5, to_date('15-05-15', 'DD-MM-YY'),  5);
INSERT INTO PURCHASE VALUES(6, to_date('16-05-15', 'DD-MM-YY'),  1);
INSERT INTO PURCHASE VALUES(7, to_date('16-05-15', 'DD-MM-YY'),  3);
INSERT INTO PURCHASE VALUES(8, to_date('18-05-15', 'DD-MM-YY'),  1);
INSERT INTO PURCHASE VALUES(9, to_date('19-05-15', 'DD-MM-YY'),  6);



/*****   PURCHASE_ITEM DATA   ***************************************************/

INSERT INTO PURCHASE_ITEM VALUES(1,  1, 1, 155.00);
INSERT INTO PURCHASE_ITEM VALUES(2,  2, 2, 120.00);
INSERT INTO PURCHASE_ITEM VALUES(3,  3, 1,  75.00);
INSERT INTO PURCHASE_ITEM VALUES(4,  6, 2,  40.00);
INSERT INTO PURCHASE_ITEM VALUES(4,  7, 1,  32.00);
INSERT INTO PURCHASE_ITEM VALUES(5,  4, 3, 250.00);
INSERT INTO PURCHASE_ITEM VALUES(5,  8, 1,  90.00);
INSERT INTO PURCHASE_ITEM VALUES(6, 10, 1,  36.00);
INSERT INTO PURCHASE_ITEM VALUES(7, 11, 1,  45.00);
INSERT INTO PURCHASE_ITEM VALUES(8,  5, 1,  50.00);
INSERT INTO PURCHASE_ITEM VALUES(8, 10, 4,  24.00);
INSERT INTO PURCHASE_ITEM VALUES(8, 12, 1,   8.00);
INSERT INTO PURCHASE_ITEM VALUES(9, 14, 2,  72.00);


/****************************************************************************************/

