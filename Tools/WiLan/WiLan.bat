@echo off 

REM =====================================
REM Autor: @ByDog3r
REM WI-LAN fue hecho principalmente para recuperar tus claves de wifi en segundos!
REM Version: 1.1
REM Github: https://github.com/ByDog3r/wilan
REM
REM TELEGRAM: @ByDog3r
REM Instagram: _smonth_
REM Twitter: @ByDog3r
REM
REM =====================================
cls


set autor= @ByDog3r
set snombre= WI-LAN
set sversion= 1.1
set github= https://github.com/ByDog3r/WILAN
set di= ______________________________________________________________________


setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto menu
if "%version%" == "6.3" goto menu
if "%version%" == "6.2" goto menu
if "%version%" == "6.1" goto menu-w7
if "%version%" == "6.0" goto menu-w7
endlocal

:menu-w7
:------------------------------------- 
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system" 
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
) 
 
if '%errorlevel%' NEQ '0' (
    goto UACPrompt 
) else (goto gotAdmin) 

:UACPrompt 
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    set params=%* 
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs" 

    "%temp%\getadmin.vbs" 
    del "%temp%\getadmin.vbs" 
    exit /B 

:gotAdmin 
    pushd "%CD%" 
    CD /D "%~dp0" 
:--------------------------------------

cls

cd %ubicacion%
color 6
mode con cols=70 lines=30
cls
title %snombre% %sversion% 
echo%di%
echo.
echo   __    __ _____  __    _        __ 
echo  / / /\ \ \\_   \/ /   /_\    /\ \ \
echo  \ \/  \/ / / /\/ /   //_\\  /  \/ /
echo   \  /\  /\/ /_/ /___/  _  \/ /\  / 
echo    \/  \/\____/\____/\_/ \_/\_\ \/  
echo           Github: @ByDog3r                                   
echo.
echo%di%
echo.
echo.
echo   [1] Mostrar clave de una red wifi especifica 
echo   [2] Guardar claves de todas las redes wifi
echo   [X] No compatible con windows 7 
echo.
echo   [4] Github 
echo   [5] Informacion
echo   [6] Salir
echo.
set /p opciones1-w7=# Elije una opcion: 

if %opciones1-w7% == 1 goto opcion1-w7
if %opciones1-w7% == 2 goto opcion2-w7
REM ???
if %opciones1-w7% == 4 goto opcion4-w7
if %opciones1-w7% == 5 goto opcion5-w7
if %opciones1-w7% == 6 exit

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-6)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto menu-w7

