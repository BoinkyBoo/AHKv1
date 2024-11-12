#Requires AutoHotkey 2.0+
#SingleInstance Force
CoordMode "Mouse"

RandomStuff(10)

RandomStuff(Dur:=0){
  Static Keys:="wasd",Ctr:=0                                  ;Store
  Ctr:=Dur?Dur:Ctr                                            ;Get 'Dur'
  MouseMove Random(0,A_ScreenWidth),Random(0,A_ScreenHeight)  ;Mouse Move
  Click Random(0,1)                                           ;Mouse Click
  Send SubStr(Keys,Random(1,StrLen(Keys)),1)                  ;Key Send
  SetTimer %A_ThisFunc%,(--Ctr!=0)?-1000:0                    ;Loop Back
}

/* #####  Or  #####

F1::RandomStuff(1)                                              ;Toggle On/Off

RandomStuff(Opt:=0){                                            ;Main Func
  Static Keys:="wasd",Tog:=0                                    ;  Store
  Tog:=Opt?!Tog:Tog                                             ;  Flip Active
  If Tog{                                                       ;  If Active
    MouseMove Random(0,A_ScreenWidth),Random(0,A_ScreenHeight)  ;    Move
    Click Random(0,1)                                           ;    Click
    Send SubStr(Keys,Random(1,StrLen(Keys)),1)                  ;    Keypress
    SetTimer %A_ThisFunc%,-1000                                 ;    Loop back
  }Else                                                         ;  Otherwise
    SetTimer %A_ThisFunc%,0                                     ;    Turn off
}                                                               ;End Func

*/