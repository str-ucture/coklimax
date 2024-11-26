@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
    set SPHINXBUILD=sphinx-build
)
set SOURCEDIR="./source"
set BUILDDIR="./docs"

REM Check if sphinx-build is available
%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
    echo.
    echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
    echo.installed, then set the SPHINXBUILD environment variable to point
    echo.to the full path of the 'sphinx-build' executable. Alternatively, you
    echo.may add the Sphinx directory to PATH.
    echo.
    echo.If you don't have Sphinx installed, grab it from
    echo.https://www.sphinx-doc.org/
    exit /b 1
)

REM Handle 'clean' command to remove build directory
if "%1" == "clean" (
    echo Cleaning up build directory...
    rmdir /S /Q %BUILDDIR% >NUL 2>NUL
    mkdir %BUILDDIR%
    echo Build directory cleaned.
    goto end
)

REM Default build action (HTML)
if "%1" == "" goto help
%SPHINXBUILD% -b html %SOURCEDIR% %BUILDDIR%
if errorlevel 1 (
    echo.
    echo.Build failed. Check the output above for details.
    exit /b 1
)

REM Copy images directories from source to build directory
for /d %%I in ("%SOURCEDIR%\*") do (
    if exist "%%I\images" (
        echo Copying images from %%~nxI...
        xcopy /E /I /Y "%%I\images" "%BUILDDIR%\%%~nxI\images"
    )
)

REM Create .nojekyll file inside the build directory to disable Jekyll processing on GitHub Pages
echo. > %BUILDDIR%\.nojekyll

echo.
echo.Build finished. The HTML pages are in %BUILDDIR%.
goto end

REM Help message for invalid commands or no arguments
:help
echo.
echo.Usage: make [clean|html]
echo.
echo.  clean   Remove everything in the build directory
echo.  html    Build the HTML documentation (default action)
echo.

:end
popd
