TST:=["01 - A Title Full Of Words1.mp3","02. The Title I Wrote2.mp3"
     ,"03 The Title, Or Is It3.mp3","04Too Short For A Title4.mp3"
     ,"5 - Title5.mp3","6. Title6.mp3","7 Title7.mp3","Title8.mp3"]

ARR:=["a","and","as","at","but","by","down","for","from","if","in","into","like"
     ,"near","nor","of","off","on","once","onto","or","over","past","so","than"
     ,"that","the","to","upon","when","with","yet"]
;                                                                             80
#HotIf WinActive("ahk_class CabinetWClass")
    || WinActive("ahk_class ExplorerWClass")
F13::{
  SRC:=GetPath()
  Loop Files SRC "*.mp3","F"{
    FIL:=OLD:=A_LoopFileName
    If RegExMatch(OLD,"`aim)^\d+",&T)
      TRK:=SubStr(OLD,T.Pos,T.Len)
    Else
      TRK:="--"
    If RegExMatch(OLD,"`aim)[a-zA-Z]+",&F)
      FIL:=SubStr(OLD,F.Pos)
    Else
      FIL:="--"
    MsgBox(TRK "`n" FIL)
  }
}

F14::{
  SRC:=GetPath()
  Loop Files SRC "*.mp3","F"{
    FIL:=OLD:=A_LoopFileName
    For WRD in ARR
      FIL:=RegExReplace(FIL,"`aim)([^(\.|\d)].*) " WRD " (.*)","$1 " WRD " $2")
    If (OLD!==FIL){
      MSG:=MsgBox(OLD "`n" FIL,"Process","0x23")
      If (MSG="Yes")
        FileMove(SRC OLD,SRC FIL)
    }
  }
}

F15::{
  SRC:=GetPath()
  Loop Files SRC "*.mp3","F"{
    OLD:=A_LoopFileName
    MTC:=RegExMatch(OLD,"^(\d{2}) ?(-\.)? ?(.*)")
    If !MTC
       MsgBox("Error: " OLD)
    CUR:=RegExReplace(OLD,"^(\d{2})( |-|\.)*(.*)","$1$3")
    MsgBox(MTC "`n" OLD "`n" CUR)
;    Break
  }
}

F16::{
  SRC:=GetPath()
  Loop Files SRC "*.mp3","F"{
    WRD:=A_LoopFileName
    TMP:=RegExReplace("00" WRD,"^\d*(\d{2})( |-|\.)*(.*)","$1$3")
    TRK:=SubStr(TMP,1,2)
    TTL:=SubStr(TMP,3)
    For REP in ARR
      TTL:=RegExReplace(TTL,"`aim)^(.*) " REP " (.*)","$1 " REP " $2")
    MsgBox(TRK " ~ " TTL)
  }
}
#HotIf

GetPath(){
  hwnd:=""
  Prc:=WinGetProcessName("ahk_id " hwnd:=hwnd?hwnd:WinExist("A"))
  If (Prc="explorer.exe")
  && (WinGetClass("ahk_id " hwnd)~="(Cabinet|Explorer)WClass"){
    For Win in ComObject("Shell.Application").Windows
      If (Win.hwnd==hwnd)
        Path:=Win.Document.FocusedItem.path
    SplitPath(Path,,&Dir)
    Return Dir "\"
  }
}
