#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon

; ---------------------------------
; Enclose in quotes
; ---------------------------------

^'::EncQuote("'")
^+'::EncQuote("""")

; Enclose selected text in quotation mark
EncQuote(q)
{
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, Enclose in quote, Nothing copied - aborting
	SetTimer, RemoveTrayTip, 2000
  }
  else
  {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}