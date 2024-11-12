#Requires AutoHotkey 2.0+  ;Needs AHK v2
#SingleInstance Force      ;Run only one instance
SetTitleMatchMode 2        ;Match partial window title
YT:="- YouTube — Mozilla Firefox ahk_exe Firefox.exe"

#HotIf WinExist(YT)
Media_Prev::ControlSend("{Left}",,YT)   ;Back 5s   (Prev)
Media_Next::ControlSend("{Right}",,YT)  ;Fwd 5s    (Next)
+Media_Prev::ControlSend("j",,YT)       ;Back 10s  (Shift+Prev)
+Media_Next::ControlSend("l",,YT)       ;Fwd 10s   (Shift+Next)
#HotIf