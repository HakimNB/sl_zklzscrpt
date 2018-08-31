call ..\config.bat
mysql --user="root" --password="bzbee" < "reload_backup_db.sql"
mysql --user="root" --password="bzbee" < "[LATEST]DB-FullSchema.sql"
copy "backup\db-alt-script\generate-db-alternation-script.bat" %ZKDIR%\server\DB_Scripts\generate-db-alternation-script.bat
copy "backup\db-alt-script\generate-full-db-schema.bat" %ZKDIR%\server\DB_Scripts\generate-full-db-schema.bat
pushd %ZKDIR%\server\DB_Scripts
call generate-all.bat
popd