#Requires AutoHotkey 2.0+                                      ;Needs AHK v2
#SingleInstance Force                                          ;Run only one instance

Main:=Gui("+AlwaysOnTop +LastFound +E0x08000000","Shortcuts")  ;Assign 'PS' as a Gui Object
Main.SetFont("cWhite")                                         ;Set the font colour to White
Main.BackColor:="3A3A3B"                                       ;Set the back colour to Grey
WinSetTransColor("3A3A3Bb 200")                                ;Set the background to transparant
Main.AddButton("x10 y10 w60 h60","Clear Rotation")             ;Add a button named 'Clear Rotation'
  .OnEvent("Click",(*) => Send("1"))                           ;  Send '1' when above is clicked
Main.Show("x1300 y50 w300 h700 NA")                            ;Show the gui
Return                                                         ;Stop code flow here

/*
#Requires AutoHotkey 2.0+                                      ;Needs AHK v2
#SingleInstance Force                                          ;Run only one instance

Main:=Gui("+AlwaysOnTop +LastFound +E0x08000000","Shortcuts")  ;Assign 'PS' as a Gui Object
Main.SetFont("cWhite")                                         ;Set the font colour to White
Main.BackColor:="3A3A3B"                                       ;Set the back colour to Grey
WinSetTransColor("3A3A3Bb 200")                                ;Set the background to transparant
Main.AddButton("x10 y10 w60 h60","Clear Rotation")             ;Add a button named 'Clear Rotation'
  .OnEvent("Click",GuiButtons)                                 ;  Call 'GuiButtons' when clicked
Main.Show("x1300 y50 w300 h700 NA")                            ;Show the gui
Return                                                         ;Stop code flow here

GuiButtons(BTN,*){                                             ;Buttons routed to this Func
  Switch BTN.Text{                                             ;  Get the text of the button clicked
    Case "Clear Rotation":Send("x")                            ;    If it's 'Clear Rotation', send 1
    Default:MsgBox(BTN.Text " not coded!")                     ;    If the button isn't listed say so
  }                                                            ;  End Switch block
}                                                              ;End Func block
*/