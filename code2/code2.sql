--Q1:

-- Tüm sütunları NULL olan kayıtların sayısını bulma
SELECT COUNT(*) AS null_record_count
FROM Invoice
WHERE COALESCE(
    CAST(invoice_id AS text), 
    CAST(customer_id AS text), 
    CAST(invoice_date AS text), 
    billing_address, 
    billing_city, 
    billing_state, 
    billing_country, 
    billingpostal_code, 
    CAST(total AS text)
) IS NULL; -- Null olan satır sayısı = 0

--Q2:

-- Total değerlerinin iki katını alarak yeni bir sütun oluşturma ve sıralama
SELECT invoice_id, total AS eski_total, total * 2 AS yeni_total
FROM Invoice
ORDER BY yeni_total DESC;

--Q3:

--Adres kolonunu kısaltma ve 2013 yılının 8. ayına göre filtreleme
SELECT invoice_id, 
       CONCAT(LEFT(billing_address, 3), '...', RIGHT(billing_address, 4)) AS "Açık Adres",
       invoice_date
FROM Invoice
WHERE DATE_PART('year', invoice_date) = 2013 
  AND DATE_PART('month', invoice_date) = 8;

