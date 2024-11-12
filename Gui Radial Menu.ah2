#Requires AutoHotkey 2.0+
#SingleInstance Force
CoordMode("Mouse")
MW:=MenuWheel()

$Tab::MW.Show()
#HotIf WinExist("MenuWheel")
$Tab::MW.Hide()
#HotIf

Class MenuWheel{
  Hole:=220      ;Inside/Hole Diameter (Controls overall gui size)
  Wall:=80       ;Gui Wall Width (80 wide seems fine for 48px icons)
  Pics:=48       ;Icon Size
  Apps:=["C:\Program Files\Google\Chrome\Application\chrome.exe"
        ,"C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe"
        ,"C:\Users\" A_UserName "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
        ,"D:\Portable\AIMP\AIMP.exe"
        ,"C:\Windows\System32\notepad.exe"
        ,"C:\Program Files (x86)\Steam\Steam.exe"]   ;List of app locations (MUST EXIST)

  __New(){
    Pi:=3.1415592635,Hole:=This.Hole,Diam:=Hole+This.Wall,Pics:=This.Pics
    Goo:=Gui("+AlwaysonTop +ToolWindow -Caption","MenuWheel")
    Goo.BackColor:="101010"
    Ox:=Diam/2-Pics/2,Oy:=Diam/2-Pics/2,Rad:=Hole/2
    Loop Num:=This.Apps.Length{
      Ang:=360/Num*A_Index-90,Dx:=Round(Rad*Cos(Ang*Pi/180)),Dy:=Round(Rad*Sin(Ang*Pi/180))
      Goo.AddPicture("x" Ox+Dx " y" Oy+Dy " w" Pics " h" Pics,This.Apps[A_Index])
        .OnEvent("Click",Launch)
    }
    Goo.Show("w" Diam " h" Diam)

;    WinSetTransColor("101010","MenuWheel")    ;No background at all

    WinSetTransparent("250","MenuWheel")       ;These 5 lines are for the 'donut' background
    Outer:=DllCall("CreateEllipticRgn","Int",0,"Int",0,"Int",Diam,"Int",Diam)
    Inner:=DllCall("CreateEllipticRgn","Int",Diam-Hole,"Int",Diam-Hole,"Int",Hole,"Int",Hole)
    DllCall("CombineRgn","UInt",Outer,"UInt",Outer,"UInt",Inner,"Int",3)
    DllCall("SetWindowRgn","UInt",WinGetID("MenuWheel"),"UInt",Outer,"UInt",True)

    Goo.Hide()
    This.Goo:=Goo

    Launch(App,*){
      Goo.Hide()
      Run(App.Text,SubStr(App.Text,1,InStr(App.Text,"\",,-1)))
    }
  }
  Show(){
    MouseGetPos(&x,&y)
    Diam:=This.Hole+This.Wall
    x:=x-Round(Diam/2),y:=y-Round(Diam/2)
    This.Goo.Show("x" x " y" y " w" Diam " h" Diam)
  }
  Hide(){
    This.Goo.Hide()
  }
}