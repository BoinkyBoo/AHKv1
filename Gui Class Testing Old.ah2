#Requires AutoHotkey 2.0+
#SingleInstance Force

G:=GuiClass()

Class GuiClass{
  Test:="Data A"

  __New(){
    Main:=Gui(,"Snazzy Title Here",this)
    this.Main:=Main
    Main.SetFont("s12")

    x:=8,y:=0,w:=80,h:=0                                             ;Main Panel
    Main.AddGroupBox("x8 y0 w441 h361 Section")
    Main.AddText("xs+9 ys+22","Label S:")
    this.DataS:=Main.AddEdit("xs+74 ys+19 w160",This.Test)

    Main.AddText("xs+9 ys+56","Label E:")
    this.DataE:=Main.AddEdit("xs+74 ys+53 w160","")

    Main.AddButton("xs+008 ys+086 w110 h30","Test &1").OnEvent("Click",btnTest)
    Main.AddButton("xs+124 ys+086 w110 h30","Test &2").OnEvent("Click",btnTest)

    Main.AddButton("xs+008 ys+120 w110 h30","Test &3").OnEvent("Click",btnTest)
    Main.AddButton("xs+124 ys+120 w110 h30","Test &4").OnEvent("Click",btnTest)

    Main.AddButton("xs+008 ys+154 w110 h30","&Save").OnEvent("Click",btnSave)
    Main.AddButton("xs+124 ys+154 w110 h30","E&xit").OnEvent("Click",btnQuit)
    Main.Show("w456 h369")

    btnSave(*){
      MsgBox("Saving: " this.DataS.Text)
    }

    btnQuit(*){
      btnSave()
      ExitApp
    }

    btnTest(BTN,*){
      Switch BTN.Text{
        Case "Test &1":
        Default:MsgBox("Edit: " this.DataS.Text "`n" BTN.Text)
      }
    }
  }
}