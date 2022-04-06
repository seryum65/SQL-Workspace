/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer, COUNT(Name)
FROM tracks
WHERE Composer is NOT NULL
GROUP BY Composer

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

--SELECT BillingCountry, Total FROM invoices
SELECT BillingCountry, ROUND(avg(Total),2)
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
GROUP by BillingCountry

