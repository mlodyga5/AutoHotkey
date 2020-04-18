#Include C:\Wszystko\AutoHotkey\_InitialSetup.ahk

Process, Close, VpnGui.exe
sleep 1000
Run VpnGui
sleep 6000

SetTitleMatchMode, 2 ; contains
if (WinExist("VPN")) {
    WinActivate, VPN
    Send {Enter}
    sleep 100
    WinActivate, VPN
    Send Waznekonto20
    Send {Enter}
}

; ExitApp