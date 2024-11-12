DIR:=[]
DIR.Push({N:"Name",L:"C:\System\"})
MsgBox(DIR[1].N "`n" DIR[1].L "`n" DIR.Length)

ARR:=[{A:"1:1",B:"1:2"},{A:"2:1",B:"2:2"}]
MsgBox(ARR[1].B " (" ARR.Length ")")

/*
DIR:=[]
DIR.Push({1:"Name",2:"C:\System\"})
MsgBox(DIR[1].1 "`n" DIR[1].2 "`n" DIR.Length)
*/

REG:=Map("M1",".*?17uEB[^\{]*\{bo.*?\}\.Lib.*"
        ,"R1","`aim)(.*?17uEB[^\{]*\{)bo.*?(\}\.Lib.*)"
        ,"M2",".*?3SkuN[^\{]*\{bo.*?\}.*"
        ,"R2","`aim)(.*?3SkuN[^\{]*\{)bo.*?(\}.*)")
MsgBox(REG["M1"])

REG:=[{M:".*?17uEB[^\{]*\{bo.*?\}\.Lib.*"
      ,R:"`aim)(.*?17uEB[^\{]*\{)bo.*?(\}\.Lib.*)"}
     ,{M:".*?3SkuN[^\{]*\{bo.*?\}.*"
      ,R:"`aim)(.*?3SkuN[^\{]*\{)bo.*?(\}.*)"}]
MsgBox(REG[1].M)