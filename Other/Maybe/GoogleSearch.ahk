#Include InitialSetup.ahk

#g::    ; <-- Google Web Search Using Highlighted Text (Win+G)
   Search := 1
   Gosub Google
return

^#g::    ; <-- Google Image Search Using Highlighted Text (Win+Ctrl+G)
   Search := 2
   Gosub Google
return

!#g::    ; <-- Google Map Search Using Highlighted Text (Win+Alt+G)
   Search := 3
   Gosub Google
return

Google:
   Save_Clipboard := ClipboardAll
   Clipboard := ""
   Send ^c
   ClipWait, .5
   if !ErrorLevel
      Query := Clipboard
   else
      InputBox, Query, Google Search, , , 200, 100, , , , , %Query%
   Query := UriEncode(Trim(Query))
   if (Search = 1)
      Address := "http://www.google.com/search?hl=en&q=" Query ; Web Search
   else if (Search = 2)
      Address := "http://www.google.com/search?site=imghp&tbm=isch&q=" Query ; Image Search
   else
      Address := "http://www.google.com/maps/search/" Query ; Map Search
      Run, chrome.exe %Address%  ; Change this if require different browser search
   Clipboard := Save_Clipboard
   Save_Clipboard := ""
return


UriEncode(Uri)
{
   VarSetCapacity(Var, StrPut(Uri, "UTF-8"), 0)
   StrPut(Uri, &Var, "UTF-8")
   f := A_FormatInteger
   Res := ""
   SetFormat, IntegerFast, H
   While Code := NumGet(Var, A_Index - 1, "UChar")
      If (Code >= 0x30 && Code <= 0x39 ; 0-9
         || Code >= 0x41 && Code <= 0x5A ; A-Z
         || Code >= 0x61 && Code <= 0x7A) ; a-z
         Res .= Chr(Code)
      Else
         Res .= "%" . SubStr(Code + 0x100, -1)
   SetFormat, IntegerFast, %f%
   Return, Res
}
return

 ; Google Search select text - Ctrl + Shift + C
;  ^+c::
;  {
;   Send, ^c
;   Sleep 50
;   Run, http://www.google.com/search?q=%clipboard%
;   Return
;  }
; return