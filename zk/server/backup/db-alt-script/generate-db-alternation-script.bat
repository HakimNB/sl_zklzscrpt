set OUTPUT_FILE=.\#GeneratedDBScripts\[%CURRENT_DATE_TIME%]DB-Alternation.sql

set DB_LIST=amc_game
@for %%i in (%DB_LIST%) do (
	echo -- ========== %%i ========== >> "%OUTPUT_FILE%"
	echo use `%%i`; >> "%OUTPUT_FILE%"
	echo. >> "%OUTPUT_FILE%"
	@rem sourceserver-> userName:password@(host:port)/dbName 
	@rem targetServer-> userName:password@(host:port)/dbName 
	call mysql-schema-sync.exe -source "root:bzbee@(127.0.0.1:3306)/%%i" ^
		-dest "root:bzbee@(127.0.0.1:3306)/%%i_backup" >> "%OUTPUT_FILE%"
)
