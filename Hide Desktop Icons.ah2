#Requires AutoHotkey 2.0+
#SingleInstance Force

#HotIf WinActive("ahk_class Progman")
    || WinActive("ahk_class WorkerW")
#!d::{                    ;Win+Alt+D
  If ControlGetVisible("SysListView321","ahk_class Progman")
    ControlHide("SysListView321","ahk_class Progman")
  Else
    ControlShow("SysListView321","ahk_class Progman")
}
#HotIf
