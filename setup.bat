@echo off
REM Setup script for Insta Wash Uganda Flutter Web App

echo.
echo ====================================
echo Insta Wash Uganda - Setup Script
echo ====================================
echo.

REM Check if Flutter is installed
flutter --version
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter from https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo.
echo Getting dependencies...
call flutter pub get

if %ERRORLEVEL% EQ 0 (
    echo.
    echo ====================================
    echo Setup completed successfully!
    echo ====================================
    echo.
    echo To run the app, use:
    echo   flutter run -d chrome
    echo.
    echo To build for production, use:
    echo   flutter build web --release
    echo.
) else (
    echo.
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

pause
