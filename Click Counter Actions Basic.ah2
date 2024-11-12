#Requires AutoHotkey 2.0+            ;Needs AHK v2+
#SingleInstance Force                ;Run only one instance
CoordMode("ToolTip")                 ;Align ToolTips Screen-wide

LButton::{                           ;Trigger key
  Static Counter:=1                  ;  Remember Counter between calls
  If (Counter<4)                     ;  If Counter is less than 4
    Send("{LButton}")                ;    Click
  Else If (Counter=4)                ;  Or, If Counter is 4
    Send("1")                        ;    Send a number
  Else If (Counter=5)                ;  Or, If Counter is 5
    Send("2")                        ;    Send another number
  ToolTip(Counter,0,A_ScreenHeight)  ;  Show the Counter via ToolTip
  Counter++                          ;  Add 1 to Counter
  If (Counter>5)                     ;  If we've gone past 5
    Counter:=1                       ;    Reset it
}                                    ;End Hotkey block
