-- Si la estructura no esta creada
SELECT * INTO smcdb2.dbo.Test
FROM smcdb1.dbo.Test

--Si la estructura ya esta creada
INSERT INTO smcdb2.dbo.Test
SELECT * FROM smcdb1.dbo.Test