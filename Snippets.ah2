SetWorkingDir "C:\System\"
Snips:=Snippets()

F1::Snips.Show

Class Snippets{
	__New(){
		Snips:=Gui("+AlwaysOnTop +Owner +ToolWindow -Caption","Snips")
    This.Gui:=Snips
		Snips.SetFont("s15 q5","ProFontWindows")
		Snips.BackColor:="66CC00"
		Snips.MarginX:=3
		Snips.MarginY:=3
		LV:=Snips.AddListView("c66CC00 r15 w400",["Key","Text"])
		LV.ModifyCol(1,"Center")
		configText:=IniRead("Snippets.ini","Master")
		Loop Parse configText,"`n","`r"
		{
		  parts:=StrSplit(A_LoopField,"="," `t")
		  LV.Add(,parts[1],parts[2])
		}
	}
	Show(){
    Snips:=This.Gui
	  Snips.Show("NA")
	  Key:=InputHook("L1 T3")
    Key.Start()
    Key.Wait()
	  Snips.Hide()
    If (Key.EndReason!="Timeout"){
      Value:=IniRead("Snippets.ini","Master",Key.Input,"~NF~")
      If (Value!="~NF~")
        Send("{Raw}" Value)
      Else
        MsgBox('No snippet found for " Key.Input ".')
    }
	}
}