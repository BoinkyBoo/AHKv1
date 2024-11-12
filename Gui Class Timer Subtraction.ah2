CoordMode("ToolTip")

Test:=Countdown()
Test.Start()

Class Countdown{
  __New(){
    This.SH:=17,This.SM:=30,This.SS:=0
    This.Timer:=ObjBindMethod(This,"Tick")
    This.Event:=ObjBindMethod(This,"Change")

    Main:=Gui("+AlwaysonTop +ToolWindow -Caption","Counter",This)
    Main.BackColor:="101010"

    Main.SetFont("s14 c00FF00","Consolas")
    Main.AddProgress("x002 y002 w92 h26 Disabled c006000",100)
    Main.AddProgress("x004 y004 w88 h22 Disabled c003000",100)
    This.C1:=Main.AddText("x008 y004 w80 h22 Left +Background003000","00:00:00")
    This.C1.OnEvent("Click",(*) => MsgBox("Clickaroo!"))

    Main.SetFont("s14 cFFFF00","Consolas")
    Main.AddProgress("x102 y002 w92 h26 Disabled c606000",100)
    Main.AddProgress("x104 y004 w88 h22 Disabled c303000",100)
    This.C2:=Main.AddText("x108 y004 w80 h22 Left +Background303000","00:00:00")
    This.C2.OnEvent("Click",(*) => MsgBox("Nowtipops!"))

    Main.SetFont("s14 cFF0000","Consolas")
    Main.AddProgress("x202 y002 w92 h026 Disabled c600000",100)
    Main.AddProgress("x204 y004 w88 h022 Disabled c300000",100)
    This.C3:=Main.AddText("x208 y004 w80 h22 Center +Background300000","00:00:00")
    This.C3.OnEvent("Click",(*) => MsgBox("Resetoodle!"))

    Main.Show("y" A_ScreenHeight-30 " w300 h30")
    WinSetTransColor("101010","Counter")
  }
  Set(){
    Sub1:=Gui() ;"+AlwaysOnTop +ToolWindow -Caption")
    Sub1.SetFont("s20 cLime","Consolas")
    ;Sub1.BackColor:="000000"
    Sub1.AddEdit("r1 Center vContent Limit38 x-4 y-4 w608").OnEvent("Change",This.Change)
    vStr:=Sub1.AddText("x6 y36 w588 h34 Center")
    vTot:=Sub1.AddText("x6 y66 w588 h34 Center")
    Sub1.Show("w300 h100")
  }
  Change(){
    MsgBox("Yes!")
  }
  Start(){
    Timer:=This.Timer
    SetTimer(Timer,1000)
  }
  Stop(){
    Timer:=This.Timer
    SetTimer(Timer,0)
  }
  Tick(){
    SH:=This.SH,SM:=This.SM,SS:=This.SS,SD:=SH*3600+SM*60+SS
    CH:=A_Hour, CM:=A_Min,  CS:=A_Sec,  CD:=CH*3600+CM*60+CS
    RD:=(SD-CD<0)?SD-CD+24*3600:SD-CD
    RH:=RD//3600,RD:=Mod(RD,3600),RM:=RD//60,RS:=Mod(RD,60)
    CT:=CH ":" CM ":" CS
    ST:=(SH<10?"0" SH:SH) ":" (SM<10?"0" SM:SM) ":" (SS<10?"0" SS:SS)
    RT:=(RH<10?"0" RH:RH) ":" (RM<10?"0" RM:RM) ":" (RS<10?"0" RS:RS)
    ControlSetText(CT,This.C1)
    ControlSetText(ST,This.C2)
    ControlSetText(RT,This.C3)
  }
}