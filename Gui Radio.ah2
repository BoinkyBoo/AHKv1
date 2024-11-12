RadioVal:=IniRead("Radio.ini","Settings","RadioSel",0)

Gx:=Gui()
R1:=Gx.Add("Radio","vRadioSel","Option 1") ;.OnEvent("Click",RadioChg)
R2:=Gx.Add("Radio","","Option 2") ;.OnEvent("Click",RadioChg)
R3:=Gx.Add("Radio","","Option 3") ;.OnEvent("Click",RadioChg)
Gx.Add("Button","Default","&Save Settings").OnEvent("Click",SaveSet)
If RadioVal
  R%RadioVal%.Value:=1
Gx.Show()

RadioChg(*){
  Vars:=Gx.Submit(0)
  MsgBox Vars.RadioSel
}

SaveSet(*){
  Vars:=Gx.Submit(0)
  IniWrite(Vars.RadioSel,"Radio.ini","Settings","RadioSel")
}