/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */

--sunquery
SELECT TrackId, name,AlbumId
FROM tracks
WHERE AlbumId = (SELECT AlbumId FROM albums
 WHERE Title = "Faceless");
 
 
--JOIN
SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
on t.AlbumId = a.AlbumId
WHERE a.Title = 'Faceless';

SELECT t.TrackId, t.name, t.AlbumId
FROM tracks t
JOIN albums a
on t.AlbumId = a.AlbumId AND a.Title = 'Faceless';


/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */	

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */	




