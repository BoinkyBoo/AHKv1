OnExit (*) => SystemCursor("Show")

#c::SystemCursor("Toggle")

SystemCursor(cmd){
  Static visible:=True,c:=Map()
  Static sys_cursors:=[32512,32513,32514,32515,32516,32642
                      ,32643,32644,32645,32646,32648,32649,32650]
  If (cmd = "Reload" or !c.Count){
    For i,id in sys_cursors{
      h_cursor:=DllCall("LoadCursor","Ptr",0,"Ptr",id)
      h_default:=DllCall("CopyImage","Ptr",h_cursor
        ,"UInt",2,"Int",0,"Int",0,"UInt",0)
      h_blank:=DllCall("CreateCursor","Ptr",0,"Int",0,"Int",0,"Int",32
        ,"Int",32,"Ptr",Buffer(32*4,0xFF),"Ptr",Buffer(32*4,0))
      c[id]:={default:h_default,blank:h_blank}
    }
  }
  Switch cmd{
    Case "Show":visible := true
    Case "Hide":visible := false
    Case "Toggle":visible := !visible
    Default:return
  }
  For id,handles in c{
    h_cursor:=DllCall("CopyImage","Ptr",visible?handles.default:handles.blank
      ,"UInt",2,"Int",0,"Int",0,"UInt",0)
    DllCall("SetSystemCursor","Ptr",h_cursor,"UInt",id)
  }
}
