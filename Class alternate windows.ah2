#Requires AutoHotkey 2.0+
#SingleInstance Force

Swap:=WindowSwap()
Swap.GetWin()
F1::Swap.CurWin()
F2::Swap.Change()

Class WindowSwap{
  Current:=0
  GetWin(){
    This.Arr:=[]
    List:=WinGetList("ahk_exe Notepad.exe")
    For ID in List
      This.Arr.Push(WinGetPID("ahk_id " ID))
    If (This.Arr.Length>0)
      This.Current:=This.Arr[1]
  }
  CurWin(){
    ToolTip(This.Current)
  }
  Change(){
    If (This.Current+1>This.Arr.Length)
      This.Current:=1
    Else
      This.Current++
    WinActivate("ahk_pid " This.Arr[This.Current])
  }
}