SELECT * FROM ds_kalbe.transaction;

# Cek Anomali Data
# 1. Lihat duplicate data pada 'TransaksiID'
# Duplicate data tidak bisa dihapus karena CustomerID dan pesanan berbeda

SELECT 
	TransactionID, 
    COUNT(*) AS total_transaksi
FROM transaction
GROUP BY TransactionID
HAVING COUNT(*) > 1;

SELECT * 
FROM transaction
WHERE TransactionID = 'TR11542';

# buat kolom baru sebagai primary key
# menambah kolom baru Sequence
ALTER TABLE
	transaction
ADD COLUMN Sequence INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

# 2. Ubah tipe data

# Date
-- Mengonversi menjadi Date
UPDATE transaction
SET Date = STR_TO_DATE(Date, '%d/%m/%Y');










