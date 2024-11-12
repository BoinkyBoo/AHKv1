Main:=Gui(,"TestWin")
Main.AddButton("x8  y0 w84 h30","Target" ).OnEvent("Click",b)
Main.AddButton("x+4 yp wp  hp ","Hide"   ).OnEvent("Click",b)
Main.AddButton("x+4 yp wp  hp ","Show"   ).OnEvent("Click",b)
Main.AddButton("x+4 yp wp  hp ","Disable").OnEvent("Click",b)
Main.AddButton("x+4 yp wp  hp ","Enable" ).OnEvent("Click",b)
Main.AddButton("x+4 yp wp  hp ","Swap"   ).OnEvent("Click",b)
Main.Show

b(BTN,*){
  Static Target:="Target"
  Switch BTN.Text{
    Case "Hide":   ControlHide Target
    Case "Show":   ControlShow Target
    Case "Disable":ControlSetEnabled 0,Target
    Case "Enable": ControlSetEnabled 1,Target
    Case "Swap":   ControlSetText Target:=((Target="Target")?"Testing":"Target"),((Target="Target")?"Testing":"Target")
    Default:       MsgBox BTN.Text
  }
}

/*
Gui Main:New
Gui Main:Add,Button,x0  y0 w84 h30 gb,Target
Gui Main:Add,Button,x+4 yp wp  hp  gb,Hide
Gui Main:Add,Button,x+4 yp wp  hp  gb,Show
Gui Main:Add,Button,x+4 yp wp  hp  gb,Disable
Gui Main:Add,Button,x+4 yp wp  hp  gb,Enable
Gui Main:Show

b:
  Switch A_GuiControl{
    Case "Target": SD("Flocker")
    Case "Hide":   GuiControl Hide,Target
    Case "Show":   GuiControl Show,Target
    Case "Disable":GuiControl Disable,Target
    Case "Enable": GuiControl Enable,Target
  }
Return
*/
