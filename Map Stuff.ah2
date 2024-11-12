M:=Map(1,"A",2,"B",3,"C")
M.Set(4,"D",5,"E")
Key:=M.Get(4)
For K,V in M
  If (V="D")
    Val:=K
MsgBox Key ":" Val