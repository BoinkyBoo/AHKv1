#Requires AutoHotkey 2.0+                              ;Needs AHK v2+
#SingleInstance Force                                  ;Run only one instance
OnMessage(0xC028,ShellMessage)                         ;Send window events to func below
DllCall("RegisterShellHookWindow","Ptr",A_ScriptHwnd)  ;Tie events to this script
Persistent                                             ;Keep running
Return                                                 ;End autoexecute

ShellMessage(wParam,lParam,Msg,hWnd){                  ;Main func (gets win events)
  Static Prev:="",Curr:=""                             ;  Store these on each call
  If (wParam=32772){                                   ;  If window activated
    Curr:=WinGetProcessName("ahk_id " lParam)          ;    Get the exe of that window
    If (Prev="chrome.exe")                             ;    If the last window was Chrome
      && (Curr="msedge.exe")                           ;    ..and the current is Edge
      && (WinGetMinMax("ahk_exe msedge.exe")=1){       ;    ..and Edge is maximised
        WinMinimize("ahk_exe chrome.exe")              ;      Minimise Chrome
        Return                                         ;      We're done here
    }                                                  ;    End If block
  }                                                    ;  End If block
  Prev:=Curr                                           ;  Store this window to Prev
}                                                      ;End Func block