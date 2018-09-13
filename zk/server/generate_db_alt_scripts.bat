call ..\config.bat
REM remember to copy FullSchema sql from refreshdb folder (which is the latest used)
REM and rename amc_game to amc_game_backup within the file contents before running this script!
mysql --user=%DBUSER% --password=%DBPASS% < "backup\sql\generate_db_alt_scripts\reload_backup_db.sql"
mysql --user=%DBUSER% --password=%DBPASS% < "backup\sql\generate_db_alt_scripts\[LATEST]DB-FullSchema.sql"
copy "backup\db-alt-script\generate-db-alternation-script.bat" %ZKDIR%\server\DB_Scripts\generate-db-alternation-script.bat
copy "backup\db-alt-script\generate-full-db-schema.bat" %ZKDIR%\server\DB_Scripts\generate-full-db-schema.bat
pushd %ZKDIR%\server\DB_Scripts
call generate-all.bat
popd