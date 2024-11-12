DIR:="E:\Downloads\"
;                                                                             80
Loop Files DIR "*.htm"{
  FIL:=A_LoopFileName
  TTL:=SubStr(FIL,1,-4)
  HTM:=FileRead(DIR FIL)
  HTM:=Fix(HTM)
;  MsgBox StrLen(HTM)
  FileAppend(HTM,DIR TTL ".txt")
}

Fix(HTM){
  HTM:=RegExReplace(HTM,'s)^.*?faqspan-1">')
  HTM:=RegExReplace(HTM,'s)</pre></div>.*')
  HTM:=RegExReplace(HTM,"&amp;","&")
  HTM:=RegExReplace(HTM,"&lt;","<")
  HTM:=RegExReplace(HTM,"&gt;",">")
  HTM:=RegExReplace(HTM,"&quot;",'"')
  Return HTM
}