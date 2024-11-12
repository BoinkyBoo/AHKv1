A:=["Testing for first row","Test again for the second row","Lowly third row"]

G:=Gui() ;"+AlwaysOnTop +Owner +ToolWindow -Caption","Comic Helper")
G.SetFont("s18","Consolas")
L:=G.AddListView("x0 y0 r" A.Length,["Title!"])
Loop A.Length
  L.Add("Check",A[A_Index])
L.ModifyCol
LVM_CS(L.hWnd,,&W,&H)
L.Move(,,W,H)
G.Show("w" W " h" H)
Return

LVM_CS(hLV,Rows:=-1,&Width:="",&Height:=""){
  Static LVM_GETITEMCOUNT       :=0x1004
        ,LVM_APPROXIMATEVIEWRECT:=0x1040
  If (Rows<0)
    Rows:=SendMessage(LVM_GETITEMCOUNT,0,0,,hLV)
  If Rows
    Rows-=1
  EL:=SendMessage(LVM_APPROXIMATEVIEWRECT,Rows,-1,,hLV)
  Width :=(EL&0xFFFF)+4
  Height:=(EL>>16)+4
  Return Height<<16|Width
}