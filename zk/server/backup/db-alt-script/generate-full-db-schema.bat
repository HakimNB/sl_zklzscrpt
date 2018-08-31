set OUTPUT_FILE=.\#GeneratedDBScripts\[%CURRENT_DATE_TIME%]DB-FullSchema.sql

call mysqldump.exe --user=root --password=bzbee --host=127.0.0.1 --no-data ^
	--databases amc_game amc_social amc_operation amc_log > "%OUTPUT_FILE%"
