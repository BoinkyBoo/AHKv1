#Requires AutoHotkey 2.0.3+
#SingleInstance Force

<^>!u::
<^>!l::
<^>!t::
{
  Static FK:=Map("<^>!u","{:U}","<^>!l","{:L}","<^>!t","{:T}")
  A_Clipboard:=""
  Send "^c"
  ClipWait 2
  A_Clipboard:=Format(FK[A_ThisHotkey],A_Clipboard)
  Send "^v"
}