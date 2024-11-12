#Requires AutoHotkey 2.0+
#SingleInstance Force

Fn:=RealFn.Bind(1)   ; Bind first parameter only
Fn(2)                ; Shows "1, 2"
Fn.Call(3)           ; Shows "1, 3"

Fn:=RealFn.Bind(,1)  ; Bind second parameter only
Fn(2)                ; Shows "2, 1"
Fn.Call(3)           ; Shows "3, 1"
Fn(,4)               ; Error: 'a' was omitted

RealFn(a,b,c:="c"){
  MsgBox a "," b
}