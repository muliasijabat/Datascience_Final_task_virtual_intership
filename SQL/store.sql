SELECT * FROM ds_kalbe.store;

# Cek anomali data
# 1. ubah tipe data pada kolom Latitude dab Longitude
# Ubah dari text ke float

# hapus koma ganti titik
UPDATE store
SET Latitude = REPLACE(Latitude, ',','.');

# Ubah tipe data
ALTER TABLE store
MODIFY COLUMN Latitude FLOAT;

# hapus koma ganti titik
UPDATE store
SET Longitude = REPLACE(Longitude, ',','.');

# Ubah tipe data
ALTER TABLE store
MODIFY COLUMN Longitude FLOAT;