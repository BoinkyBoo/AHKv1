#Requires AutoHotkey 2.0+
#SingleInstance Force
CoordMode "Mouse"
SetTimer TBDisp,50

TBDisp(){
  Static TBShow:=1
  MouseGetPos(,&mY,&mW)
  mC:=WinGetClass("ahk_id " mW)
  If ((mY>A_ScreenHeight-3) && !TBShow){
    WinShow("ahk_class Shell_TrayWnd")
    TBShow:=1
  }Else If TBShow && (mC!="Shell_TrayWnd"){
    WinHide("ahk_class Shell_TrayWnd")
    TBShow:=0
  }
}

F2::WinHide("ahk_class Shell_TrayWnd")
F3::WinShow("ahk_class Shell_TrayWnd")
