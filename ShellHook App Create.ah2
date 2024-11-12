#SingleInstance Force
Persistent

OnMessage(0xC028,ShellMessage)
DllCall("RegisterShellHookWindow","Ptr",A_ScriptHwnd)
Return

ShellMessage(wParam,lParam,Msg,hWnd){
  Static App:="PotPlayerMini64.exe",Flag:=0
  If (wParam=1) && !Flag{
    Exe:=WinGetProcessName("ahk_id " lParam)
    If (Exe!=App)
      Return
    ToolTip(App " opened!")
    Flag:=lParam
  }Else If (wParam=2) && (lParam=Flag){
    ToolTip(App " closed!")
    Flag:=0
  }
}