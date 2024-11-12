a:=8453888     ;80FF00
r:=a>>>16      ;^^---- Shift Leaves Red
g:=a>>>8&0xFF  ;^^^^-- Ditto+Mask Green
b:=a&0xFF      ;^^^^^^ Mask Leaves Blue

MsgBox r " " g " " b
