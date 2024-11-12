Main:=Gui()
Main.AddEdit("vTextToChange")
Main.AddButton("vButtonText","Click Me").OnEvent("Click",eClick)
Main.Show()

eClick(Btn,Nfo){
  Edt:=Main["TextToChange"]
  Btn:=Main["ButtonText"]
  MsgBox "Edit:`t" Edt.Text "`nButt:`t" Btn.Text
  Edt.Text:=""
}