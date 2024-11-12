Main:=Gui()
bTarget:=Main.AddButton("","Target")
Main.AddButton("","Toggle")
 .OnEvent("Click",(*) => bTarget.Enabled:=!bTarget.Enabled)
Main.Show()

F1::bTarget.Enabled:=!bTarget.Enabled

/*
Main:=Gui()
bTarget:=Main.AddButton("","Target")  ;Assign this button to 'bTarget'
Main.AddButton("","Toggle")
 .OnEvent("Click",Clicked)
Main.Show()

Clicked(*){
  bTarget.Enabled:=!bTarget.Enabled   ;Flip 'Enabled' state
}

F1::Clicked()                         ;Call 'Clicked()'
*/