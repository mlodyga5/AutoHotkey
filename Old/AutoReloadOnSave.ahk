#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon

; Add any window containing this script's name to the group ThisScript
; This is used in the Auto-reload on save function
GroupAdd, ThisScript, %A_ScriptName%		

; ---------------------------------
; Auto-reload on save
; ---------------------------------

; Reloads script if active window is the script editor
; Reloads on Ctrl-S in the editor window

#IfWinActive ahk_group ThisScript
~^s::
	Sleep, 2000
	Reload
return
#IfWinActive		