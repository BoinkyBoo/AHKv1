#Requires AutoHotkey 2.0+
#SingleInstance Force

Swap:=RegRead("HKEY_CURRENT_USER\Control Panel\Mouse","SwapMouseButtons")
MsgBox (Swap?"Right":"Left") " is Primary."