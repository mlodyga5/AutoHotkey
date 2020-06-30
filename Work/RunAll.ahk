#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

#Include RunVpn.ahk
OpenIfNotAlreadyOpen("rider64.exe", "Platforma")

programsToRun := ["Code", "DBeaver", "FirefoxDev", "Outlook", "Teams"]
for index, program in programsToRun
{
	OpenIfNotAlreadyOpen(program . ".exe", program)
}

OpenIfNotAlreadyOpen(exeName, fileToRun) {
    Process, Exist, %exeName%
	If Not ErrorLevel ; errorlevel will = 0 if process doesn't exist
		Run Shortcuts\%fileToRun%
}

ExitApp