#Requires AutoHotkey 2.0+
#SingleInstance Force

MyGui:=Gui()
MyGui.AddButton(,"Click Me!").OnEvent("Click",(*) => MsgBox("Wheee!"))
MyGui.Show()
/*
MyGui:=Gui()
MyGui.AddButton(,"Click Me!").OnEvent("Click",btnClick)
MyGui.Show()

btnClick(Btn,*){
  MsgBox("Wheee!")
  ExitApp
}