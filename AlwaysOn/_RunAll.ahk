#Include _InitialSetup.ahk

Loop *.ahk
{
	if (A_LoopFileName != "_RunAll.ahk")
	{
		Run %A_LoopFileName%
	}
}

ExitApp