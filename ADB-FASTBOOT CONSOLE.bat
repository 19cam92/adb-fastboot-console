@echo off
title ADB/FASTBOOT Console

ECHO Starting ADB
files\adb start-server


:RESTART
cls
ECHO *******************************************
ECHO *          Made By 19cam92@xda            *
ECHO *              Version 1.0.0             *
ECHO *******************************************
ECHO * 1.  ADB Options                         * 
ECHO * 2.  Fastboot Options                    *
ECHO * 3.  Debugging Options                   *
ECHO * 4.  Reboot Options                      *
ECHO * 5.  Erase Options                       *
ECHO * 6.  Bootloader Options                  *
ECHO * 7.  Backup and Restore                  *
ECHO *******************************************
ECHO *******************************************
ECHO * 00.    Exit And Kill ADB                *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto ADBOPTIONS)
IF %menunr%==2 (goto FASTBOOTOPTIONS)
IF %menunr%==3 (goto BEBUGGINGOPTIONS)
IF %menunr%==4 (goto REBOOTOPTIONS)
IF %menunr%==5 (goto ERASEOPTIONS)
IF %menunr%==6 (goto BOOTLOADEROPTIONS)
IF %menunr%==7 (goto BACKUPANDRESTOREOPTIONS)
IF %menunr%==8 (goto DEVELOPEROPTIONS)

IF %menunr%==0 (goto OUT)
IF %menunr%==00 (goto OUTKILLADB)
IF %menunr%==000 (goto REFRESH)

:OUTKILLADB
cls
ECHO Stoping ADB
files\adb kill-server
exit

:OUT
cls
ECHO Good Bye
exit

:REFRESH
cls
ECHO Refreshing
goto RESTART

:ADBOPTIONS
cls
ECHO *******************************************
ECHO *               ADB OPTIONS               *
ECHO *******************************************
ECHO * 1.  Start ADB                           *
ECHO * 2.  Restart ADB                         *
ECHO * 3.  Kill ADB                            *
ECHO * 4.  List ADB Devices                    *
ECHO * 5.  Enter ADB Command                   *
ECHO * 6.  Enter ADB Shell Command             *
ECHO * 7.  ADB Root                            *
ECHO * 8.  Remount System                      *
ECHO * 9.  Get Device State                    *
ECHO * 10. Devices Serial Number               *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto STARTADB)
IF %menunr%==2 (goto ADBRESTART)
IF %menunr%==3 (goto KILLADB)
IF %menunr%==4 (goto ADBDEVICES)
IF %menunr%==5 (goto ADBCONSOLE)
IF %menunr%==6 (goto ADBSHELL)
IF %menunr%==7 (goto ADBROOT)
IF %menunr%==8 (goto ADBREMOUNT)
IF %menunr%==9 (goto GETDEVICESTATE)
IF %menunr%==10 (goto DEVICESSERIALNUMBER)
IF %menunr%==0 (goto RESTART)
goto RESTART

:STARTADB
cls
ECHO Starting ADB
files\adb start-server
cls
goto ADBOPTIONS

:ADBRESTART
cls
ECHO Restarting ADB
files\adb kill-server
files\adb start-server
cls
goto ADBOPTIONS

:KILLADB
cls
ECHO Killing ADB
files\adb kill-server
cls
goto ADBOPTIONS

:ADBDEVICES
cls
files\adb devices
pause
cls
goto ADBOPTIONS

:ADBCONSOLE
cls
echo Enter Command Next To adb
set /p adb_command=adb 
echo.
files\adb %adb_command%
echo.
pause
cls
goto ADBOPTIONS

:ADBSHELL
cls
ECHO Enter Shell Command
ECHO TYPE EXIT FOR MAIN MENU
files\adb shell
pause
cls
goto ADBOPTIONS

:ADBROOT
cls
ECHO ADB Root
files\adb root
pause
cls
goto ADBOPTIONS

:ADBREMOUNT
cls
ECHO Remount System
files\adb remount
pause
cls
goto ADBOPTIONS

:GETDEVICESTATE
cls
ECHO Getting devices state
files\adb get-state
pause
cls
goto ADBOPTIONS

:DEVICESSERIALNUMBER
cls
ECHO Getting devices serialno
files\adb get-serialno
pause
cls
goto ADBOPTIONS


