/*
====================================
Create Database and Schemas
====================================
Purpose
Creates a new database called DataWarehouse. The script checks if the database exists and drops it before recreating.
Schemas bronze, silver and gold are also created.

Warning:
This script completely drops an existing DataWarehouse database (i.e. all data in the database will be deleted).
*/

-- Create Database 'DataWarehouse'

USE master;
GO

-- Drop and Create DataWarehouse

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse') -- Check for rows/existing DB
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Allow only one connection to DB
	DROP DATABASE DataWarehouse; -- Delete DB
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
