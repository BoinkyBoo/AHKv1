wX:=A_ScreenWidth/2,wY:=A_ScreenHeight/2,wW:=30,wH:=30
myGui:=Gui("+AlwaysOnTop +ToolWindow -Caption +E0x20","Debug")
myGui.BackColor:="99FF00"
wX:=wX-(wW-1)/2,wY:=wY-(wH-1)/2
myGui.Show("x" wX " y" wY " w" wW " h" wH " NA")
WinSetTransparent(10,"Debug")

F1::WinSetRegion("0-0 " wW "-0 " wW "-" wH " 0-" wH " 0-0 1-1 " wW-1 "-1 " wW-1 "-" wH-1 " 1-" wH-1 " 1-1","Debug")
F2::WinSetRegion(,"Debug")