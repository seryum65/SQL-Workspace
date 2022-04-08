
/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	CREATE TABLE personel (
	first_name TEXT, 
	last_name TEXT,
	age INT,
	hire_date date
	);
/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/
	CREATE TABLE personel (
	first_name TEXT, 
	last_name TEXT,
	age INT,
	hire_date date
	);



/* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */
	
CREATE TABLE if NOT EXISTS personel(
	first_name TEXT,
	last_name TEXT,
	age INT,
	hire_date DATE
	);	
	
/*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/	

CREATE TABLE if NOT EXISTS vacation_plan(
	place_id INTEGER,
	country NVARCHAR(50),
	hotel_name NVARCHAR(100),
	employee_id INTEGER,
	vacation_length INTEGER,
	budget NUMERIC
	);

	
	
/*------------------------------------------------------------------------------------------
/*  DROP TABLE
/*------------------------------------------------------------------------------------------
/* personel tablosunu siliniz */
	
DROP TABLE personel;	
	
/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/

DROP TABLE if EXISTS personel;
 
	
-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu 
-- desteklememektedir. Truncate komutu  bir tabloyu değil içindeki tüm verileri 
-- silmek için kullanılır.	
	
INSERT INTO vacation_plan VALUES(1,34, "Turkey", "Hotel İstanbul", 7, 4000);
INSERT INTO vacation_plan VALUES(2,34, "Turkey", "Hotel İstanbul", 7, 4000);
INSERT INTO vacation_plan (place_id,country, hotel_name, employee_id)
                             VALUES(06, "TURKEY", 'HOTEL BAŞKENT',3);
							
INSERT INTO vacation_plan (place_id,country, hotel_name, employee_id)
                             VALUES(1, "USA", 'HOTEL California',8);	
	


/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.	
 
 -----------------------------------------------------------------------------------------*/
 
 CREATE TABLE workers(
   id INT PRIMARY KEY,
   id_number TEXT NOT NULL UNIQUE,
   name TEXT DEFAULT 'NONAME',
   salary INTEGER NOT NULL
  );
  
  INSERT INTO workers VALUES(1,"12345678910","CAN CANAN", 10000);
  
  -- UNIQUE CONST VIOLATION
  -- INSERT INTO workers VALUES(1,"4445678910","AHMET CANAN", 7000); 
  
    INSERT INTO workers VALUES(3,"566678910",NULL, 9000);
	
	--name kısmına NONAME yazılır. (DEFAULT)
	INSERT INTO workers (id, id_number, salary) VALUES(4,"57786678910",9000);
  
/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak  değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 
 
 
 CREATE TABLE  vacation_plan2(
	place_id INTEGER,
	country NVARCHAR(50),
	hotel_name NVARCHAR(100),
	employee_id INTEGER,
	vacation_length INTEGER,
	budget NUMERIC,
	PRIMARY KEY(place_id),
	FOREIGN KEY (employee_id)REFERENCES employees(EmployeeId);
);
 
 /* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/
 
 INSERT INTO vacation_plan2 VALUES(34,"Turkey","Happy Nation", 1,5,7500);
 

 /* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/
-- HATA  (FOREIGN KEY constraint failed)
-- INSERT INTO vacation_plan2 VALUES(65,"Turkey","tekin otel", 9,4,8500);
 
 
 /* JOIN işlemi ile 2 tablodan veri çekme */
 /* FirstName, LastName, vacation_length, hotel_name*/
 
 --- INNER JOIN
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 JOIN vacation_plan2 v
 on e.EmployeeId = v.employee_id;
 
 --- LEFT JOIN
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 on e.EmployeeId = v.employee_id;
 
 
 /*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */
 
ALTER TABLE vacation_plan2 
ADD name TEXT DEFAULT 'isimsiz';


 /* vacation_plan2 tablosundaki name sütunun siliniz.*/

 ALTER TABLE vacation_plan2
 DROP COLUMN name;
 
 /* workers tablosunun adını people olarak değiştiriniz.*/

ALTER TABLE workers
RENAME to people;



*------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini Komagene Hotel olarak
güncelleyiniz.*/
   
UPDATE vacation_plan2
SET hotel_name = 'Komagene Hotel'
WHERE employee_id = 1;
   
/* people tablosunda salary sutunu 7000 'den az olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 
   
UPDATE people
SET salary = salary*1.2
WHERE salary < 11000;
   
/*people tablosundaki tüm kayıtkarın salary sutununu 10000 olarak güncelleyiniz */
UPDATE people
SET salary=10000;
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydı siliniz*/
DELETE FROM vacation_plan2
WHERE employee_id=1;



