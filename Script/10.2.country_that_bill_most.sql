--Crea una consulta ordenada por los países que más facturan
SELECT
    cou.CountryName,
    SUM(ind.TotalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId 
            INNER JOIN Customers cus ON cus.CustomerId = inh.CustomerId 
            INNER JOIN Address adr ON adr.AddressId = cus.AddressId
            INNER JOIN Countries cou ON cou.CountryId = adr.CountryId
        GROUP BY cou.CountryId, cou.CountryName
ORDER BY SUM(ind.TotalLine) desc