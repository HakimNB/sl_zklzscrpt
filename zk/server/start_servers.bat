call ..\config.bat
pushd %ZKDIR%\server
start .\Bin\Debug64\UserServer\UserServer.exe
start .\Bin\Debug64\LogServer\LogServer.exe
start .\Bin\Debug64\SocialServer\SocialServer.exe
start .\Bin\Debug64\TaskServer\TaskServer.exe
start .\Bin\Debug64\OperationServer\OperationServer.exe
start .\Bin\Debug64\Loginserver\LoginServer.exe
REM start .\Bin\Debug64\Gameserver\GameServer.exe
popd