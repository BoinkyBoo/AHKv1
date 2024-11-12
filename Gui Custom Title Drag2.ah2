#Requires AutoHotkey 2.0+
#SingleInstance Force

X:=6,Y:=28,W:=250,H:=150
GOO:=Gui("+AlwaysOnTop +Owner +ToolWindow -Caption","Draggable Window")
GOO.BackColor:="000000"
GOO.SetFont("s14 c1A9FFF","Consolas")
GOO.AddProgress(CP(1,1,W-2,H-2) " Disabled c192B3E +Background192B3E")
;Top Section
GOO.AddProgress(CP(1,1,W-2,25) " Disabled c313842 +Background313842")
GOO.AddText(CP(2,2,W-4,23) " +Background171D25 Center","Click Here and Drag")
.OnEvent("Click",Drag)
;Bottom Section
GOO.SetFont("s8")
GOO.AddProgress(CP(1,H-16,W-2,15) " c313842 +Background313842")
GOO.AddText(CP(2,H-15,W-4,13) " +Background171D25 Center","W.A.Robinson")

GOO.Show("w" W " h" H)

CP(x,y,w,h)=>"x" x " y" y " w" w " h" h

Drag(Btn,*){
  While GetKeyState("LButton","P")
    PostMessage(0xA1,0x2,,,"A")
}