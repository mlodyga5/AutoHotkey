; Array := StrSplit(A_ScriptDir, "\")
; Array.RemoveAt(Array.MaxIndex()) ; go up one folder
; InitPath := ""

; for index, elem in Array
;     InitPath .= elem . "\"

; InitPath .= "_InitialSetup.ahk"

ppp := ""
EnvGet, ppp, AutoHotkeyRoot
MsgBox, %ppp%
SetWorkingDir, ppp

#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk