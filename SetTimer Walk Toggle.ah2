#Requires AutoHotkey 2.0+           ;Needs v2
#SingleInstance Force               ;Run only one
CoordMode "ToolTip"                 ;!For testing!

F1::Walk(1)                         ;Hotkey sends '1' to Walk() (A Toggle!)

Walk(Opt:=0){                       ;Main Function/Loop (Default 'Opt' is '0')
  Static Tog:=0,Step:=0             ;  Store 'Tog' and 'Step' values between calls/loops
  If Opt                            ;  If 'Opt' was set to '1' (From pressing 'F1')
    Tog:=!Tog                       ;    Flip 'Tog' between 'False/0' and 'True/1'
  If Tog{                           ;  If Tog (is 'True/1')
    Step:=!Step                     ;    Flip 'Step' 
    If Step{                        ;    If 'Step' (is 'True/1')
      Send("{Blind}{w Down}")       ;      Hold 'w' (ignore held modifiers)
      SetTimer(%A_ThisFunc%,-5000)  ;      Restart Walk() in 5s
    }Else{                          ;    Otherwise
      Send("{Blind}{w Up}")         ;      Release 'w' (ignore held modifiers)
      SetTimer(%A_ThisFunc%,-2000)  ;      Restart Walk() in 2s
    }                               ;    End If block for 'Step'
  }Else{                            ;  Otherwise ('Tog' is 'False/0')
    SetTimer(%A_ThisFunc%,0)        ;    Stop the loop
    Send("{Blind}{w Up}")           ;    Release 'w' if held
    Step:=0                         ;    Reset 'Step' to '0'
  }                                 ;  End If block for 'Tog'

  TT:="Toggle:`t" (Tog?"On":"Off")  ;!For testing!
  . "`nW Dn:`t" GetKeyState("w")    ;!For testing!
  . "`nStep #:`t" Step              ;!For testing!
  ToolTip(TT,0,A_ScreenHeight,20)   ;!For testing!
}                                   ;End Func block

/* #####  Simplified  #####
#Requires AutoHotkey 2.0+
#SingleInstance Force

F1::Walk(1)

Walk(Opt:=0){
  Static Tog:=0,Step:=0
  If (Tog:=Opt?!Tog:Tog){
    If (Step:=!Step){
      Send("{Blind}{w Down}")
      SetTimer(%A_ThisFunc%,-5000)
    }Else{
      Send("{Blind}{w Up}")
      SetTimer(%A_ThisFunc%,-2000)
    }
  }Else{
    SetTimer(%A_ThisFunc%,0)
    Send("{Blind}{w Up}")
    Step:=0
  }
}
*/

/* #####  More Steps  #####
#Requires AutoHotkey 2.0+             ;Needs v2
#SingleInstance Force                 ;Run only one
CoordMode "ToolTip"                   ;!For testing!

F1::Walk(1)                           ;Hotkey sends '1' to Walk() (A Toggle!)

Walk(Opt:=0){                         ;Main Function/Loop (Default 'Opt' is '0')
  Static Tog:=0,Step:=0               ;  Store 'Tog' and 'Step' values between calls/loops
  If Opt                              ;  If 'Opt' was set to '1' (From pressing 'F1')
    Tog:=!Tog                         ;    Flip 'Tog' between 'False/0' and 'True/1'
  If Tog{                             ;  If Tog (is 'True/1')
    Switch Step{                      ;    Run one of these depending on what 'Step' is
      Case 0:                         ;      If Step is '0'
        Send("{Blind}{w Down}")       ;        Hold 'w' (ignore held modifiers)
        SetTimer(%A_ThisFunc%,-5000)  ;        Restart Walk() in 5s
      Case 1:                         ;      If Step is '1'
        Send("{Blind}{w Up}")         ;        Release 'w' (ignore held modifiers)
        SetTimer(%A_ThisFunc%,-2000)  ;        Restart Walk() in 2s
      Case 2:                         ;      If Step is '2'
        Send("{Blind}{s Down}")       ;        Hold 's' (ignore held modifiers)
        SetTimer(%A_ThisFunc%,-5000)  ;        Restart Walk() in 5s
      Case 3:                         ;      If Step is '3'
        Send("{Blind}{s Up}")         ;        Release 'w' (ignore held modifiers)
        SetTimer(%A_ThisFunc%,-2000)  ;        Restart Walk() in 2s
    }                                 ;    End Switch block
    Step++                            ;    Increment 'Step' by '1'
    If (Step>3)                       ;    If 'Step' is out of range
      Step:=0                         ;      Reset 'Step' to '0'
  }Else{                              ;  Otherwise ('Tog' is 'False/0')
    SetTimer(%A_ThisFunc%,0)          ;    Stop the loop
    Send("{Blind}{w Up}{s Up}")       ;    Release 'w/s' if held
    Step:=0                           ;    Reset 'Step' to '0'
  }                                   ;  End If block for 'Tog'

  TT:="Toggle:`t" (Tog?"On":"Off")    ;!For testing!
  . "`nW Dn:`t" GetKeyState("w")      ;!For testing!
  . "`nS Dn:`t" GetKeyState("s")      ;!For testing!
  . "`nStep #:`t" Step                ;!For testing!
  ToolTip(TT,0,A_ScreenHeight,20)     ;!For testing!
}                                     ;End Func block
*/

/* #####  Simplified  #####
#Requires AutoHotkey 2.0+
#SingleInstance Force

F1::Walk(1)

Walk(Opt:=0){
  Static Tog:=0,Step:=0
  If (Tog:=Opt?!Tog:Tog){
    Switch Step{
      Case 0:
        Send("{Blind}{w Down}")
        SetTimer(%A_ThisFunc%,-5000)
      Case 1:
        Send("{Blind}{w Up}")
        SetTimer(%A_ThisFunc%,-2000)
      Case 2:
        Send("{Blind}{s Down}")
        SetTimer(%A_ThisFunc%,-5000)
      Case 3:
        Send("{Blind}{s Up}")
        SetTimer(%A_ThisFunc%,-2000)
    }
    Step:=(++Step>3)?0:Step
  }Else{
    SetTimer(%A_ThisFunc%,0)
    Send("{Blind}{w Up}{s Up}")
    Step:=0
  }
}
*/