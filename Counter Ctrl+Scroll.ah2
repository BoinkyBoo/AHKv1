#Requires AutoHotkey 2.0.3+
#SingleInstance Force

#HotIf GetKeyState("Ctrl","P")
*WheelUp::NumVar(1)
*WheelDown::NumVar(-1)
#HotIf

NumVar(Val){
  Static NumVar:=0
  NumVar+=Val
  If (NumVar>9)
    NumVar:=0
  Else If (NumVar<0)
    NumVar:=9
  SendInput (NumVar)
}

End::ExitApp
