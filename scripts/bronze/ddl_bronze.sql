exec bronze.load_bronze
create or alter procedure bronze.load_bronze as
begin
	Begin try
	declare @start_date datetime, @end_date datetime, @batch_starttime datetime, @batch_endtime datetime;
		set @batch_starttime = GETDATE();
		print '========================================='
		print 'Loading Bronze Layer'
		print '========================================='
		print 'Truncating bronze.crm_prd_info'
		print 'Inserting bronze.crm_prd_info'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.crm_prd_info
		bulk insert bronze.crm_prd_info
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';



		print '========================================='
		print 'Truncating bronze.crm_cust_info'
		print 'Inserting bronze.crm_cust_info'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.crm_cust_info
		bulk insert bronze.crm_cust_info
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';



		print '========================================='
		print 'Truncating bronze.crm_sales_details'
		print 'Inserting bronze.crm_sales_details'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.crm_sales_details
		bulk insert bronze.crm_sales_details
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';



		print '========================================='
		print 'Truncating bronze.erp_cust_az12'
		print 'Inserting bronze.erp_cust_az12'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.erp_cust_az12
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';



		print '========================================='
		print 'Truncating bronze.erp_loc_a101'
		print 'Inserting bronze.erp_loc_a101'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.erp_loc_a101
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';



		print '========================================='
		print 'Truncating bronze.erp_px_cat_g1v2'
		print 'Inserting bronze.erp_px_cat_g1v2'
		print '========================================='
		set @start_date = GETDATE();
		truncate table bronze.erp_px_cat_g1v2
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\unist\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with(
			firstrow = 2,
			fieldterminator = ','

		);
		set @end_date = GETDATE();
		print'>>Load Duration: ' + cast (datediff(second, @start_date,@end_date) as nvarchar(50)) + ' Seconds';

		set @batch_endtime = GETDATE();
		print'---------------------------------------'
		print '>> Total Loading Time of bronze Layer:' + cast(datediff(second,@batch_starttime,@batch_endtime) as nvarchar(50))+' seconds'
		print'---------------------------------------'

	end try
		begin catch
		print '========================================='
		print 'Error Occured during loading Bronze Layer'
		print 'Error Message'+ ERROR_MESSAGE();
		print 'Error Number'+ CAST (ERROR_NUMBER() as nvarchar(50));
		print 'Error State'+ CAST (ERROR_STATE() as nvarchar(50));
		print '========================================='
		end catch
end
