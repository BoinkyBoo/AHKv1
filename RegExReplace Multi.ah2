W:="téštíñg"
MsgBox(SCA(W))
MsgBox(SCB(W))
MsgBox(RER(W,["á|â|ā|ą","a","ć|č|ç","c","đ","d","é|è","e","í","i","ł","l"
            ,"ń|ñ","n","ó|ö|ø","o","ś|š","s","ú|ŭ","u","ý","y","ź|ž","z"]))

SCA(S){  ;First Attempt
  S:=RegExReplace(S,"á|â|ā|ą","a")
  S:=RegExReplace(S,"ć|č|ç","c")
  S:=RegExReplace(S,"đ","d")
  S:=RegExReplace(S,"é|è","e")
  S:=RegExReplace(S,"í","i")
  S:=RegExReplace(S,"ł","l")
  S:=RegExReplace(S,"ń|ñ","n")
  S:=RegExReplace(S,"ó|ö|ø","o")
  S:=RegExReplace(S,"ś|š","s")
  S:=RegExReplace(S,"ú|ŭ","u")
  S:=RegExReplace(S,"ý","y")
  S:=RegExReplace(S,"ź|ž","z")
  Return S
}

SCB(S){  ;Second Attempt
  A:=["á|â|ā|ą","a","ć|č|ç","c","đ","d","é|è","e","í","i","ł","l"
     ,"ń|ñ","n","ó|ö|ø","o","ś|š","s","ú|ŭ","u","ý","y","ź|ž","z"]
  Loop A.Length/2
    S:=RegExReplace(S,A[A_Index*2-1],A[A_Index*2])
  Return S
}

RER(W,A){  ;Chaotic Simplify
  Loop A.Length/2
    I:=A_Index,W:=RegExReplace(W,A[I*2-1],A[I*2])
  Return W
}