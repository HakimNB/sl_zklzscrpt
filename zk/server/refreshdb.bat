call ..\config.bat
mysql --user=%DBUSER% --password=%DBPASS% < "backup\sql\refreshdb\reload_amc_game_db.sql"
mysql --user=%DBUSER% --password=%DBPASS% < "backup\sql\refreshdb\[LATEST]DB-FullSchema.sql"
mysql --user=%DBUSER% --password=%DBPASS% < "backup\sql\refreshdb\#DB-InitInsertRequredData.sql"