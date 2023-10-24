# Melakukan Cleansing Data
# 1. Melihat Nan
SELECT COUNT(*) AS jumlah_data_kosong
FROM customer
WHERE CustomerID IS NULL OR Age IS NULL OR Gender IS NULL OR MaritalStatus IS NULL OR Income ='';

#2. Melihat baris dengan stirng kosong ''
SELECT *
FROM customer
WHERE Income ='';

#3. Hapus baris yang kosong
# untuk data marital status yang kosong akan dihapus, karena kita tidak bisa memberikan keterangan
# pada status pelanggan dengan cara median, modus dan sebagianya.

DELETE FROM customer
WHERE MaritalStatus  ='';

# 4. Duplicated Data
SELECT
    CustomerID, 
    COUNT(CustomerID) AS cus_d,
    COUNT(Age) AS age_d,
    COUNT(Gender) AS gender_d,
    COUNT(MaritalStatus) AS status_d,
    COUNT(Income) AS income_d
FROM customer
GROUP BY CustomerID
HAVING cus_d > 1 OR age_d > 1 OR gender_d > 1 OR status_d > 1 OR income_d > 1;

# 5. Ubah Tipe Data
-- Mengganti koma dengan titik
UPDATE customer
SET Income = REPLACE(Income, ',', '.');

-- Mengonversi menjadi FLOAT
ALTER TABLE customer
MODIFY COLUMN Income FLOAT;

# 6. Cek anomali kolom umur
# Batas umur yang diperbolehkan untuk melakukan transaksi adalah minimal 17 tahun
SELECT
	Age,
	COUNT(Age) AS total
FROM customer
GROUP BY Age;

# hapus umur < 17
DELETE FROM customer
WHERE Age < 17;

# print
SELECT * FROM customer

