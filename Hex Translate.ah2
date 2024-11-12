DAT:="596f752068617665206e6f20646f6d696e696f6e20686572652c206372656174757265206f6620636c61792e"
ARR:=[]
STR:=""

If Mod(StrLen(DAT),2)
  MsgBox("Failed!"),ExitApp

Loop (StrLen(DAT)/2)
  ARR.Push("0x" SubStr(DAT,A_Index*2-1,2))

Loop ARR.Length
  STR.=Chr(ARR[A_Index])

MsgBox STR