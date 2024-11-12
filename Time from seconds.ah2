TT:=26**5*6

RY:=TT//31536000
TT:=Mod(TT,31536000)
RD:=TT//86400
TT:=Mod(TT,86400)
RH:=TT//3600
TT:=Mod(TT,3600)
RM:=TT//60
RS:=Mod(TT,60)

A_Clipboard:=RY "y " RD "d " RH "h " RM "m " RS "s."
MsgBox A_Clipboard
