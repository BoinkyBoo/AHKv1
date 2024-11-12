GOO:=Gui()
DRP:=GOO.AddEdit("x15 y10 w200 h200 vvDrop","Drop here...")
GOO.OnEvent("DropFiles",GOO_DropFiles)
GOO.Show("w500 h500")

GOO_DropFiles(Obj,Ctl,Arr,X,Y){
  LST:=""
  For NUM, ITM in ARR
    LST.=(LST?"`n":"") ITM " (" NUM ")"
  LST:=Sort(LST)
  MsgBox LST
}