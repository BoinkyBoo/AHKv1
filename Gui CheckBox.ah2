Gx:=Gui()
Chk:=Gx.Add("CheckBox",,"Check")
Gx.Add("Button",,"Test").OnEvent("Click",GxClick)
Gx.Show

GxClick(BTN,*){
  MsgBox(Chk.Value " " BTN.Text)
}
