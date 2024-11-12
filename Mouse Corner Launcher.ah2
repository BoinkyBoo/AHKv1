#Requires AutoHotkey 2.0+                                  ;Needs v2+
#SingleInstance Force                                      ;Run only one instance
CoordMode("Mouse")                                         ;Mouse Coords to Screen
SetTimer(MouseCheck,250)                                   ;Run MouseCheck every 250ms
    
MouseCheck(){                                              ;Main Func (every 50ms)
  Static ox:=-1,oy:=-1                                     ;  Remember values of ox|oy
  MouseGetPos(&mx,&my)                                     ;  Get Mouse Coords
  If (mx=ox) && (my=oy)                                    ;  If Coords NOT changed
    Return                                                 ;    Stop right here
  If (mx=0) && (my=0){                                     ;  If Coords=Top Left
    Run("Notepad")                                         ;    Run Notepad    <- Change
  }Else If (mx=A_ScreenWidth-1) && (my=0){                 ;  If Coords=Top Right
    Run("Calc")                                            ;    Run Calc       <- Change
  }Else If (mx=0) && (my=A_ScreenHeight-1){                ;  If Coords=Bottom Left 
    Run("C:\Users\" A_UserName "\Documents\")              ;    Open Documents <- Change
  }Else If (mx=A_ScreenWidth-1) && (my=A_ScreenHeight-1){  ;  If Coords=Bottom Right
    Run("https:\\www.reddit.com\new\")                     ;    Open Reddit    <- Change
  }                                                        ;  End If block
  ox:=mx,oy:=my                                            ;  Remember last Coords
}                                                          ;End Func block