-- Q1: USA'daki 2009 yılına ait faturaların toplam tutarını gösteren sorgu

SELECT 
    COALESCE(SUM(total), 0) AS toplam_tutar  -- COALESCE ile NULL değerleri önleme 
FROM invoice
WHERE billing_country = 'USA' -- WHERE ile Sadece ABD'ye ait faturaları filtreleme
AND DATE_PART('year', invoice_date) = 2009;  -- DATE_PART ile 2009 yılına göre filtreleme


-- Q2: Çalma listelerine ait parçaları listeleyen sorgu
SELECT 
    t.track_id,            -- Parçanın benzersiz kimliği 
    t.name AS track_name,  -- Parçanın adı
    p.playlist_id,         -- Çalma listesinin kimliği
    p.name AS playlist_name -- Çalma listesinin adı
FROM playlist p  
-- Çalma listesi ile playlisttrack tablosunu playlist_id üzerinden birleştirme
LEFT JOIN playlisttrack pt ON p.playlist_id = pt.playlist_id  
-- Playlisttrack tablosunu kullanarak parçalarla ilişkilendirme
LEFT JOIN track t ON pt.track_id = t.track_id  
-- Sonuçları önce çalma listesi kimliğine, sonra parça adına göre sıralama
ORDER BY p.playlist_id, t.name;


-- Q3: "Let There Be Rock" albümüne ait parçaları listeleyen sorgu
SELECT 
    t.track_id,        -- Parçanın benzersiz kimliği
    t.name AS track_name, -- Parçanın adı
    t.milliseconds,    -- Parçanın süresi in ms
    a.name AS artist_name -- Parçanın sanatçısının adı
FROM track t
-- Albüm tablosuyla birleştirme
INNER JOIN album al USING (album_id)  
-- Sanatçı tablosuyla birleştirme
INNER JOIN artist a USING (artist_id)
-- Sadece "Let There Be Rock" adlı albümün parçalarını filtreleme
WHERE al.title = 'Let There Be Rock'
-- Parçaları süreye (milisaniye) göre büyükten küçüğe sıralama
ORDER BY t.milliseconds DESC;
