INSERT INTO [dbo].[Test] (
code, 
charType, 
ncharType, 
guidType, 
intType, 
dobulbeType, 
moneyType, 
varcharType, 
nvarcharType, 
boolType, 
binaryType, 
decimalType, 
timeType, 
dateType, 
imageType
)
VALUES
('BBB456', 'TestChar', 'TestNChar', NEWID(), 123, 123.456, 100.00, 'VarChar', 'NVarChar', 1, 0x01, 123.45, '12:34:56.789', '2024-02-12', 0x123456),
('CCC789', 'TestChar', 'TestNChar', NEWID(), 456, 456.789, 200.00, 'VarChar', 'NVarChar', 0, 0x00, 234.56, '01:23:45.678', '2024-02-13', 0x654321),
('DDD987', 'TestChar', 'TestNChar', NEWID(), 789, 789.012, 300.00, 'VarChar', 'NVarChar', 1, 0x01, 345.67, '23:45:12.345', '2024-02-14', 0xabcdef),
('EEE654', 'TestChar', 'TestNChar', NEWID(), 1011, 1011.23, 400.00, 'VarChar', 'NVarChar', 0, 0x00, 456.78, '13:14:15.678', '2024-02-15', 0xfedcba),
('FFF321', 'TestChar', 'TestNChar', NEWID(), 1213, 1314.56, 500.00, 'VarChar', 'NVarChar', 1, 0x01, 567.89, '21:12:13.456', '2024-02-16', 0x987654);
