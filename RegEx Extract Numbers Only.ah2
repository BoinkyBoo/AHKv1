#Requires AutoHotkey 2.0+
#SingleInstance Force

F1::{               ;I'd change this to something NOT 'Ctrl+v'
  A_Clipboard:=RegExReplace(A_Clipboard,".*?([0-9]*).*?","$1")
  Send("^v")
}