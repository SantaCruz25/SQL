

-- Soru 1. Çalışanların ad, soyad ve maaş bilgilerini gösteren kolonları gösterir.
SELECT Firstname, Lastname, Salary FROM Employees;

-- Soru 2. Çalışanların çalıştıkları departmanların benzersiz olan listesini gösterir.
SELECT DISTINCT departmentid FROM Employees;

-- Soru 3. departmentid değeri 1 olan yani sadece IT departmanında çalışanların tüm bilgilerini gösterir.
SELECT * FROM Employees 
WHERE departmentid = 1;

-- Soru 4. Çalışanların tüm bilgilerini maaşlarına göre büyükten küçüğe sıralar ve azalan sırayla listeler.
SELECT * FROM Employees 
ORDER BY Salary DESC;

-- Soru 5. Çalışanların ad ve soyad kolonlarını birleştirerek "Fullname" adıyla yeni bir sütun olarak gösterir.
SELECT Firstname || ' ' || Lastname AS "Fullname"  
FROM Employees;




