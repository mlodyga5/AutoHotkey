#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

#Include _RunVpn.ahk

programsToRun := ["Code", "DBeaver", "FirefoxDev", "Outlook", "Teams"]
for index, program in programsToRun
{
	OpenIfNotAlreadyOpen(program . ".exe", program)
}

OpenIfNotAlreadyOpen("rider64.exe", "Platforma")

OpenIfNotAlreadyOpen(exeName, fileToRun) {
    Process, Exist, %exeName%
	If Not ErrorLevel ; errorlevel will = 0 if process doesn't exist
		Run %fileToRun%
}

ExitApp