/*===================================================
 JOINS
====================================================*/
    
-- Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
-- olusturmak icin kullanilabilir.
--     
-- JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
-- Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
-- icin JOIN islemleri kullanilabilir.

-- Standart SQL'de en çok kullanılan Join islemleri:
-- 1) FULL JOIN:  Tablodaki tum sonuclari gosterir
-- 2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
-- 3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
-- 4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--	NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
/*===================================================*/   

/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT 
	markalar.marka_id,
	markalar.marka_adi,
	siparisler.siparis_adedi,
	siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler
	on markalar.marka_id=siparisler.marka_id;


SELECT 
	markalar.marka_id,
	markalar.marka_adi,
	siparisler.siparis_adedi,
	siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler
	on markalar.marka_id=siparisler.marka_id
WHERE siparis_adedi >= 300;


SELECT 
	markalar.marka_id,
	markalar.marka_adi,
	siparisler.siparis_adedi,
	siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler
	on markalar.marka_id=siparisler.marka_id
WHERE siparis_tarihi BETWEEN '2021-01-01' and '2021-12-31'
LIMIT 1;

/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/

SELECT 
	m.marka_id,
	m.marka_adi,
	s.siparis_adedi,
	s.siparis_tarihi
FROM markalar m  -- kısaltma yaptık
LEFT JOIN siparisler s -- kısaltma yaptık
	on m.marka_id=s.marka_id;



/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/
	
select * from tracks;

SELECT t.GenreId, t.name,  g.name
FROM tracks t
JOIN genres g
on t.GenreId = g.GenreId;


/* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),soyadını (lastName), 
fatura tarihini (InvoiceDate) ve fatura meblağını (total) listeleyen sorguyu yazınız */

SELECT c.FirstName, c.LastName, sum(i.total)
FROM invoices i
JOIN customers c
on i.CustomerId = c. CustomerId
GROUP by c.FirstName;

/* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */


SELECT c.FirstName, c.LastName, sum(i.total) as total_amount -- total, aggregate functionda kullanıldığı için kıyaslamada WHERE yerine HAVING kullanılır
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
GROUP by c.FirstName
HAVING total_amount > 40 -- WHERE yerine HAVING kullandık, HAVING chartflow gereği GROUP by dan sonra kullanılır
ORDER by total_amount DESC;

--alternatif CustomerId ye göre gruplandırıldı.

SELECT c. CustomerId, c.FirstName, c.LastName, sum(i.total) as total_amount 
FROM invoices i
JOIN customers c
on i.CustomerId = c.CustomerId
GROUP by c.CustomerId
HAVING total_amount > 40 
ORDER by total_amount DESC;