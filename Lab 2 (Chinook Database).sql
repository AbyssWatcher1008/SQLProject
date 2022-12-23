SELECT BillingCountry, COUNT(InvoiceId)
FROM Invoice
GROUP BY 1
ORDER BY 2 DESC;
SELECT BillingCity, SUM(Total) InvoiceTotal
FROM Invoice
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
SELECT I.CustomerId, C.FirstName, C.LastName, SUM(I.Total) InvoiceTotal
FROM Invoice I
JOIN Customer C
ON I.CustomerId = C.CustomerId
GROUP BY 1
ORDER BY 4 DESC
LIMIT 1;
SELECT C.Email, C.FirstName, C.LastName, G.Name
FROM Customer C
JOIN Invoice I
ON I.CustomerId = C.CustomerId
JOIN InvoiceLine IL
ON I.InvoiceId = IL.InvoiceId
JOIN Track T
ON T.TrackId = IL.TrackId
JOIN Genre G
ON G.GenreId = T.GenreId
WHERE G.Name = 'Rock'
ORDER BY 1;
WITH t1 AS (SELECT C.CustomerId, C.FirstName, C.LastName, C.Country, SUM(I.Total) Total
FROM Customer C
JOIN Invoice I
ON C.CustomerId = I.CustomerId
GROUP BY 1),
     t2 AS (SELECT CustomerId, FirstName, LastName, Country, MAX(Total) TotalSpent
FROM t1
GROUP BY 4)
SELECT t1.*
FROM t1
JOIN t2
ON t1.Country = t2.Country
WHERE t1.Total = t2.TotalSpent
ORDER BY Country;