:opcion1-w7
color a
mode con cols=70 lines=30
cls
title %snombre% %sversion%
echo.
echo  Detectando redes.
ping localhost -n 2 >nul
cls
echo.
echo  Detectando redes..
ping localhost -n 2 >nul
cls
echo.
echo  [#] Hecho.
ping localhost -n 2 >nul
echo.
cls
goto opcion1-1-w7

:opcion1-1-w7
cls
color 6
echo%di%
echo.
echo  Redes WiFi disponibles:
echo.
netsh wlan show profile | findstr /R /C:"[ ]:[ ]"
echo.
echo%di% 
echo.
echo  [@] Escribe el nombre de la red WiFi.
echo  (Ejemplo: WiFi-Gratis)
echo.
echo.
set /p nombre-wifi-w7=# Wi-Lan: 
cls
color a
echo.
echo  Comprobando el nombre de la red..
ping localhost -n 2 >nul
cls
netsh wlan show profiles name=%nombre-wifi-w7%
if %errorlevel%==1 goto error0-w7
cls
echo.
echo  [#] Hecho
ping localhost -n 2 >nul
goto opcion1-2-w7

:opcion1-2-w7
cls
color 6
echo%di%
echo.
echo ##:    Nombre de la red WiFi  :  %nombre-wifi-w7%
echo.
netsh wlan show profiles name=%nombre-wifi-w7% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 30
echo%di%
echo. 
echo.
echo # Guardar resultados en un archivo de texto?
echo.
echo  [1] Si
echo  [2] No
echo.
echo.
set /p guardar-opcion1-w7=# WI-LAN: 
echo.
if %guardar-opcion1-w7%==1 goto guardar-opcion1-claves-w7
if %guardar-opcion1-w7%==2 goto menu-w7

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-2-w7


:guardar-opcion1-claves-w7
type clave.txt>nul
cls
if %errorlevel%==1 goto guardar-opcion1-1-w7
if %errorlevel%==0 goto error1-w7

:borrar-opcion1-w7
del clave.txt>nul
cls
goto guardar-opcion1-1-w7

:guardar-opcion1-1-w7
echo WILAN - MADE BY @ByDog3r >> clave.txt
echo. >> clave.txt
echo%di% >> clave.txt
echo. >> clave.txt
echo ##:    Nombre de la red WiFi  : %nombre-wifi-w7% >> clave.txt
netsh wlan show profiles name=%nombre-wifi-w7% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 30 >> clave.txt
echo%di% >> clave.txt
echo.
color a
echo  Guardando..
ping localhost -n 2 >nul
cls
color 6
echo.
echo # Guardado en clave.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu-w7

:opcion2-w7
cls
cd %ubicacion%
start Tools\WiLan\o2.bat
color 6
echo.
echo # Las claves fueron guardadas en claves.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu-w7

:opcion4-w7
start https://github.com/ByDog3r/WiLan
goto menu-w7

:opcion5-w7
cls
color b
echo%di%
echo.
echo CITTZ fue hecho principalmente para recuperar tus claves de wifi en   segundos!
echo.
echo Redes sociales del autor (ByDog3r):
echo.
echo [1] Instagram
echo [2] Twitter
echo [3] Github
echo.
echo%di%
echo.
echo [99] Volver al menu
echo.
set /p informacion-w7=# Elije una opcion: 

if %informacion-w7%==1 goto opcion5-1-w7
if %informacion-w7%==2 goto opcion5-2-w7
if %informacion-w7%==3 goto opcion5-3-w7
if %informacion-w7%==99 goto menu-w7

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-7)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion5-w7

:opcion5-1-w7
start www.instagram.com/_smonth_
goto menu-w7

:opcion5-2-w7
start www.twitter.com/bydog3r
goto menu-w7

:opcion5-3-w7
start www.github.com/ByDog3r
goto menu-w7


:error0-w7
cls
color 4
echo%di%
echo.
echo  [x] La red WiFi ingresada no existe!
echo  Si crees que es un error contacta con el programador.
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-1-w7


:error1-w7
color c
echo.
echo  [x] El archivo "clave.txt" ya existe! Desea remplazarlo?
echo.
echo.
echo  [1] Si
echo  [2] No
echo.
set /p error1-1-w7=# WI-LAN: 

if %error1-1-w7%==1 goto borrar-opcion1-w7
if %error1-1-w7%==2 goto menu-w7

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto error1-w7

:menu
cls
cd %ubicacion%
color 6
mode con cols=70 lines=30
cls
title %snombre% %sversion% 
echo%di%
echo.
echo   __    __ _____  __    _        __ 
echo  / / /\ \ \\_   \/ /   /_\    /\ \ \
echo  \ \/  \/ / / /\/ /   //_\\  /  \/ /
echo   \  /\  /\/ /_/ /___/  _  \/ /\  / 
echo    \/  \/\____/\____/\_/ \_/\_\ \/  
echo           Github: @ByDog3r                                   
echo.
echo%di%
echo.
echo.
echo   [1] Mostrar clave de una red wifi especifica
echo   [2] Guardar claves de todas las redes wifi
echo   [3] Generar reporte de WLAN (Necesita permisos de Administrador)
echo.
echo   [4] Github 
echo   [5] Informacion
echo   [6] Salir
echo.
set /p opciones1=# Elije una opcion: 

if %opciones1% == 1 goto opcion1
if %opciones1% == 2 goto opcion2
if %opciones1% == 3 goto opcion3
REM ???
if %opciones1% == 4 goto opcion4
if %opciones1% == 5 goto opcion5
if %opciones1% == 6 exit

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-6)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion1
color a
mode con cols=70 lines=30
cls
title %snombre% %sversion%
echo.
echo  Detectando redes.
ping localhost -n 2 >nul
cls
echo.
echo  Detectando redes..
ping localhost -n 2 >nul
cls
echo.
echo  [#] Hecho.
ping localhost -n 2 >nul
echo.
cls
goto opcion1-1

:opcion1-1
cls
color 6
echo%di%
echo.
echo  Redes WiFi disponibles:
echo.
netsh wlan show profile | findstr /R /C:"[ ]:[ ]"
echo.
echo%di% 
echo.
echo  [@] Escribe el nombre de la red WiFi.
echo  (Ejemplo: WiFi-Gratis)
echo.
echo.
set /p nombre-wifi=# WIFI-LAN: 
cls
color a
echo.
echo  Comprobando el nombre de la red..
ping localhost -n 2 >nul
cls
netsh wlan show profiles name=%nombre-wifi%
if %errorlevel%==1 goto error0
cls
echo.
echo  [#] Hecho
ping localhost -n 2 >nul
goto opcion1-2

:opcion1-2
cls
color 6
echo%di%
echo.
echo ##:    Nombre de la red WiFi  :  %nombre-wifi%
echo.
netsh wlan show profiles name=%nombre-wifi% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 33
echo%di%
echo. 
echo.
echo # Guardar resultados en un archivo de texto?
echo.
echo  [1] Si
echo  [2] No
echo.
echo.
set /p guardar-opcion1=# WI-LAN: 
echo.
if %guardar-opcion1%==1 goto guardar-opcion1-claves
if %guardar-opcion1%==2 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-2


:guardar-opcion1-claves
type clave.txt>nul
cls
if %errorlevel%==1 goto guardar-opcion1-1
if %errorlevel%==0 goto error1

:borrar-opcion1
del clave.txt>nul
cls
goto guardar-opcion1-1

:guardar-opcion1-1
echo WiLan - Made By @ByDog3r >> clave.txt
echo. >> clave.txt
echo%di% >> clave.txt
echo. >> clave.txt
echo ##:    Nombre de la red WiFi  : %nombre-wifi% >> clave.txt
netsh wlan show profiles name=%nombre-wifi% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 33 >> clave.txt
echo%di% >> clave.txt
echo.
color a
echo  Guardando..
ping localhost -n 2 >nul
cls
color 6
echo.
echo # Guardado en clave.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion2
cls
cd %ubicacion%
start Tools\WiLan\o2.bat
color 6
echo.
echo # Las claves fueron guardadas en claves.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion3
cls
color 6
echo.
echo Esperando..
start Tools\WiLan\o3.vbs
goto menu 

:opcion4
start https://github.com/ByDog3r/WILAN
goto menu

:opcion5
cls
color b
echo%di%
echo.
echo Wi-Lan fue hecho principalmente para recuperar tus claves de wifi en   segundos!
echo.
echo Redes sociales del autor (@ByDog3r):
echo.
echo [1] Instagram
echo [2] Twitter
echo [3] Github
echo.
echo%di%
echo.
echo [99] Volver al menu
echo.
set /p informacion=# Elije una opcion: 

if %informacion%==1 goto opcion5-1
if %informacion%==2 goto opcion5-2
if %informacion%==3 goto opcion5-3
if %informacion%==99 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-7)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion5

:opcion5-1
start www.instagram.com/_smonth_
goto menu

:opcion5-2
start www.twitter.com/ByDog3r
goto menu

:opcion5-3
start www.github.com/ByDog3r
goto menu

:error0
cls
color 4
echo%di%
echo.
echo  [x] La red WiFi ingresada no existe!
echo  Si crees que es un error contacta con el programador.
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-1

:error1
color c
echo.
echo  [x] El archivo "clave.txt" ya existe! Desea remplazarlo?
echo.
echo.
echo  [1] Si
echo  [2] No
echo.
set /p error1-1=# WI-LAN: 

if %error1-1%==1 goto borrar-opcion1
if %error1-1%==2 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto error1
