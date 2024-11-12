Arr:=Circle(0,0,500,3)
Lst:=""
Loop Arr.Length
  Lst.=(Lst?"`n":"") Arr[A_Index].x "," Arr[A_Index].y
MsgBox Lst

Circle(x:=1280,y:=720,r:=500,n:=3){
  PI:=3.1415926535
  Arr:=[]
  Loop n{
    Ang:=360/n*A_Index
    xd:=r*Cos(Ang*PI/180)
    yd:=r*Sin(Ang*PI/180)
    Arr.Push({x:Round(x+xd),y:Round(y+yd)})
  }
  Return Arr
}