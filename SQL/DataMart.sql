WITH cCTE AS (SELECT * FROM customer),
pCTE AS (SELECT * FROM product),
sCTE AS (SELECT * FROM store),
tCTE AS (SELECT * FROM transaction)

SELECT
	tCTE.TransactionID,
    tCTE.Date,
    tCTE.Price,
    tCTE.Qty,
    tCTE.TotalAmount,
    cCTE.Age,
    cCTE.Gender,
    cCTE.MaritalStatus,
    cCTE.Income,
    pCTE.ProductName,
    sCTE.StoreName,
    sCTE.GroupStore,
    sCTE.Latitude,
    sCTE.Longitude
FROM
	tCTE
JOIN cCTE ON cCTE.CustomerID = tCTE.CustomerID
JOIN pCTE ON pCTE.ProductID = tCTE.ProductID
JOIN sCTE ON sCTE.StoreID = tCTE.StoreID;
