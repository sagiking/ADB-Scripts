@echo off

:: Set SAVESTAMP variable with a timestamp (date and time)
set SAVESTAMP=%DATE:/=-%@%TIME::=-%
:: Replace spaces in the timestamp with empty strings
set SAVESTAMP=%SAVESTAMP: =%

set /p duration="Enter the recording duration in seconds: "

:: Record the screen on the Android device with the specified duration
adb.exe shell screenrecord --time-limit %duration% /sdcard/%SAVESTAMP%.mp4

:: Pull the recorded video file from the Android device to the local machine
adb.exe pull /sdcard/%SAVESTAMP%.mp4 .\%SAVESTAMP%.mp4

:: Delete the recorded video file from the Android device to free up space
adb.exe shell rm /sdcard/%SAVESTAMP%.mp4

:: To record for an unlimited time, run the script without the --time-limit argument
:: Press CTRL+C when finished recording.
