SELECT testDb01.*, testDb02.*
FROM smcdb1.dbo.Test AS testDb01
JOIN smcdb2.dbo.Test AS testDb02
ON testDb01.code COLLATE Latin1_General_CI_AS = testDb02.code COLLATE Latin1_General_CI_AS;

SELECT testDb01.*, testDb02.*
FROM smcdb1.dbo.Test AS testDb01
JOIN smcdb2.dbo.Test AS testDb02
ON testDb01.code  = testDb02.code;