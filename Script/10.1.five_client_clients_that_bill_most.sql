--Crea una consulta con los 5 clientes que más facturan.

SELECT top 5
    cus.CustomerId, 
    cus.CustomerName, 
    SUM(ind.TotalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId 
            INNER JOIN Customers cus ON cus.CustomerId = inh.CustomerId 
        GROUP BY cus.CustomerId, cus.CustomerName
ORDER BY SUM(ind.TotalLine) desc