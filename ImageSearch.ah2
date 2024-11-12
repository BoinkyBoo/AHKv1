#Requires AutoHotkey 2.0+
#SingleInstance Force
SetWorkingDir "E:\Downloads\_Doing\Image Search\"
CoordMode "ToolTip"
CoordMode "Mouse"
CoordMode "Pixel"

F1::{
  If !ImageSearch(&iX,&iY,0,0,A_ScreenWidth,A_ScreenHeight,"*12 AHK.png")
    MsgBox "Not Found!"
  Else
    MsgBox "Found: " iX "," iY
}

F2::{
  Err:=ImageSearch(&iX,&iY,0,0,A_ScreenWidth,A_ScreenHeight,"*12 AHK.png")
  If !Err
    MsgBox "Not Found!"
  Else
    MsgBox "Found: " iX "," iY
}