;                                                                             80
SetWorkingDir("E:\Downloads\")
OSD:=OnScreenDisplay()
OnClipboardChange(OSD.Update)
A_Clipboard:="'F1' to Format Episodes`n'F3' to Write to File" 

F1::OSD.Clip
F3::OSD.Do

Class OnScreenDisplay{
  __New(){
    OSD:=Gui("+AlwaysOnTop +ToolWindow -Caption +E0x20","OSD",This)
    OSD.SetFont("s12 cLime","Consolas")
    OSD.BackColor:="F40404"
    WinSetTransColor("F40404 250",OSD)
    This.TXT:=OSD.AddText("x0 y0 w500 h300 +Background040404",A_Clipboard)
    OSD.Show("x10 y" A_ScreenHeight-310)
    This.OSD:=OSD
  }
  Update(*){
    OSD.TXT.Value:=A_Clipboard
  }
  Clip(){
    ARR:=[]
    TMP:=RegExReplace(A_Clipboard,"`aim)^(\r|\n| )*(.*)","$2")
    Loop Parse TMP,"`n","`r"
      ARR.Push(A_LoopField)
    If RegExMatch(ARR[1],"`aim)^ *(S|V)(\d\d)E(\w\w) –(.*)$")
      If (SubStr(ARR[1],-9)=SubStr(ARR[ARR.Length],-9))
        A_Clipboard:=RegExReplace(A_Clipboard,"`aim)^ *(S|V)(\d\d)E(\w\w) –(.*)$","$2$3")
      Else
        A_Clipboard:=RegExReplace(A_Clipboard,"`aim)^ *(S|V)(\d\d)E(\w\w) –(.*)$","$2$3$4")
    Else
      A_Clipboard:=RegExReplace(A_Clipboard,"`aim)^.*?–? (.*)$","$1")
    A_Clipboard:=RegExReplace(A_Clipboard,"(.*)\r?\n?$","$1")
  }
  Do(){
    SRC:=[],DST:=[],CTR:=0,LEN:=2
    Loop Parse A_Clipboard,"`n","`r"
      SRC.Push(A_LoopField)
    Loop Files "*.mp3"
      DST.Push(A_LoopFileName)
    If (SRC.Length!=DST.Length) && (SRC.Length!=1){
      MsgBox(SRC.Length ":" DST.Length)
    }Else{
      If (DST.Length>99)
        LEN:=3
      Loop DST.Length{
        FIL:=DST[A_Index]
        TRK:=SubStr(FIL,1,LEN)
;        SAV:=TRK " - " SRC[TRK] ".mp3"
        SAV:=SRC[TRK] ".mp3"
;        MsgBox(FIL "`n" SAV)
        FileMove(FIL,SAV)
      }
    }
  }
}