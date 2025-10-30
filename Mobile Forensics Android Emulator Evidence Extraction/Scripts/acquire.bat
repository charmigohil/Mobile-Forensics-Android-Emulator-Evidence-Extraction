@echo off
set OUT=%CD%\Acquisition
mkdir "%OUT%\sms" "%OUT%\gmail" >nul

:: 1. make sure adbd is running as root
adb root
adb remount

:: 2. pull only the two packages we care about
echo === Pulling SMS database ===
adb pull /data/data/com.android.providers.telephony/databases/mmssms.db "%OUT%\sms"
echo === Pulling Gmail database ===
adb pull /data/data/com.google.android.gm/databases/peopleCache_fakeone8008@gmail.com.com.google.android.gm_11.db "%XOUT%\gmail\"

:: 3. quick screenshot for context
echo === Grabbing screen ===
adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png "%OUT%\screen.png"

echo === Done. Check %OUT% ===
pause