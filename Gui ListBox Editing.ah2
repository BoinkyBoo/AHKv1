GOO:=Gui()
GOO.SetFont("s14","Consolas")
LV1:=GOO.AddListView("x0 y0 r3 Checked Grid",["","A","B","C","D"])
LV1.Add("Check",,"1","2","3","4")  ;Blank is Checkbox Text
LV1.Add("Check",,"5","6","7","8")
LV1.Add("Check",,"9","0","-","+")
LV1.ModifyCol
LVS(LV1.hWnd,,&LVW,&LVH)  ;Resize all to fit text
LV1.Move(,,LVW,LVH)  ;Resize window to fit new size
LV1.OnEvent("DoubleClick",LVD)  ;DClk a row
BTN:=GOO.AddButton("x" LVW/2-60 " w120 Default","Move")
FNC:=LVC.Bind(LV1)  ;FNC triggers LVC and passes LV1 as param 1
BTN.OnEvent("Click",FNC)  ;When BTN is clicked, trigger FNC
GOO.Show("w" LVW " h" LVH+56)
Return

LVD(LVX,ROW){
  MsgBox(LVX.GetText(ROW,2) "`n`n" LVX.Modify(ROW,"-Check",,"X"))
}

LVC(LVX,CTL,*){
  MsgBox(LVX.GetText(2,2))
}

LVS(I,R:=-1,&W:="",&H:=""){
  R:=(R<0)?SendMessage(0x1004,0,0,,I):R
  E:=SendMessage(0x1040,R?R-=1:R,-1,,I)
  W:=(E&0xFFFF)+4,H:=(E>>16)+4
  Return H<<16|W
}