:FASTBOOTOPTIONS
cls
ECHO *******************************************
ECHO *            FASTBOOT OPTIONS             *
ECHO *******************************************
ECHO * 1.  List FASTBOOT Devices               *
ECHO * 2.  Enter FASTBOOT Command              *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto FASTBOOTDEVICES)
IF %menunr%==2 (goto FASTBOOTCONSOLE)
IF %menunr%==0 (goto RESTART)

:FASTBOOTDEVICES
cls
ECHO List of devices attached
files\fastboot devices
pause
cls
goto FASTBOOTOPTIONS

:FASTBOOTCONSOLE
cls
echo Enter Command Next To fastboot
set /p fastboot_command=fastboot 
echo.
files\fastboot %fastboot_command%
echo.
pause
cls
goto FASTBOOTOPTIONS

:BEBUGGINGOPTIONS
cls
ECHO *******************************************
ECHO *           DEBUGGING OPTIONS             *
ECHO *******************************************
ECHO * 1.  Logcat                              *
ECHO * 2.  Last KMSG                           *
ECHO * 3.  Bugreport                           *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto LOGCAT)
IF %menunr%==2 (goto LASTKMSG)
IF %menunr%==3 (goto BUGREPORT)
IF %menunr%==0 (goto RESTART)

:LOGCAT
cls
echo Dumping Logcat to logcat.txt
files\adb logcat -dv long > logcat/logcat.txt
pause
cls
goto DEBUGGINGOPTIONS

:LASTKMSG
cls
echo Dumping last_kmsg to sdcard
files\adb pull /proc/last_kmsg last_kmsg/last_kmsg.txt
pause
cls
goto DEBUGGINGOPTIONS

:BUGREPORT
cls
echo Bugreport
files\adb bugreport
pause
cls
goto DEBUGGINGOPTIONS


:REBOOTOPTIONS
cls
ECHO *******************************************
ECHO *             REBOOT OPTIONS              *
ECHO *******************************************
ECHO * 1.  Reboot Phone(via ADB)               *
ECHO * 2.  Reboot Phone(via FASTBOOT)          *
ECHO * 3.  Hotboot(via ADB)                    *
ECHO * 4.  Reboot Bootloader(via ADB)          *
ECHO * 5.  Reboot Bootloader(via FASTBOOT)     *
ECHO * 6.  Reboot Recovery(via ADB)            *
ECHO * 7.  Shutdown(via ADB)                   *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto REBOOTviaADB)
IF %menunr%==2 (goto REBOOTviaFASTBOOT)
IF %menunr%==3 (goto HOTBOOTviaADB)
IF %menunr%==4 (goto REBOOTBOOTLOADERviaADB)
IF %menunr%==5 (goto REBOOTBOOTLOADERviaFASTBOOT)
IF %menunr%==6 (goto REBOOTRECOVERYviaADB)
IF %menunr%==7 (goto SHUTDOWNviaADB)
IF %menunr%==0 (goto RESTART)

:REBOOTviaADB
cls
ECHO Rebooting
files\adb reboot
cls
goto REBOOTOPTIONS

:REBOOTviaFASTBOOT
cls
ECHO Rebooting
files\fastboot reboot
cls
goto REBOOTOPTIONS

:HOTBOOTviaADB
cls
ECHO Hotbooting
files\adb shell busybox killall system_server
cls
goto REBOOTOPTIONS

:REBOOTBOOTLOADERviaADB
cls
ECHO Rebooting Bootloader
files\adb reboot-bootloader
cls
goto REBOOTOPTIONS

:REBOOTBOOTLOADERviaFASTBOOT
cls
ECHO Rebooting Bootloader
files\fastboot reboot-bootloader
cls
goto REBOOTOPTIONS

:REBOOTRECOVERYviaADB
cls
ECHO Rebooting Recovery
files\adb shell reboot recovery
cls
goto REBOOTOPTIONS

:SHUTDOWNviaADB
cls
ECHO Rebooting Recovery
files\adb shell reboot -p
cls
goto REBOOTOPTIONS


