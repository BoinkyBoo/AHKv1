SetTitleMatchMode(2)

F1::PageCheck()
F2::Try ControlSend("{F5}",,"Track Package —")

PageCheck(){
  Static Act:=0
  CoordMode("ToolTip")
  SetTimer(Tmr,(Act:=!Act)*30000)
  ToolTip(Act?"On":"",0,A_ScreenHeight,20)
  Tmr(){
    Try ControlSend("{F5}",,"Track Package —")
  }
}