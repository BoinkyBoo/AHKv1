#Requires AutoHotkey 2.0+
#SingleInstance Force

G:=GuiClass()

Class GuiClass{
  Test:="Data A"

  __New(){
    this.Main:=Gui(,"Snazzy Title Here",this)
    this.Main.SetFont("s12")

    x:=8,y:=0,w:=80,h:=0                                             ;Main Panel
    this.Main.AddGroupBox("x8 y0 w441 h361 Section")
    this.Main.AddText("xs+9 ys+22","Label S:")
    this.Dat1:=this.Main.AddEdit("xs+74 ys+19 w160",This.Test)

    this.Main.AddText("xs+9 ys+56","Label E:")
    this.Dat2:=this.Main.AddEdit("xs+74 ys+53 w160","")

    this.Main.AddButton("xs+008 ys+086 w110 h30","Test &1").OnEvent("Click","btnTest")
    this.Nope:=this.Main.AddButton("xs+124 ys+086 w110 h30","Test &2")
    this.Nope.OnEvent("Click","btnTest")

    this.Main.AddButton("xs+008 ys+120 w110 h30","Test &3").OnEvent("Click","btnTest")
    this.Main.AddButton("xs+124 ys+120 w110 h30","Test &4").OnEvent("Click","btnTest")

    this.Main.AddButton("xs+008 ys+154 w110 h30","&Save").OnEvent("Click","btnSave")
    this.Main.AddButton("xs+124 ys+154 w110 h30","E&xit").OnEvent("Click","btnQuit")
    this.Main.Show("w456 h369")
  }

  btnSave(*){
    MsgBox("Saving:`n`t" this.Dat1.Text)
  }

  btnQuit(*){
    this.btnSave()
    ExitApp
  }

  btnTest(BTN,*){
    Switch BTN.Text{
      Case "Test &1":this.Dat2.Text:=this.Test
      Case "Test &2":this.Dat2.Text:=""
      Case "Test &3":this.Dat2.Enabled:=!this.Dat2.Enabled
      Case "Test &4":this.Nope.Enabled:=!this.Nope.Enabled
      Default:MsgBox("Edit: " this.Dat1.Text "`n" BTN.Text)
    }
  }
}