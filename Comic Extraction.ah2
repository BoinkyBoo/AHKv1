#Requires AutoHotkey 2.0.3+
#SingleInstance Force

#HotIf WinActive("ahk_class CabinetWClass")
  || WinActive("ahk_class ExplorerWClass")
F1::Extr(GetPath())
F2::{
  DIR:=GetPath()
  Loop Files,DIR "*.*","F"
    If (A_LoopFileExt~="rar"){
      CBR:=A_LoopFileName
      RAR:=SubStr(CBR,1,InStr(CBR,".")-1) ".cbr"
      FileMove(DIR CBR,DIR RAR)
    }
}
#HotIf

Extr(DIR){
  Loop Files,DIR "*.*","F"
    If (A_LoopFileExt~="cb(r|z)"){
      CBR:=A_LoopFileName
      NAM:=SubStr(CBR,1,InStr(CBR,".")-1)
      RAR:=NAM ".rar"
      FileMove(DIR CBR,DIR RAR)
      RunWait('7z e "' DIR RAR '" -o"' DIR NAM '" *.* -r',,"Hide")
    }
}
/*
Comp(DIR){
  Loop Files,DIR "*.*","D"
    If (A_LoopFileName~="cb(r|z)"){
      CBR:=A_LoopFileName
      NAM:=SubStr(CBR,1,InStr(CBR,".")-1)
      RAR:=NAM ".rar"
      FileMove(DIR CBR,DIR RAR)

      RunWait('Rar a -ep "' DIR CBR '" "' NAM '\*.*"',,"Hide")
    }
}
*/
GetPath(){
  hwnd:=""
  Prc:=WinGetProcessName("ahk_id " hwnd:=hwnd?hwnd:WinExist("A"))
  Cls:=WinGetClass("ahk_id " hwnd)
  Cob:=ComObject("Shell.Application")
  If (Prc="explorer.exe") && (Cls~="(Cabinet|Explorer)WClass"){
    For Win in Cob.Windows
      If (Win.hwnd==hwnd)
        path:=Win.Document.FocusedItem.path
    SplitPath(path,,&Dir)
  }
  Return Dir "\"
}