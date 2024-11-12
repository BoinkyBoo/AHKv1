Gx:=Gui()
Arr:=Gx.Add("ListBox","r5 vColorChoice Multi",["A","B","C","D","E"])
Gx.Add("Button",,"Test").OnEvent("Click",GxClick)
Gx.Show

GxClick(BTN,NFO){
  Loop Arr.Text.Length
    Lst.=Arr.Text[A_Index] "`n"
  MsgBox(Lst)
}
