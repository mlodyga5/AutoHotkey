#Include InitialSetup.ahk

#SingleInstance Force
#NoEnv
SendMode Input
SetTitleMatchMode 2

;******************************************************************************
; This is a random selection of utilities. All are activated by holding 
; "Application Key" (left of right Ctrl) and pressing some other key. 
; Some of them have a second function activated by holding Shift at the 
; same time. Hopefully you will find some of the useful. Feel free to 
; modify, reuse or share any of this.
;
; CapsLock plus - Result
;
;x          Tab - Inserts a tab.
;                For use when pressing tab would change the focus.
;x           F1 - Shows the AutoHotkey help file.
;x            [ - Launch (run) a script selected in explorer.
;                For use when .ahk is not associated with AutoHotkey.
;x            ] - Reloads this script.
;                If the active window is this script, it will be saved first.
;x            Z - Makes the active window 50% transpartent.
;x      SHIFT Z - Makes the active window opaque again.
;x            V - Clipboard history
;x            X - Shows a custom shutdown menu. Press a letter to select from:
;                Shutdown, Restart, Log Off, Hibernate or Powersave (suspend).

;******************************************************************************

CapsLock & tab::
PutText("`t")
Return

!F1::
IfWinExist AutoHotkey Help
   WinActivate AutoHotkey Help
Else
{
   SplitPath A_AhkPath, , TempText
   Run %TempText%\AutoHotkey.chm
}
Return

CapsLock & [::
TempText := GetText()
If FileExist(TempText)
   Run %A_AhkPath% "%TempText%"
Else
   MsgBox Before using this command, select the .ahk file you wish to run in windows explorer.
Return

CapsLock & ]::
KeyWait AppsKey
IfWinActive %A_ScriptName%
   Send ^s ;Save
Reload
Return

CapsLock & z::
If NOT IsWindow(WinExist("A"))
   Return
If GetKeyState("shift")
   Winset, Transparent, OFF, A
else
   Winset, Transparent, 128, A
Return

CapsLock & v:: #v

CapsLock & x::
SplashImage, , MC01, (S) Shutdown`n(R) Restart`n(L) Log Off`n(H) Hibernate`n(P) Power Saving Mode`n`nPress ESC to cancel., Press A Key:, Shutdown?, Courier New
Input TempText, L1
SplashImage, Off
If (TempText = "S")
   ShutDown 8
Else If (TempText = "R")
   ShutDown 2
Else If (TempText = "L")
   ShutDown 0
Else If (TempText = "H")
   DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Else If (TempText = "P")
   DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
Return

;******************************************************************************
; Handy function.
; Copies the selected text to a variable while preserving the clipboard.
GetText(ByRef MyText = "")
{
   SavedClip := ClipboardAll
   Clipboard =
   Send ^c
   ClipWait 0.5
   If ERRORLEVEL
   {
      Clipboard := SavedClip
      MyText =
      Return
   }
   MyText := Clipboard
   Clipboard := SavedClip
   Return MyText
}

; Pastes text from a variable while preserving the clipboard.
PutText(MyText)
{
   SavedClip := ClipboardAll 
   Clipboard =              ; For better compatability
   Sleep 20                 ; with Clipboard History
   Clipboard := MyText
   Send ^v
   Sleep 100
   Clipboard := SavedClip
   Return
}

;This checks if a window is, in fact a window.
;As opposed to the desktop or a menu, etc.
IsWindow(hwnd) 
{
   WinGet, s, Style, ahk_id %hwnd% 
   return s & 0xC00000 ? (s & 0x80000000 ? 0 : 1) : 0
   ;WS_CAPTION AND !WS_POPUP(for tooltips etc) 
}