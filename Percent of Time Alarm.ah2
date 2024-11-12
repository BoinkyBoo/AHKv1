#Requires AutoHotkey 2.0+
#SingleInstance Force

Main:=Gui("+AlwaysOnTop +ToolWindow","Countdown Timer")
Main.SetFont("s20","Consolas")
Main.AddGroupBox("x0 y-15 w380 h108 Section")
Main.AddEdit("x006 y007 w64 Limit3 vPC Number").OnEvent("Change",gChange)
Main.AddText("x076 y010","% of")
Main.AddEdit("x144 y007 w64 Limit3 vHH Number").OnEvent("Change",gChange)
Main.AddText("x210 y010","h")
Main.AddEdit("x234 y007 w50 Limit2 vMM Number").OnEvent("Change",gChange)
Main.AddText("x286 y010","m")
Main.AddEdit("x310 y007 w50 Limit2 vSS Number").OnEvent("Change",gChange)
Main.AddText("x362 y010","s")
Main.AddButton("x20 y54 w340 h34 vBT Disabled","...").OnEvent("Click",gClick)
Main.Show("w380 h93")

gChange(Ctl,Nfo){
  Static PC:=100,HH:=0,MM:=0,SS:=0,NV:=0
  Var:=Main.Submit(0)
  %Ctl.Name%:=(Var.%Ctl.Name%="")?0:Var.%Ctl.Name%
  PC:=!PC?100:PC
  NV:=Floor((HH*3600000+MM*60000+SS*1000)/100*PC)
  BT:=Main["BT"]
  If NV{
    ControlSetEnabled(1,BT.Text)
    ControlSetText(NV,BT.Text)
  }Else{
    ControlSetEnabled(0,BT.Text)
    ControlSetText("...",BT.Text)
  }
}

gClick(Ctl,Nfo){
  SetTimer(Alarm,"-" Main["BT"].Text)
  Main.Destroy()
}

Alarm(){
  SoundPlay("C:\Windows\Media\Alarm01.wav")
  MsgBox "Time's up!"
}