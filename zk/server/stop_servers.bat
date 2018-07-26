call ..\config.bat
pushd %ZKDIR%\server
taskkill /F /im redis-server.exe
taskkill /F /im LoginServer.exe
REM taskkill /F /im GameServer.exe
taskkill /F /im SocialServer.exe
taskkill /F /im OperationServer.exe
taskkill /F /im UserServer.exe
taskkill /F /im LogServer.exe
taskkill /F /im TaskServer.exe
popd