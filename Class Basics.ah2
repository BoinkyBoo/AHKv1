Go:=Test()

Go.Inc
Go.Exec

Class Test{
  Num:=42
  Str:="Bugger!"
  __New(){
;    This.Exec()
  }
  Exec(){
    MsgBox This.Num
  }
  Inc(){
    This.Num++
  }
  Dec(){
    This.Num--
  }
}