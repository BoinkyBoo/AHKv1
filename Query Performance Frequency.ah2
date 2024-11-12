QPC(1)
Sleep 234
T:=QPC(0)
MsgBox T

QPC(Opt:=0){
  Static FRQ:=0,PRE:=0,PST:=0
  If Opt{
    DllCall("QueryPerformanceFrequency","Int64*",&FRQ)
    DllCall("QueryPerformanceCounter","Int64*",&PRE)
  }Else{
    DllCall("QueryPerformanceCounter","Int64*",&PST)
    Return (PST-PRE)/FRQ*1000
  }
}