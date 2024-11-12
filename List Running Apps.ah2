#Requires AutoHotkey 2.0+
#SingleInstance Force
DetectHiddenWindows 1
SetTitleMatchMode 2
CoordMode "ToolTip"

GroupAdd("Test","ahk_class AutoHotkeyGUI ahk_exe Autohotkey64.exe")
;GroupAdd("Test","Mozilla Firefox ahk_exe Firefox.exe")
;GroupAdd("Test","ahk_exe Chrome.exe")
;GroupAdd("Test","ahk_class Shell_TrayWnd ahk_exe Explorer.exe")
;GroupAdd("Test","Bluetooth ahk_exe Explorer.exe")
;GroupAdd("Test","ahk_exe GWT.exe")
;GroupAdd("Test","ahk_class Photoshop ahk_exe Photoshop.exe")
;GroupAdd("Test","AIMP")
;GroupAdd("Test","ahk_class Notepad")
;GroupAdd("Test","ahk_class TApplication ahk_exe FSViewer.exe")
;GroupAdd("Test"," FastStone ahk_exe FSViewer.exe")
;GroupAdd("Test","ahk_exe FSViewer.exe")
SetTimer(Timer,250)

Timer(){
  Static tO:=""
  tN:=""
  List:=WinGetList("ahk_group Test")
  For ID in List{
    wT:=WinGetTitle("ahk_id " ID)
    wC:=WinGetClass("ahk_id " ID)
    wE:=WinGetProcessName("ahk_id " ID)
    wP:=WinGetPID("ahk_id " ID)
    tN.=(tN?"`n":"") "T: " wT "|C: " wC "|E: " wE "|P: " wP " - " ID 
  }
  If (tN!=tO)
    ToolTip(tN,10,10),A_Clipboard:=tN
  tO:=tN
}