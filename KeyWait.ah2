#Requires AutoHotkey 2.0+  ;Needs AHK v2+
#SingleInstance Force      ;Run only one instance of the script

*CapsLock::{                                       ;Hotkey to press
  If KeyWait("CapsLock","T.2")                     ;  Test if CL is held longer than 200ms
    Send("{Esc}")                                  ;    Send 'Esc'
  Else                                             ;  Otherwise
    SetCapsLockState !GetKeyState("CapsLock","T")  ;    Flip CL state
  KeyWait("CapsLock")                              ;  Don't retrigger on key 'Up'
}                                                  ;End Hotkey block

*Shift::{                      ;Shift to trigger
  If KeyWait("Shift","T.2")    ;  See if held for 200ms
    Send("{Space}")            ;    Tap 'Space' if not
  Else                         ;  Otherwise
    Send("{Shift Down}")       ;    Hold 'Shift'
  KeyWait("Shift")             ;  Wait for release
}                              ;End Hotkey block
*Shift Up::Send("{Shift Up}")  ;Release 'Shift'