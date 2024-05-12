@echo off
setlocal EnableDelayedExpansion

REM Prompt user to enter keyword to search for in virtual machine names
set /p "keyword=Enter keyword to search for in virtual machine names: "

REM Validate if keyword is provided
if not defined keyword (
    echo No keyword entered.
    pause
    exit /b 1
)

set "found_vm="

REM List virtual machines and search for the keyword
for /f "delims=" %%A in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
    echo %%A | findstr /i /c:"!keyword!" >nul
    if not errorlevel 1 (
        set "found_vm=%%A"
        REM Exit the loop after finding the first match
        goto :Found
    )
)
:Found

REM Check if a virtual machine with the specified keyword was found
if not defined found_vm (
    echo Virtual machine with keyword "!keyword!" not found.
    pause
    exit /b 1
)

REM Display found virtual machine name
echo Found virtual machine: !found_vm!

REM Extract the full name of the virtual machine
for /f "tokens=2*" %%B in ("!found_vm!") do set "vm_name=%%B"

REM Remove leading and trailing quotes from the virtual machine name
set "vm_name=!vm_name:"=!"

REM Prompt user for confirmation before making modifications
set /p "confirm=Do you want to enable nested virtualization and set video memory to 256 MB for !vm_name!? (Y/n): "
if /i "%confirm%"=="N" (
    echo User chose not to modify virtual machine configurations.
    pause
    exit /b 0
)

REM Default to 'Y' if the user didn't enter anything
if not defined confirm set "confirm=Y"

REM Modify virtual machine configuration to enable nested virtualization and set video memory to 256 MB
echo Modifying virtual machine configurations...
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifyvm "!vm_name!" --nested-hw-virt on --vram 256
if errorlevel 1 (
    echo Error: Failed to modify virtual machine configurations.
    pause
    exit /b 1
) else (
    echo Virtual machine configurations modified successfully.
)

pause
exit /b 0