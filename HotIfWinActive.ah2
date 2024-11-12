HotIfWinActive("ahk_exe Notepad.exe") ;("ahk_exe Anno1800.exe")
Loop 4
  Hotkey("*^" A_Index,HK1 => Send("^{F" (SubStr(A_ThisHotkey,3,1)+4) "}"))
Loop 10
  Hotkey("*+" A_Index-1,HK2 => Send("^" SubStr(A_ThisHotkey,3,1)))
HotIf

/*
HotIfWinActive("ahk_exe Notepad.exe") ;("ahk_exe Anno1800.exe")
Loop 4
  Hotkey("*^" A_Index,HK1)
Loop 10
  Hotkey("*+" A_Index-1,HK2)
HotIf

HK1(HK){
  Send("^{F" (SubStr(A_ThisHotkey,3,1)+4) "}")
}

HK2(HK){
  Send("^" SubStr(A_ThisHotkey,3,1))
}
*/