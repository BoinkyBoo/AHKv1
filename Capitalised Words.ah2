A:=["a","an","and","as","at","but","by","down","for","from","if","in","into"
   ,"like","near","nor","of","off","on","once","onto","or","over","past","per"
   ,"so","than","that","the","to","up","upon","when","with","via","yet"
   ,"1st","2nd","3rd","4th","5th","6th","7th","8th","9th"]

SetWorkingDir("E:\Downloads\CoC\")

Loop Files "*.*","FR"{
  P:=A_LoopFileFullPath
  SplitPath(P,,&D,&E,&N)
  D.="\"
  R:=RegExReplace(N,"__.*")
  R:=RegExReplace(R,"_"," ")
  R:=RegExReplace(R,"Vol ","v")
  R:=Format("{:T}",R)
  R:=RegExReplace(R,"V(\d)","v$1")
  R:=RegExReplace(R,"^Cha(\d)","CHA$1")
  For W in A
    If RegExMatch(R,"i)[^-] " W " ")
      R:=RegExReplace(R,"i) " W " "," " W " ")
  T:="N:`t" N "`nD:`t" D "`nE:`t" E "`n`nP:`t" P "`nR:`t" D R "." E
;  MsgBox(T)
  FileMove(P,D R "." E)
}
/* ###  Dir Check  ###
Loop Files "*.*","D"{
  N:=Format("{:T}",A_LoopFileName)
  F:=N
  For W in A
    If RegExMatch(N,"i) " W " ")
      F:=RegExReplace(N,"i) " W " "," " W " ")
;  MsgBox(N "`n" F)
  DirMove(A_LoopFileName,F,"R")
}
*/