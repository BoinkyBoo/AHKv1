Main:=Gui("+AlwaysOnTop +ToolWindow -Caption")
Main.SetFont("s20 cLime","Consolas")
Main.BackColor:="202020"
Main.AddEdit("r1 Center vContent Limit19 x-4 y-4 w308 -E0x200 +Background040404").OnEvent("Change",eChange)
STR:=Main.AddText("x6 y36 w288 h34 Center vMSG -E0x200 +Background101010")
Main.Show("w300 h70")

eChange(OBJ,NFO){
  STR.Text:=StrLen(OBJ.Value)
}
