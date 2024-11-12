#Requires AutoHotkey 2.0+
CoordMode "ToolTip"
SetTimer tX,50

*LShift::
*RShift::
{
  If GetKeyState("Shift")
    SendInput "{Blind}{RShift Up}{LShift Up}"
  Else
    SendInput "{Blind}{" SubStr(A_ThisHotkey,2) " Down}"
}

Esc::ExitApp

tX(){
  Static nt:=0,ot:=0
  lic:=GetKeyState("LCtrl"), lpc:=GetKeyState("LCtrl","P")
  lia:=GetKeyState("LAlt"),  lpa:=GetKeyState("LAlt","P")
  lis:=GetKeyState("LShift"),lps:=GetKeyState("LShift","P")
  liw:=GetKeyState("LWin"),  lpw:=GetKeyState("LWin","P")
  ric:=GetKeyState("RCtrl"), rpc:=GetKeyState("RCtrl","P")
  ria:=GetKeyState("RAlt"),  rpa:=GetKeyState("RAlt","P")
  ris:=GetKeyState("RShift"),rps:=GetKeyState("RShift","P")
  riw:=GetKeyState("RWin"),  rpw:=GetKeyState("RWin","P")
  nt:="C:  " lic "|" lpc " " ric "|" rpc
  . "`nA:  " lia "|" lpa " " ria "|" rpa
  . "`nS:   " lis "|" lps " " ris "|" rps
  . "`nW: " liw "|" lpw " " riw "|" rpw
  If (nt!=ot)
    ToolTip nt,0,A_ScreenHeight
  ot:=nt
}