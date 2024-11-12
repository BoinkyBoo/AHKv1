#Requires AutoHotkey 2.0+
#SingleInstance Force
CoordMode("Mouse")
CoordMode("Pixel")
;                                                                             80
Pix:="C:\System\Dat\AMZ_HST.png"
F1::{
    While ImageSearch(&px,&py,0,0,A_ScreenWidth,A_ScreenHeight,Pix)
      MouseClick("L",px+56,py+13)
}