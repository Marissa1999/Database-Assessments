--queryRiverTables.sql (James River Database)
--Name: Marissa Gonçalves
--Due Date: November 16, 2018


CONNECT scott/tiger;
SET LINESIZE 180;
SET PAGESIZE 60;
SET ECHO ON;



SPOOL "D:\Semester III\Database I\Assignments\Assign2\Assign2_Spool.txt";


START "D:\Semester III\Database I\Assignments\Assign2\dropRiverTables.sql";
START "D:\Semester III\Database I\Assignments\Assign2\createRiverTables.sql";
START "D:\Semester III\Database I\Assignments\Assign2\loadRiverTables.sql";
START "D:\Semester III\Database I\Assignments\Assign2\showRiverTables.sql";



--Part 4: Query Questions



--Question 1:

SELECT SUM(ItemQuantity) AS "Total Items Sold"
FROM PURCHASE_ITEM;




--Question 2:

SELECT SUM(ItemQuantity * ItemRetailPrice) AS "Total Sales Amount"
FROM PURCHASE_ITEM;




--Question 3:

SELECT InvoiceNumber, SUM(ItemQuantity) AS "Items Number per Invoice"
FROM PURCHASE_ITEM
GROUP BY InvoiceNumber
ORDER BY InvoiceNumber;





--Question 4:

SELECT InvoiceNumber, SUM(ItemQuantity * ItemRetailPrice) AS "Sales Amount per Invoice"
FROM PURCHASE_ITEM
GROUP BY InvoiceNumber
ORDER BY InvoiceNumber;






--Question 5:

SELECT InvoiceNumber, SUM(ItemQuantity * ItemRetailPrice) AS "Sales Amount from Highest"
FROM PURCHASE_ITEM
GROUP BY InvoiceNumber
ORDER BY SUM(ItemQuantity * ItemRetailPrice) DESC;






--Question 6:

COLUMN CostAmount FORMAT 999.99 HEADING "Average Invoice Amount";

SELECT AVG(ItemQuantity * ItemRetailPrice) CostAmount
FROM PURCHASE_ITEM;





--Question 7:

COLUMN SalesAmount FORMAT $999.99 HEADING "Total With Tax";

SELECT InvoiceNumber, SUM(ItemQuantity * ItemRetailPrice) AS "Sales Amount per Invoice",  (SUM(ItemQuantity * ItemRetailPrice) * 1.15) SalesAmount
FROM PURCHASE_ITEM
GROUP BY InvoiceNumber
ORDER BY InvoiceNumber;





--Question 8:

COLUMN CostFormat FORMAT $999.99 HEADING "COST";

SELECT ItemID, Description, Cost CostFormat, ArtistName
FROM ITEM
WHERE Cost > 100;





--Question 9:

COLUMN CostFormat FORMAT $999.99 HEADING "COST";

SELECT ItemID, Description, Cost CostFormat, ArtistName
FROM ITEM
WHERE Cost = 160 AND ArtistName LIKE 'Jo%';






--Question 10:

SELECT InvoiceNumber, COUNT(ItemID) AS "NUMBER OF DIF. ITEMS"
FROM PURCHASE_ITEM
HAVING COUNT(*) > 1
GROUP BY InvoiceNumber
ORDER BY InvoiceNumber;





SPOOL OFF;
