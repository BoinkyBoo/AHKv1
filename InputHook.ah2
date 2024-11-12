~*`::add_accent()

add_accent() {
  static accent_map :=
  Map('s','š'
     ,'S','Š'
     ,'a','à'
     ,'A','À')
  hook := InputHook('L1 *')
  hook.Start()
  hook.Wait()
  if accent_map.Has(hook.Input)
    Send('{BackSpace}' accent_map[hook.Input])
  else Send(hook.Input)
}