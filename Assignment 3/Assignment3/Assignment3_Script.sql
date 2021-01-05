--Assignment3_Script.sql
--Name: Marissa Gonçalves
--Due Date: November 28, 2018


CONNECT hr/hr
SET LINESIZE 180
SET PAGESIZE 75
SET ECHO ON



START "D:\Marissa\hr_schema\hr_schema\hr_Script.sql"
START "D:\Marissa\Bank_db.sql"


SPOOL "D:\Semester III\Database I\Assignments\Assignment3\Assignment3_Spool.txt"


--Part I:


--Question 1:

SELECT *
FROM TRANSACTION
WHERE CUSTID = '5555666';





--Question 2:

SELECT *
FROM TRANSACTION
WHERE LOCID = 'BR007';





--Question 3:

SELECT *
FROM TRANSACTION
WHERE TXNDATE >= TO_DATE('09-10-09', 'YY-MM-DD') AND TXNDATE <= TO_DATE('09-10-16', 'YY-MM-DD');





--Question 4:

SELECT *
FROM TRANSACTION
WHERE CUSTID = '1234321' AND ACCOUNTID = '007-2312'
ORDER BY TXNDATE DESC;





--Question 5:

SELECT ACCOUNTID
FROM TRANSACTION
WHERE AMTWITH <> 0
GROUP BY ACCOUNTID;





--Question 6:

SELECT TXNID, (TXNDATE + 5) AS "TRANSACTION DATE"
FROM TRANSACTION
WHERE CHARGE = 2.5;










--Part II:



--Question 1:

SELECT TXNID
FROM TRANSACTION
WHERE AMTDEP <> 0;





--Question 2:


SELECT TXNID
FROM TRANSACTION
WHERE AMTDEP = 0;





--Question 3:

SELECT MAX(AMTWITH) AS "MAXIMUM WITHDRAWAL", MAX(AMTDEP) AS "MAXIMUM DEPOSIT"
FROM TRANSACTION
WHERE LOCID = 'BR007';





--Question 4:

SELECT AVG(AMTWITH) AS "AVERAGE WITHDRAWAL"
FROM TRANSACTION;





--Question 5:

SELECT COUNT(*) AS "TRANSACTIONS ON OCTOBER 1ST"
FROM TRANSACTION
WHERE TXNDATE = TO_DATE('09-10-01', 'YY-MM-DD');




--Question 6:

SELECT COUNT(*) AS "NON-BRANCH TRANSACTIONS"
FROM TRANSACTION
WHERE LOCID NOT LIKE 'BR%';





--Question 7:

SELECT ACCOUNTID, (AMTDEP - AMTWITH) AS "ACCOUNT BALANCE WITHOUT CHARGE"
FROM TRANSACTION;










--Part III:



--Question 1:

SELECT ACCOUNTID, (AMTDEP - AMTWITH - NVL(CHARGE, 0)) AS "ACCOUNT BALANCE WITH CHARGE"
FROM TRANSACTION;




--Question 2:

SELECT ACCOUNTID, ADD_MONTHS(TXNDATE, 1) AS "NOVEMBER TRANSACTIONS", AMTDEP, AMTWITH, CHARGE
FROM TRANSACTION
WHERE CUSTID = '5555666';




--Question 3:

SELECT SUM(AMTDEP - AMTWITH - NVL(CHARGE,0)) AS "TOTAL TRANSACTION CHANGE"
FROM TRANSACTION
WHERE ACCOUNTID = '007-2312';










--Part IV:



--Question 1:


--Sub-Query:

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
					   FROM DEPARTMENTS
					   WHERE DEPARTMENT_NAME = 'Accounting')
ORDER BY LAST_NAME;




--Explicit Join:

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES INNER JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE DEPARTMENT_NAME = 'Accounting'
ORDER BY LAST_NAME;










--Question 2: 


--Sub-Query:

SELECT FIRST_NAME, LAST_NAME, TRUNC(((SYSDATE - HIRE_DATE) / 365.25), 0) AS "SENIORITY"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
					   FROM DEPARTMENTS
					   WHERE DEPARTMENT_NAME = 'Accounting')
ORDER BY LAST_NAME;




--Implicit Join:

SELECT E.FIRST_NAME, E.LAST_NAME, TRUNC(((SYSDATE - HIRE_DATE) / 365.25), 0) AS "SENIORITY"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND DEPARTMENT_NAME = 'Accounting'
ORDER BY LAST_NAME;









--Question 3:


--Implicit Join:

SELECT D.DEPARTMENT_NAME, COUNT(*) AS "EMPLOYEES NUMBER"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;



--Explicit Join:

SELECT DEPARTMENT_NAME, COUNT(*) AS "EMPLOYEES NUMBER"
FROM EMPLOYEES 
INNER JOIN DEPARTMENTS 
USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;








--Question 4:


--Implicit Join:

SELECT DEPARTMENT_NAME
FROM (SELECT D.DEPARTMENT_NAME
      FROM EMPLOYEES E, DEPARTMENTS D
	  WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
	  ORDER BY E.SALARY DESC)
WHERE ROWNUM = 1;               



--Explicit Join:

SELECT DEPARTMENT_NAME
FROM (SELECT DEPARTMENT_NAME
      FROM EMPLOYEES 
	  INNER JOIN DEPARTMENTS 
	  USING(DEPARTMENT_ID)
	  ORDER BY SALARY DESC)
WHERE ROWNUM = 1;               


				


				
					   
					   

--Question 5:


--Sub-Query:

SELECT FIRST_NAME, LAST_NAME
FROM (SELECT FIRST_NAME, LAST_NAME
	  FROM EMPLOYEES
	  WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
							 FROM DEPARTMENTS
							 WHERE DEPARTMENT_NAME = 'Finance')
	  ORDER BY SALARY ASC)
WHERE ROWNUM = 1;




--Explicit Join:

SELECT FIRST_NAME, LAST_NAME
FROM (SELECT FIRST_NAME, LAST_NAME
	  FROM EMPLOYEES 
	  INNER JOIN DEPARTMENTS
	  USING (DEPARTMENT_ID)
      WHERE DEPARTMENT_NAME = 'Finance'
	  ORDER BY SALARY ASC)
WHERE ROWNUM = 1;



 

 
 
--Question 6:


--Sub-Query

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE MANAGER_ID = (SELECT MANAGER_ID
					FROM EMPLOYEES
					WHERE LAST_NAME = 'Himuro');


					

--Implicit Join:

SELECT E.FIRST_NAME, E.LAST_NAME
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.MANAGER_ID AND M.LAST_NAME = 'Himuro';







SPOOL OFF;