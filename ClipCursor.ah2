Esc::{
  Clip()
  ExitApp
}

F1::{
	WinGetPos(&VarX,&VarY,&Width,&Height,"A")
	VarX2:=VarX+Width
	VarY2:=VarY+Height
	Clip(True,VarX,VarY,VarX2,VarY2)
	ToolTip("Mouse cursor locked!")
	SetTimer () => ToolTip(),-3000
}

F2::{
	Clip()
	ToolTip("Mouse cursor unlocked!")
	SetTimer () => ToolTip(),-3000
}

Clip(Conf:=False,x1:=0,y1:=0,x2:=1,y2:=1){
	pData:=DllCall("GlobalAlloc","UInt",0,"UPtr",16,"Ptr")
	NumPut("UPtr",x1,pData+0)
	NumPut("UPtr",y1,pData+4)
	NumPut("UPtr",x2,pData+8)
	NumPut("UPtr",y2,pData+12)
	Val:=Conf?DllCall("ClipCursor","Ptr",pData):DllCall("ClipCursor")
	DllCall("GlobalFree","Ptr",pData)
	Return Val
}
