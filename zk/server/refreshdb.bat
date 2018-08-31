call ..\config.bat
mysql --user="root" --password="bzbee" < "backup\sql\refreshdb\reload_amc_game_db.sql"
mysql --user="root" --password="bzbee" < "backup\sql\refreshdb\[LATEST]DB-FullSchema.sql"
mysql --user="root" --password="bzbee" < "backup\sql\refreshdb\#DB-InitInsertRequredData.sql"