#Include AlwaysOn\InitialSetup.ahk

programsToRun := []

; if Process, Exist, firefox.exe
   Process, Close, firefox.exe
; if Process, Exist, firefox.exe
    Process, Close, firefox.exe

Loop *.ahk
{
	if (A_LoopFileName != "_RunAll.ahk")
	{
		Run %A_LoopFileName%
	}
}

programsToRun.Push(["Outlook.exe"])
programsToRun.Push(["Teams.exe"])
programsToRun.Push(["Code.exe", "C:\Wszystko\AutoHotkey\Shortcuts\Code"])
programsToRun.Push(["Ssms.exe", "C:\Wszystko\AutoHotkey\Shortcuts\Code"])
programsToRun.Push(["rider64.exe", "C:\Xelion\PlatformaXelion\Itm.Xelion.Platforma.sln"])
programsToRun.Push(["YouTube Music Desktop App.exe"])
; programsToRun.Push(["firefox.exe"])
programsToRun.Push(["explorer.exe"])

for index, program in programsToRun {
    OpenIfNotOpen(program)
}

OpenIfNotOpen(program) {
    Process, Exist, program[1]

    If Not ErrorLevel ; errorlevel will = 0 if process doesn't exist
        processNam = % program[1]
        MsgBox, %processNam%
        if program[2] = ""
            program[2] := program[1]

        ; MsgBox, % program[2]

        Run, % program[2]
}

riderPath = rider64.exe
platformaPath = C:\Xelion\PlatformaXelion\Itm.Xelion.Platforma.sln
Process, Exist, %riderPath%

    If Not ErrorLevel ; errorlevel will = 0 if process doesn't exist
        Run, %platformaPath%

; IfWinNotExist, ahk_class Notepad

; 	Run, Notepad.exe