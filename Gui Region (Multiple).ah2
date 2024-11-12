a:=[518,323
   ,553,942
   ,1701,296
   ,1760,649
   ,1660,1182]
g:=[]

Loop a.Length/2{
  i:=A_Index,x:=a[i*2-1],y:=a[i*2]

  w:=17,b:=7
  g.Push(Gui("+AlwaysOnTop +ToolWindow -Caption","Gui" i*2-1))
  g[i*2-1].BackColor:="80FF00"
  g[i*2-1].Show("x" x-(w-1)/2 " y" y-(w-1)/2 " w" w " h" w " NA")
  WinSetRegion("0-0 " w "-0 " w "-" w " 0-" w " 0-0 " b "-" b " "
. w-b "-" b " " w-b "-" w-b " " b "-" w-b " " b "-" b,"Gui" i*2-1)

  w:=13,b:=3
  g.Push(Gui("+AlwaysOnTop +ToolWindow -Caption","Gui" i*2))
  g[i*2].BackColor:="FF00FF"
  g[i*2].Show("x" x-(w-1)/2 " y" y-(w-1)/2 " w" w " h" w " NA")
  WinSetRegion("0-0 " w "-0 " w "-" w " 0-" w " 0-0 " b "-" b " "
. w-b "-" b " " w-b "-" w-b " " b "-" w-b " " b "-" b,"Gui" i*2)
}
/*
CoordMode "ToolTip"
SetTimer tX,50

t:=""

1::Global t.=1
2::Global t.=2
3::Global t.=3
4::Global t.=4
5::Global t.=5

tX(){
  nT:="T: " t
  ToolTip(nT,0,A_ScreenHeight,20)
}
*/