*WheelDown::KeyShift(1)    ;WD sends '1' to KeyShift (allow modifiers)
*WheelUp::KeyShift(-1)     ;WU sends '-1' to KeyShift (allow modifiers)
F12::ExitApp

KeyShift(Dir){             ;Main Function ('Dir' holds value from above)
  Static Pos:=0            ;  Store content of 'Pos' between calls
  Keys:="zxcv"             ;  Keys to scroll through (modify as needed)
  Pos+=Dir                 ;  Add value from 'Dir' to 'Pos'
  If (Pos>StrLen(Keys))    ;  If 'Pos' is greater than 'Keys' length...
    Pos:=1                 ;    ...Set 'Pos' to '1' (loop around)
  Else If (Pos<1)          ;  Or If 'Pos' is less than '1'
    Pos:=StrLen(Keys)      ;    Set 'Pos' to 'Keys' length (loop around)
  Key:=SubStr(Keys,Pos,1)  ;  Get 'Key' to from position 'Pos' in 'Keys' 
  Send "{Blind}" Key       ;  Send 'Key' (respect held modifiers)
}                          ;End Function block

/* ###  Diddy Version  ###

*WheelDown::KeyShift(1)
*WheelUp::KeyShift(-1)
F12::ExitApp

KeyShift(d){
  Static p:=0,k:="zxcv"
  p+=d,l:=StrLen(k)
  p:=(p<1)?l:(p>l)?1:p
  Send "{Blind}" SubStr(k,p,1)
}