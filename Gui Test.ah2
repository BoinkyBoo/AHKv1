#Requires AutoHotkey 2.0+
#SingleInstance Force

Main:=Gui(,"Snazzy Title Here")
Main.SetFont("s12")

x:=8,y:=0,w:=80,h:=0                                             ;Main Panel
Main.AddGroupBox("x8 y0 w441 h361 Section")
Main.AddText("xs+9 ys+22","Label 1:")
Data:=Main.AddEdit("xs+74 ys+19 w160","Data")

Main.AddButton("xs+008 ys+54 w110 h30","Test &1").OnEvent("Click",btnTest)
Main.AddButton("xs+124 ys+54 w110 h30","Test &2").OnEvent("Click",btnTest)

Main.AddButton("xs+008 ys+88 w110 h30","&Save").OnEvent("Click",btnSave)
Main.AddButton("xs+124 ys+88 w110 h30","E&xit").OnEvent("Click",btnQuit)
Main.Show("w456 h369")

btnSave(*){
  MsgBox("Saving: " Data.Text)
}

btnQuit(*){
  btnSave()
  ExitApp
}

btnTest(BTN,*){
  MsgBox("Edit: " Data.Text " (" BTN.Text ")")
}