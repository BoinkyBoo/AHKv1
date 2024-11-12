#Requires AutoHotkey 2.0+
#SingleInstance Force
SetTitleMatchMode 2
CoordMode "ToolTip"

NumpadDot::{
  Static fT:=0,oT:=""
  SetTimer t1,(fT:=!fT)?15000:0
  nT:="Running: " (fT?"Yes":"No")
  If (nT!=oT)
    ToolTip(nT,10,A_ScreenHeight-30,20)
  oT:=nT
}
NumpadEnter::t1()

t1(){
  Static Win:="Track Package ahk_exe Firefox.exe"
  If WinExist(Win)
    ControlSend("{F5}",,Win)
}