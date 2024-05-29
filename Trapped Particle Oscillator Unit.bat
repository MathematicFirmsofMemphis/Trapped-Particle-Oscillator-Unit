@echo off
title Bank of America Style Banking System
color 0A

:: Initial particle
set particle=1000

:main_menu
cls
echo ==================================================
echo    KTX-TPOU Trapped Particle Oscillator Unit
echo ==================================================
echo 1. Login
echo 2. Exit
echo ==================================================
set /p choice="Please choose an option (1-2): "

if %choice%==1 goto login
if %choice%==2 goto exit
goto main_menu

:login
cls
set /p user="Enter Username: "
set /p pass="Enter Password: "
echo Authenticating...
:: Simulating a database check for username and password
if "%user%"=="admin" if "%pass%"=="password" (
    echo Authentication successful!
    pause
    goto account_menu
) else (
    echo Invalid username or password. Please try again.
    pause
    goto main_menu
)

:account_menu
cls
echo ==================================================
echo                 Account Menu
echo ==================================================
echo 1. Check particle
echo 2. Deposit particle
echo 3. Withdraw particle
echo 4. Trapped Particle Programming
echo 5. Log Out
echo ==================================================
set /p acc_choice="Please choose an option (1-5): "

if %acc_choice%==1 goto check_particle
if %acc_choice%==2 goto deposit_particle
if %acc_choice%==3 goto withdraw_particle
if %acc_choice%==4 goto trapped_particle_programming
if %acc_choice%==5 goto main_menu
goto account_menu

:check_particle
cls
echo Your current particle is: $%particle%
pause
goto account_menu

:deposit_particle
cls
set /p deposit="Enter amount to deposit: "
for /f "tokens=* delims=0123456789" %%a in ("%deposit%") do set valid=%%a
if defined valid (
    echo Invalid input. Please enter a numeric value.
    pause
    goto deposit_particle
)
set /a particle=%particle%+%deposit%
echo You have successfully deposited $%deposit%.
echo Your new particle is: $%particle%
pause
goto account_menu

:withdraw_particle
cls
set /p withdraw="Enter amount to withdraw: "
for /f "tokens=* delims=0123456789" %%a in ("%withdraw%") do set valid=%%a
if defined valid (
    echo Invalid input. Please enter a numeric value.
    pause
    goto withdraw_particle
)
if %withdraw% gtr %particle% (
    echo Insufficient funds.
) else (
    set /a particle=%particle%-%withdraw%
    echo You have successfully withdrawn $%withdraw%.
    echo Your new particle is: $%particle%
)
pause
goto account_menu

:trapped_particle_programming
cls
echo Welcome to Trapped Particle Programming!
echo TPOU(Trapped Particle Oscillator Unit) Entanglement Programming Errors Input/Deletion.
pause
goto account_menu

:exit
cls
echo Thank you for using BOSS. Goodbye!
pause
exit
