v:=4210000
h:=3600000
m:=60000
s:=1000
i:=""

i.=Floor(v/h) "h ",h:=Mod(v,h)
i.=Floor(h/m) "m ",m:=Mod(h,m)
i.=Floor(m/s) "s",s:=Mod(v,s)
MsgBox v "`n" i