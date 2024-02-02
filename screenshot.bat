@echo off

:: Set SAVESTAMP variable with a timestamp (date and time)
set SAVESTAMP=%DATE:/=-%@%TIME::=-%
:: Replace spaces in the timestamp with empty strings
set SAVESTAMP=%SAVESTAMP: =%

:: Take a screenshot on the Android device and save it to the specified path
adb.exe shell screencap -p /sdcard/%SAVESTAMP%.png

:: Pull the screenshot file from the Android device to the local machine
adb.exe pull /sdcard/%SAVESTAMP%.png .\%SAVESTAMP%.png

:: Delete the screenshot file from the Android device to free up space
adb.exe shell rm /sdcard/%SAVESTAMP%.png
