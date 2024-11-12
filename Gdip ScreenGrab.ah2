#Requires AutoHotkey 2.0+
#SingleInstance Force
#Include "E:\Coding\AHK\Libs\Gdip_custom.ah2"
CoordMode("ToolTip")
;                                                                             80
NTime:=FormatTime(A_Now,"yyyyMMddhhmm")
Loop Files A_DeskTop "\temptracking*.png","F"
  Name:=A_LoopFileName
If !IsSet(Name)
  Order:=1
Else{
  OTime:=SubStr(Name,15,12)
  Order:=SubStr(Name,28,StrLen(File)-31)
  If (OTime=NTime)
    Order++
  Else
    Order:=1
}
pToken:=Gdip_StartUp()
pBitmap:=Gdip_BitmapFromScreen("996|532|820|595")
Gdip_SaveBitmapToFile(pBitmap,A_Desktop "\temptracking-_" NTime "_" Order ".png")
Gdip_DisposeImage(pBitmap)
Gdip_Shutdown(pToken)
ExitApp