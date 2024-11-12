W:=H:=0
T:=GetSize()      ;Text (Default)
B:=GetSize(,"B")  ;Button
MsgBox("T: " T.W "," T.H "`nB: " B.W "," B.H)  ;Compare

A:=["First","Second","Third","Fourth","Fifth","Sixth"
   ,"Seventh","Eighth","Ninth","Tenth","Eleventh","Twelfth"]
W:=H:=0,I:=""
Loop A.Length{
  S:=GetSize(A[A_Index],,18)
  I:=(S.W>W)?A[A_Index]:I
  W:=(S.W>W)?S.W:W,H:=(S.H>H)?S.H:H
}
MsgBox("A: " W " x " H " : " I)

W:=H:=0,S:=I:=""
Loop A.Length{
  S.=(S?"`n":"") A[A_Index]
  I:=(StrLen(A[A_Index])>StrLen(I))?A[A_Index]:I
  W:=GetSize(S,,18).W,H:=GetSize(,,18).H
}
MsgBox("L: " W " x " H " : " I)

GetSize(T:="Test",C:="T",S:=9){  ;Text,Control Type,Font Size
  G:=Gui()
  G.SetFont("s" S,"Consolas")
  If (C="T")
    V:=G.AddText(,T)
  Else
    V:=G.AddButton(,T)
  V.GetPos(,,&W,&H)
  G.Destroy()
  Return {W:W,H:H}
}