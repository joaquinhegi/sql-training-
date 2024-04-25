--Crea una consulta que calcule el total de facturación de los últimos tres meses a partir del día actual.

SELECT 
    SUM(ind.totalLine) Total
FROM sales.InvoicesDetail ind 
    INNER JOIN sales.InvoicesHeader inh 
        ON inh.InvoiceId = ind.InvoiceId
WHERE inh.InvoiceDate BETWEEN DATEADD(MONTH, -3, GETDATE()) AND GETDATE()