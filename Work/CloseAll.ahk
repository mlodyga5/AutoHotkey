#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

Process, Close, rider64.exe
Process, Close, rider64.exe
Loop Shortcuts\*.lnk
{
	if (A_LoopFileName != "Code.lnk")
		exeName := StrReplace(A_LoopFileName, "lnk", "exe")
		Process, Close, %exeName%
}

sleep 5000
Process, Close, Teams.exe

ExitApp