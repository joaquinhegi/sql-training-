SELECT 
inh.InvoiceType as Type,
YEAR(inh.InvoiceDate) as Year,
SUM(ind.TotalLine) as TotalInvoices,
SUM(ind.TotalLine * vty.VatRate) as TotalVat,
SUM(ind.Quantity) as Quantity,
AVG(ind.TotalLine) as AvgTotalInvoice,
STDEV(ind.TotalLine) StedevTotalInvoice,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 1) then ind.TotalLine else 0 end) as January,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 2) then ind.TotalLine else 0 end) as February,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 3) then ind.TotalLine else 0 end) as March,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 4) then ind.TotalLine else 0 end) as April,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 5) then ind.TotalLine else 0 end) as May,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 6) then ind.TotalLine else 0 end) as June,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 7) then ind.TotalLine else 0 end) as July,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 8) then ind.TotalLine else 0 end) as August,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 9) then ind.TotalLine else 0 end) as September,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 10) then ind.TotalLine else 0 end) as October,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 11) then ind.TotalLine else 0 end) as November,
SUM(CASE WHEN (MONTH(inh.InvoiceDate) = 12) then ind.TotalLine else 0 end) as December
FROM Sales.InvoicesHeader inh 
INNER JOIN Sales.InvoicesDetail ind ON ind.InvoiceId = inh.InvoiceId
INNER JOIN dbo.VatTypes vty ON ind.VatTypeId = vty.VatTypeId
GROUP BY  inh.InvoiceType, YEAR(inh.InvoiceDate)