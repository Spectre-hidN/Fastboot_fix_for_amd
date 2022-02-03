@echo off

echo [38;5;81mRegistry Hack to detect Xiaomi devices in fastboot mode on AMD series processors.[0m
echo Make sure latest stable ADB and fastboot drivers are already installed. (Get it from here --^> https://bit.ly/3giKtZJ)
echo [38;5;190mAdministravite Permissions required to modify registry![0m
echo[
echo [PRESS ENTER TO START]
pause >nul 2>&1
if [%1] == [--skip-backup] (
	GOTO Add_reg
) else (
	GOTO backup_hklm
)

:Add_reg
	
	echo[
	echo [38;5;135mApplying Reg hacks...[0m
	timeout 2 >nul 2>&1
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "osvc" /t REG_BINARY /d "0000" /f >nul 2>&1
	if %ERRORLEVEL% == 0 (
		echo [38;5;82mSucessfully added [38;5;162m'osvc'[38;5;82m Registry key![0m
	) else (
		echo [38;5;196mError occured while adding 'osvc' key! - Already present or Lack of permissions.[0m
	)
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "SkipContainerIdQuery" /t REG_BINARY /d "01000000" /f >nul 2>&1
	if %ERRORLEVEL% == 0 (
		echo [38;5;82mSucessfully added [38;5;162m'SkipContainerIdQuery'[38;5;82m Registry key![0m
	) else (
		echo [38;5;196mError occured while adding 'SkipContainerIdQuery' key! - Already present or Lack of permissions.[0m
	)
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "SkipBOSDescriptorQuery" /t REG_BINARY /d "01000000" /f >nul 2>&1
	if %ERRORLEVEL% == 0 (
		echo [38;5;82mSucessfully added [38;5;162m'SkipBOSDescriptorQuery'[38;5;82m Registry key![0m
	) else (
		echo [38;5;196mError occured while adding 'SkipBOSDescriptorQuery' key! - Already present or Lack of permissions.[0m
	)
	pause >nul 2>&1
	goto EOF

:backup_hklm
	echo[
	echo [38;5;135mBacking up usbflags registry key...[0m
	timeout 2 >nul 2>&1
	del %~dp0\usbflags_backup.reg >nul 2>&1
	reg export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\ %~dp0\usbflags_backup.reg > nul
	if %errorlevel% == 0 (
		goto Add_reg
	) else (
		echo [38;5;208mError occured during backing up registry keys![0m
		echo [Press Enter] to continue patching keys without backing up else close the terminal.
		pause >nul 2>&1
		goto Add_reg
	)

:EOF
echo[
