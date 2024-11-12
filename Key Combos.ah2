#Requires AutoHotkey 2.0+        ;Needs AHK v2
#SingleInstance Force            ;Run only on instance

#HotIf GetKeyState("LCtrl","P")  ;Activate hotkey below
  && GetKeyState("LButton","P")  ;  if LCtrl+LMB are held
*RButton::End                    ;Rbutton+Above = End
#HotIf GetKeyState("LCtrl","P")  ;Activate hotkey below
  && GetKeyState("RButton","P")  ;  if LCtrl+RMB are held
*LButton::End                    ;LButton+Above = End
#HotIf                           ;End activation block
