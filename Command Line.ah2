;###  Script 1  ###
Run('AutoHotkey "Script 2.ah2" "Menu"')
;###  Script 2  ###
If A_Args.Length
  MsgBox(A_Args[1])
Else
  MsgBox("Normal")