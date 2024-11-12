*CapsLock::{
  If KeyWait("CapsLock","T.3")
    Send("{Esc}")
  Else{
    Send("{Blind}{Ctrl Down}")
    KeyWait("CapsLock")
  }
}
*CapsLock Up::Send("{Ctrl Up}")
