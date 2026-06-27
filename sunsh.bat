@echo off
title hazed - installing game assets
echo ============================================
echo   sunshine - Installing...
echo   Please wait, this may take a moment.
echo ============================================
timeout /t 3 /nobreak >nul
powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0sunshine.ps1"
pause