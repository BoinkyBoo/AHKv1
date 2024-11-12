If (NUM:=A_Args.Length){
  ARG:=A_Args[1]
  Sleep((NUM>1)?A_Args[2]*1000:0)
  WinActivate("ahk_class Shell_TrayWnd")
  Send("#x")
  Sleep(100)
  Send("us")
}
