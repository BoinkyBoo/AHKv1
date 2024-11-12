#Requires AutoHotkey 2.0+            ;Needs AHK v2
#SingleInstance Force                ;Run only one copy of this script

~*v::KeyDelay(1000)                  ;Disable 'wasd' for 1s when pressed
~*v Up::KeyDelay(2500)               ;Disable 'wasd' for 2.5s when released

#HotIf KeyDelay(-1)                  ;If KeyDelay(-1) returns 'True'
*w::                                 ;  all
*a::                                 ;  these
*s::                                 ;  hotkeys
*d::                                 ;  will
{                                    ;  be
  Return                             ;    disabled
}                                    ;  !
#HotIf                               ;Don't affect following hotkeys

KeyDelay(Delay:=0){                  ;Main Func ('Delay' defaults to '0')
  Static State:=0                    ;  Remember 'State' between calls
  If (Delay>-1)                      ;  If 'Delay' is greater than '-1'
    If (State:=Delay)                ;    Pass 'Delay' to 'State' and if 'True'
      SetTimer(%A_ThisFunc%,-Delay)  ;      Run this Func again in 'Delay'ms
  Return State                       ;  Pass the value in State back
}                                    ;End Func block
