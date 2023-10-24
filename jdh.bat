@echo off
title JDH

:::
:::                       _ _
setlocal 
set "branch=main"
set "repoUrl=https://github.com/criseduas/jdh/archive/refs/heads/%branch%.zip"
set "principal=%cd%"

:menu
for /f "delims=: tokens=*" %%A in ('findstr /b ":::" "%~f0"') do @echo(%%A

echo [1] ejecutar jdh
echo [2] actualizar jdh

set /p choice=Select an option: 
set choice=%choice: =%

if "%choice%"=="1" (
    cls
    echo.
    goto run
    pause
    cls
    goto menu

)

if "%choice%"=="2" (
    cls
    echo.
    goto updater
    pause
    cls
    goto menu
)

cls
echo ha pulsado un numero incorrecto. Por favor, introduzca un numero del 1 al 3.
echo.
echo pulse 'Enter' para ir al menu principal...
pause>nul
cls
goto menu

:run

@echo off
runtime\python.exe infer-web.py --pycmd runtime\python.exe --port 7897
pause
echo Pulse 'Enter' para ir al menu principal...
pause>nul
cls
goto menu


:updater

echo actualizando el repositorio...
git pull

echo JDH se ha actualizado!
echo.
echo pulse 'Enter' para ir al menu principal... 
pause>nul
cls
goto menu
