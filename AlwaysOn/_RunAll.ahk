#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

Loop *.ahk
{
	if (A_LoopFileName != "_RunAll.ahk")
	{
		Run %A_AhkPath% %A_LoopFileName%
	}
}

ExitApp