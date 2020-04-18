#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

Loop *
{
	if (A_LoopFileName != "_RunAll.ahk")
	{
		exeName := StrReplace(A_LoopFileName, "lnk", "exe")
		Process, Exist, %exeName%
		
    	If Not ErrorLevel ; errorlevel will = 0 if process doesn't exist
			Run %A_AhkPath% %A_LoopFileName%
	}
}

ExitApp