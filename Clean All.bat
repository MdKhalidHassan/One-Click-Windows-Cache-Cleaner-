@echo off
:: -----------------------------
:: Windows Full Cache Cleaner
:: Prefetch, Temp, %Temp%, Cleanmgr
:: -----------------------------

echo ===== Cleaning Prefetch =====
del /s /q C:\Windows\Prefetch\*.* >nul 2>&1

echo ===== Cleaning TEMP Folder =====
del /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1

echo ===== Cleaning %TEMP% Folder =====
del /s /q "%temp%\*.*" >nul 2>&1

echo ===== Running Disk Cleanup =====
cleanmgr /sagerun:99

echo Done! All cache and junk have been cleaned.
pause
