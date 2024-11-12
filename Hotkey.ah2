#Requires AutoHotkey 2.0+
#SingleInstance Force
K:=1

Hotkey "Numpad" K,Fired

Fired(ThisHotkey){
  MsgBox ThisHotkey
}