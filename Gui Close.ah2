#Requires AutoHotkey 2.0+
make_gui()

make_gui() {
  goo := Gui()
  goo.OnEvent("Close", close_script)
  goo.Show("x100 y100 w400 h200")
}

close_script(*) {
  ExitApp()
}
/*
; Or

#Requires AutoHotkey 2.0+
make_gui()

make_gui() {
  goo := Gui()
  goo.OnEvent("Close", (*) => ExitApp())
  goo.Show("x100 y100 w400 h200")
}