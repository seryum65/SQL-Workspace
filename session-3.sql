-- SQLite
SELECT count(*) as toplam 
from invoices;
---------------------------------------------
SELECT count(DISTINCT Composer) as num_comp 
from tracks; 
----------------------------------------------
SELECT BillingState from invoices 

SELECT COUNT(*)
FROM invoices
WHERE BillingState ISNULL;

----------------------------------------------
SELECT Name, min(Milliseconds)/1000.0 as time_track
FROM tracks

----------------------------------------------
SELECT MIN(Grade), MAX(Grade)
FROM students

----------------------------------------------
SELECT ROUND(SUM(Total)) as total_amount
FROM invoices

----------------------------------------------

SELECT ROUND(avg(Total),2) as total_amount
FROM invoices

----------------------------------------------

SELECT AVG(Milliseconds) as avg_duration
FROM tracks;

----------------------------------------------
SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > 393599.212103911

----------------------------------------------
SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM tracks) ;

----------------------------------------------

