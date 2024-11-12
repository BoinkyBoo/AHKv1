#Requires AutoHotkey 2.0.3+
#SingleInstance Force

#HotIf WinActive("ahk_class CabinetWClass")
  || WinActive("ahk_class ExplorerWClass")
F1::Extr(GetPath())
#HotIf

Extr(DIR){
  Loop Files,DIR "*.*","F"
    If (A_LoopFileName~="i)Instrumental"){
      OLD:=A_LoopFileName
      NEW:=RegExReplace(OLD,"Instrumental","Inst.")
      FileMove(DIR OLD,DIR NEW)
    }
}

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