SELECT I.*
FROM Invoice I
WHERE I.InvoiceDate LIKE '2013%';
SELECT FirstName, LastName, Country
FROM Customer C
WHERE C.Country = 'Brazil' OR C.Country = 'Canada' OR C.Country = 'India' OR C.Country = 'Sweden';
SELECT T.Name Name, T.Composer Composer, A.Title Title
FROM Album A
JOIN Track T
ON A.AlbumId = T.AlbumId
WHERE T.Name LIKE 'A%' AND T.Composer NOT LIKE 'None';
SELECT C.FirstName FName, C.LastName LName, I.Total Ttl
FROM Customer C
JOIN Invoice I
ON C.CustomerId = I.CustomerId
ORDER BY I.Total DESC
LIMIT 10;
