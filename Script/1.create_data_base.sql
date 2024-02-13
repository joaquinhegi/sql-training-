--DataBase 1

CREATE DATABASE smcdb1
COLLATE Modern_Spanish_CI_AI

--Ver Collation
USE smcdb1
SELECT name, collation_name FROM sys.databases WHERE name = 'smcdb1';

--DataBase 2

CREATE DATABASE smcdb2
COLLATE Latin1_General_CS_AS

--Ver Collation
USE smcdb2
SELECT name, collation_name FROM sys.databases WHERE name = 'smcdb2';