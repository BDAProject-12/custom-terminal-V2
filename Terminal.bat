@echo off
cls
title Terminal
mode con: cols=120 lines=30

::program
set "os=%~dp0..\Tools-V1.4\OS_Mini.bat"
set "hecking=%~dp0..\Tools-V1.4\\config\hecking.bat"
set "matrix=%~dp0..\Tools-V1.4\\config\matrix.bat"

::halaman pertama
:login
cls
echo.
echo   Welcome To Terminal
echo.
echo  * Time : %time% ^| * Version : V2.3
echo  * Date : %date%  ^| * Author  : https://github.com/BDAProject-12
echo.
echo  [^>] Type "help" to see the command
echo.
goto menu

:menu
set "input="
set "kata1="
set "kata2="

set /p input="Terminal@BDA\> "

for /f "usebackq tokens=1,2 delims= " %%a in (`echo %input%`) do (
	set "kata1=%%a"
	set "kata2=%%b"
)

setlocal enabledelayedexpansion

::satu kalimat
if /i "%input%"=="help -program" goto help_program

::kata pertama
if /i "!kata1!"=="cls" cls & goto menu

if /i "!kata1!"=="help" goto help
if /i "!kata1!"=="login" goto login
if /i "!kata1!"=="start" start Terminal.bat
if /i "!kata1!"=="exit" exit

if /i "!kata1!"=="open" (
	if /i "!kata2!"=="os" start %os% & goto menu
	if /i "!kata2!"=="hecking" start %hecking% & goto menu
	if /i "!kata2!"=="matrix" start %matrix% & goto menu
	echo [!] Error code "%input%", type "help -program" to see help menu.
	goto menu
)

::kode error
echo [!] Error code "%input%", type "help" to see help menu.
goto menu

::fitur bawaan
:help
echo.
echo Commands                 Description
echo.
echo open [name_tools]        Launch the program
echo start                    Launch this program
echo help -program            Menu fitur program
echo cls                      To clear terminal screen
echo login                    Return to the main page
echo exit                     To close the terminal
echo.
goto menu

:help_program
echo.
echo Commands                 Description
echo.
echo open os                  Launch os tools
echo open hecking             Launch hecking prank tools
echo open matrix              Launch matrix tools
echo.
goto menu
