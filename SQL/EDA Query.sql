#EDA
# query 1 : Berapa rata-rata umur customer jika dilihat dari marital statusnya ?

SELECT 
    AVG(Age) AS avg_umur,
    MaritalStatus
FROM customer
GROUP BY MaritalStatus;

# query 2 : Berapa rata-rata umur customer jika dilihat dari gender nya ?

SELECT 
	AVG(Age) AS avg_umur,
	CASE 
		WHEN Gender = 0 THEN 'Wanita'
		WHEN Gender = 1 THEN 'Pria'
		ELSE 'Tidak Diketahui'
	END AS jenis_kelamin
FROM customer
GROUP BY Gender;

# query 3 : Tentukan nama store dengan total quantity terbanyak!

WITH sCTE AS(
	SELECT 
		StoreID,
		StoreName
	FROM
		store
),
tCTE AS(
	SELECT
		t.StoreID,
		SUM(t.Qty) AS TotalQty
	FROM
		transaction t
	GROUP BY
		t.StoreID
)

SELECT
	sCTE.StoreName,
    tCTE.TotalQty
FROM
	sCTE
JOIN 
	tCTE ON sCTE.StoreID = tCTE.StoreID
ORDER BY
	tCTE.TotalQty DESC;
    
# query 4 : Tentukan nama produk terlaris dengan total amount terbanyak!
WITH pCTE AS(
	SELECT 
		ProductID,
        ProductName
	FROM
		product
),
trCTE AS(
	SELECT
		t.ProductID,
        SUM(Qty) AS TotalQuantity,
        SUM(TotalAmount) AS TotalAmount
	FROM
		transaction t
    GROUP BY 
		t.ProductID
)
SELECT
	pCTE.ProductName,
    trCTE.TotalQuantity,
    trCTE.TotalAmount
    
FROM pCTE
JOIN trCTE ON pCTE.ProductID = trCTE.ProductID
ORDER BY trCTE.TotalAmount DESC;
    