:ERASEOPTIONS
cls
ECHO *******************************************
ECHO *    ERASE OPTIONS (DELETE'S ALL DATA)    *
ECHO *******************************************
ECHO * 1.  ERASE Boot(via FASTBOOT)            *
ECHO * 2.  ERASE Cache(via FASTBOOT)           *
ECHO * 3.  ERASE Recovery(via FASTBOOT)        *
ECHO * 4.  ERASE Userdata(via FASTBOOT)        *
ECHO * 5.  ERASE System(via FASTBOOT)          *
ECHO * 6.  ERASE ALL(via FASTBOOT)             *
ECHO * 7.  ERASE BATTERY STATS(via ADB)        *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto ERASEBootviaFASTBOOT)
IF %menunr%==2 (goto ERASECacheviaFASTBOOT)
IF %menunr%==3 (goto ERASERecoveryviaFASTBOOT)
IF %menunr%==4 (goto ERASEUserdataviaFASTBOOT)
IF %menunr%==5 (goto ERASESystemviaFASTBOOT)
IF %menunr%==6 (goto ERASEAllviaFASTBOOT)
IF %menunr%==7 (goto ERASEBatteryStatsviaADB)
IF %menunr%==0 (goto RESTART)

:ERASEBootviaFASTBOOT
cls
ECHO Formating Boot
files\fastboot erase  boot
pause
cls
goto ERASEOPTIONS

:ERASECacheviaFASTBOOT
cls
ECHO Formating Cache
files\fastboot erase  cache
pause
cls
goto ERASEOPTIONS

:ERASERecoveryviaFASTBOOT
cls
ECHO Formating Recovery
files\fastboot erase  recovery
pause
cls
goto ERASEOPTIONS

:ERASEUserdataviaFASTBOOT
cls
ECHO Formating Userdata
files\fastboot erase  userdata
pause
cls
goto ERASEOPTIONS

:ERASESystemviaFASTBOOT
cls
ECHO Formating System
files\fastboot erase  system
pause
cls
goto ERASEOPTIONS

:ERASEAllviaFASTBOOT
cls
ECHO Formating All
files\fastboot erase  boot
files\fastboot erase  cache
files\fastboot erase  recovery
files\fastboot erase  userdata
files\fastboot erase  system
pause
cls
goto ERASEOPTIONS

:ERASEBatteryStatsviaADB
cls
ECHO Wiping Battery Stats
files\adb shell busybox rm /data/system/batterystats.bin
pause
cls
goto ERASEOPTIONS


:BOOTLOADEROPTIONS
cls
ECHO *******************************************
ECHO *           BOOTLOADER OPTIONS            *
ECHO *******************************************
ECHO *           NEXUS DEVICES ONLY            *
ECHO *******************************************
ECHO * 1.  Lock Bootloader                     *
ECHO * 2.  Unlock Bootloader(DELETE'S ALL DATA)*
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto LockBootloaderviaFASTBOOT)
IF %menunr%==2 (goto UnlockBootloaderviaFASTBOOT)
IF %menunr%==0 (goto RESTART)
.
:LockBootloaderviaFASTBOOT
cls
ECHO Locking Bootloader
files\adb reboot-bootloader
files\fastboot oem lock
pause
cls
goto BOOTLOADEROPTIONS

:UnlockBootloaderviaFASTBOOT
cls
ECHO Unlocking Bootloader
files\adb reboot-bootloader
files\fastboot oem unlock
pause
cls
goto BOOTLOADEROPTIONS


:BACKUPANDRESTOREOPTIONS
cls
ECHO *******************************************
ECHO *       BACKUP AND RESTORE OPTIONS        *
ECHO *******************************************
ECHO * 1.  Backup                              *
ECHO * 2.  Restore                             *
ECHO *******************************************
ECHO *******************************************
ECHO * 0.  Return to Main Menu                 *
ECHO *******************************************

SET /P menunr=Please make your decision:
IF %menunr%==1 (goto BACKUP)
IF %menunr%==2 (goto RESTORE)
IF %menunr%==0 (goto RESTART)
.
:BACKUP
cls
ECHO Backing Up
files\adb backup -apk -shared -all /backups/backup.ab
pause
cls
goto BACKUPANDRESTOREOPTIONS

:RESTORE
cls
ECHO Restoring
files\adb restore backup.ab
pause
cls
goto BACKUPANDRESTOREOPTIONS
