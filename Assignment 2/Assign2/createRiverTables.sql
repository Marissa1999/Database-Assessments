--createRiverTables.sql
--Name: Marissa Gonçalves
--Due Date: November 16, 2018


--Part 2: Build the Tables


CREATE TABLE CUSTOMER
(CustomerID NUMBER(10),
LastName VARCHAR(20) NOT NULL,
FirstName VARCHAR2(20) NOT NULL,
Phone  VARCHAR2(12) DEFAULT NULL,
Email VARCHAR2(20) DEFAULT NULL,
CONSTRAINT CUSTOMER_CustomerID_PK PRIMARY KEY(CustomerID));



CREATE TABLE ITEM
(ItemID NUMBER(6),
Description VARCHAR2(50) NOT NULL,
Cost NUMERIC(9,2) NOT NULL,
ArtistName VARCHAR2(40) NULL,
CONSTRAINT ITEM_ItemID_PK PRIMARY KEY(ItemID));



CREATE TABLE PURCHASE
(InvoiceNumber NUMBER(10),
InvoiceDate DATE DEFAULT SYSDATE,
CustomerID NUMBER(10) NOT NULL,
CONSTRAINT PURCHASE_InvoiceNumber_PK PRIMARY KEY(InvoiceNumber),
CONSTRAINT PURCHASE_CustomerID_FK FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID));



CREATE TABLE PURCHASE_ITEM
(InvoiceNumber NUMBER(10),
ItemID NUMBER(6),
ItemQuantity NUMBER(10),
ItemRetailPrice NUMERIC(9,2) NOT NULL,
CONSTRAINT PURCHASE_ITEM_PK PRIMARY KEY(InvoiceNumber, ItemID),
CONSTRAINT PURCHASE_ITEM_InvoiceNumber_FK FOREIGN KEY(InvoiceNumber) REFERENCES PURCHASE(InvoiceNumber),
CONSTRAINT PURCHASE_ITEM_ItemID_FK FOREIGN KEY(ItemID) REFERENCES ITEM(ItemID));
