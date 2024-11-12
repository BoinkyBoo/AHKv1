#HotIf WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExplorerWClass")
F1::{
  hwnd:=""
  Prc:=WinGetProcessName("ahk_id " hwnd:=hwnd?hwnd:WinExist("A"))
  Cls:=WinGetClass("ahk_id " hwnd)
  Cob:=ComObject("Shell.Application")
  If (Prc="explorer.exe") && (Cls~="(Cabinet|Explorer)WClass"){
    For Win in Cob.Windows
      If (Win.hwnd==hwnd)
        path:=Win.Document.FocusedItem.path
    SplitPath(path,,&dir)
  }
  MsgBox Prc " : " Cls "`n" dir
}
#HotIf