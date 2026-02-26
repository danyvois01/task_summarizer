@echo off
title Task Summarizer
echo ============================================================
echo Starting Team Activity Summarizer...
echo ============================================================

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in your PATH.
    echo Please install Python from https://www.python.org/downloads/
    echo.
    pause
    exit /b
)

REM Run the main script
python src\task_summarizer.py

echo.
pause
