WinGetPos(&x,&y,&w,&h,"ahk_exe firefox.exe")
MsgBox(x "," y " " w "," h "`n-4,-4 2568,1441")

WinSetStyle("^0x40000","ahk_exe firefox.exe")
;WinSetStyle("^0xC00000","ahk_exe firefox.exe")
WinMove(-4,-4,A_ScreenWidth+8,A_ScreenHeight+1,"ahk_exe firefox.exe")

WinGetPos(&x,&y,&w,&h,"ahk_exe firefox.exe")
MsgBox(x "," y " " w "," h "`n-4,-4 2568,1441")