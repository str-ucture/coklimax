@echo off
setlocal enabledelayedexpansion
:: Define the source and destination directories
set "source=source\notebooks"
set "destination=docs\notebooks"

:: Get the full path of the source directory
pushd "%source%"
set "sourceFullPath=%cd%"
popd

:: Ensure the destination folder exists
if not exist "%destination%" (
    mkdir "%destination%"
)

:: Traverse the source directory to find folders named "images"
for /d /r "%source%" %%D in (*) do (
    if /i "%%~nxD"=="images" (
        :: Get the full path of the current "images" folder
        set "fullPath=%%D"

        :: Remove the source full path to get the relative path
        set "relPath=!fullPath:%sourceFullPath%=!"

        :: Create the corresponding folder in the destination
        mkdir "%destination%!relPath!"

        :: Copy the contents of the current "images" folder to the destination
        xcopy /e /i /q "%%D" "%destination%!relPath!"
    )
)

@echo Done.
