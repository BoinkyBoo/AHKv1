#Requires AutoHotkey 2.0+
#SingleInstance Force

MsgBox A_Clipboard:=RegExReplace(A_Clipboard,"\r?\n"," ")
Dat:=""
Loop Parse A_Clipboard," "
  Dat.=Chr("0x" A_LoopField)
MsgBox Dat