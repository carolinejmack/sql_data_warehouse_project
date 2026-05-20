/*
===========================
Load Data to Tables
===========================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @total_start_time DATETIME, @total_end_time DATETIME;
	SET @total_start_time = GETDATE();
	BEGIN TRY

		PRINT '==========================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==========================================================';

		PRINT '==========================================================';
		PRINT 'Loading CRM Tables';
		PRINT '==========================================================';

		-- Load Table crm_cust_info
		SET @start_time = GETDATE();
		PRINT '>> Truncating crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Loading Data Into: crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		-- Load Table crm_prd_info
		SET @start_time = GETDATE();
		PRINT '>> Truncating crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Loading Data Into: crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		-- Load Table crm_sales_details
		SET @start_time = GETDATE();
		PRINT '>> Truncating crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> Loading Data Into: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		PRINT '==========================================================';
		PRINT 'Loading ERP Tables';
		PRINT '==========================================================';

		-- Load Table erp_CUST_AZ12
		SET @start_time = GETDATE();
		PRINT '>> Truncating erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		PRINT '>> Loading Data Into: erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		-- Load Table erp_LOC_A101
		SET @start_time = GETDATE();
		PRINT '>> Truncating erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		PRINT '>> Loading Data Into: erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		-- Load Table erp_PX_CAT_G1V2
		SET @start_time = GETDATE();
		PRINT '>> Truncating erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
		PRINT '>> Loading Data Into: erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\carol\OneDrive\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FORMAT = 'CSV'
			,FIRSTROW = 2
			,FIELDTERMINATOR = ','
			,ROWTERMINATOR = '\n'
			,TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------';

		SET @total_end_time = GETDATE();
		PRINT 'Total Duration of Bronze Layer: ' + CAST(DATEDIFF(second, @total_start_time, @total_end_time) AS NVARCHAR) + ' seconds';

	END TRY
	BEGIN CATCH

		PRINT '==========================================================';
		PRINT 'Error Occurred During Loading Bronze Layer';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Number' + CAST(ERROR_NUMBER()AS NVARCHAR(50));
		PRINT '==========================================================';

	END CATCH
END
