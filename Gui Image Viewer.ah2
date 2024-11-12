SRC:="E:\Downloads\Imgur\"
EXT:="i)(jpe?g|png|bmp|gif|webp)"

gs:=800,bw:=100
GOO:=Gui("-DPIScale -Caption","Sorter")
GOO.SetFont("s11","Consolas")
GOO.AddGroupBox("Section x1 y-8 w" gs+2 " h" gs+11)
IMG:=GOO.AddPic("x2 y2 w" gs " h" gs)
GOO.AddButton("  x1 y" gs+7 " w" bw,"First").OnEvent("Click",Press)
GOO.AddButton(" x+4 y" gs+7 " w" bw,"Prev" ).OnEvent("Click",Press)
GOO.AddButton(" x+4 y" gs+7 " w" bw,"Next" ).OnEvent("Click",Press)
GOO.AddButton(" x+4 y" gs+7 " w" bw,"Last" ).OnEvent("Click",Press)
GOO.AddButton(" x+4 y" gs+7 " w" bw,"Size-").OnEvent("Click",Press)
GOO.AddButton(" x+4 y" gs+7 " w" bw,"Size+").OnEvent("Click",Press)
GOO.AddButton("x+82 y" gs+7 " w" bw,"Exit" ).OnEvent("Click",Press)
BAR:=GOO.AddStatusBar()
BAR.SetParts(50,450,150,150)
GOO.Show("w" gs+4 " h" gs+4+56)

Loop Files,SRC "*.*","F"
  If (A_LoopFileExt~=EXT)
    Arr("Z" A_LoopFileFullPath)
Arr("S")
Return

Press(BTN,*){
  Switch BTN.Text{
    Case "First":Arr("S")
    Case "Prev" :Arr("P")
    Case "Size-":ControlMove(2,2,200,200,IMG,"Sorter"),IMG.Redraw()
    Case "Size+":ControlMove(2,2,400,400,IMG,"Sorter"),IMG.Redraw()
    Case "Next" :Arr("N")
    Case "Last" :Arr("E")
    Case "Exit" :ExitApp
    Default:MsgBox BTN.Text
  }
}

Arr(OPT:=""){
  Static ARR:=[],PTR:=0
  If (StrLen(OPT)>1)
    VAR:=SubStr(OPT,2),OPT:=SubStr(OPT,1,1)
  Else
    VAR:=""
  Switch OPT{
    Case "R":Return ARR[PTR]
    Case "C":Return PTR
    Case "P":PTR:=(PTR-1>0)?PTR-1:PTR,Update()
    Case "N":PTR:=(PTR+1<=ARR.Length)?PTR+1:PTR,Update()
    Case "S":PTR:=1,Update()
    Case "E":PTR:=ARR.Length,Update()
    Case "Z":ARR.Push(VAR)
    Default:MsgBox OPT
  }
}

Update(){
  N:=Arr("R"),P:=Arr("C"),SplitPath(N,&F),IMG.Value:=N
  D:=PicSize(N),O:=D.W "x" D.H
  If (D.W>D.H)
    W:=800,H:=Round(D.H/D.W*W,0)
  Else If (D.W<D.H)
    H:=800,W:=Round(D.W/D.H*H,0)
  Else
    W:=H:=800
  R:=W "x" H,ControlMove((800-W)/2+2,(800-H)/2+2,W,H,IMG,"Sorter"),IMG.Redraw()
  BAR.SetText(P,1),BAR.SetText(F,2),BAR.SetText(O,3),BAR.SetText(R,4)
}

PicSize(IMG){
  SplitPath(IMG,&FIL,&DIR)
  SHX:=ComObject("Shell.Application")
  FLD:=SHX.NameSpace(DIR),ITM:=FLD.ParseName(FIL)
  DIM:=StrSplit(RegExReplace(FLD.GetDetailsOf(ITM,31),".(.+).","$1")," x ")
  Return {W:DIM[1],H:DIM[2]}
}