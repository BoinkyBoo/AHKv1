#Requires AutoHotkey 2.0+
#SingleInstance Force
HK:=HKActive()

F1::HK.Toggle

#HotIf HK.Active
F2::MsgBox("Bugger!")     ;Put Hotkeys here (example provided!)
#HotIf

Class HKActive{
  Active:=0
  __New(){
    MainUX:=Gui("+AlwaysOnTop +ToolWindow -Caption")
    MainUX.SetFont("s48","Consolas")
    MainUX.BackColor:="800000"
    This.DispText:=MainUX.AddText("cFF0000 Center","Hotkeys: Off")
    MainUX.Show("NoActivate y1000")
    This.MainUX:=MainUX
  }
  Toggle(){
    Tog:=This.Active:=!This.Active
    This.DispText.SetFont(Tog?"c00FF00":"cFF0000")
    This.MainUX.BackColor:=(Tog?"008000":"800000")
    This.DispText.Value:="Hotkeys: " (Tog?"On":"Off")
  }
}