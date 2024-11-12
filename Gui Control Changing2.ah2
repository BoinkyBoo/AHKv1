#Requires AutoHotkey 2.0+                                ;Needs v2
#SingleInstance Force                                    ;Run only one instance

Main:=Gui(,"GuiTitle")                                   ;Create blank Gui
Main.AddButton("x8  y0 w84 h30","Target" )               ;Add button to Target
 .OnEvent("Click",Clicked)                               ; AND it's click event
Main.AddButton("x+4 yp wp  hp ","Disable")               ;Add button to Disable
 .OnEvent("Click",Clicked)                               ; AND it's click event
Main.AddButton("x+4 yp wp  hp ","Enable" )               ;Add button to Enable
 .OnEvent("Click",Clicked)                               ; AND it's click event
Main.AddButton("x+4 yp wp  hp ","Toggle" )               ;Add button to Toggle
 .OnEvent("Click",Clicked)                               ; AND it's click event
Main.Show()                                              ;Display the Gui

F1::{                                                    ;Hotkey to toggle button
  IsEnabled:=ControlGetEnabled("Target","GuiTitle")      ;  Get state of button
  ControlSetEnabled(!IsEnabled,"Target","GuiTitle")      ;  Set the opposite state
}                                                        ;End Hotkey block

Clicked(Button,*){                                       ;Func called from buttons
  Switch Button.Text{                                    ;  Get text of button hit
    Case "Target":                                       ;    If button is 'Target'
      MsgBox("Nobody here but us chickens!")             ;      Do something
    Case "Disable":                                      ;    If button is 'Disable'
      ControlSetEnabled(0,"Target","GuiTitle")           ;      Disable 'Target'
    Case "Enable":                                       ;    If button is 'Enable'
      ControlSetEnabled(1,"Target","GuiTitle")           ;      Enable 'Target'
    Case "Toggle":                                       ;    If button is 'Toggle'
      IsEnabled:=ControlGetEnabled("Target","GuiTitle")  ;      Get state of button      
      ControlSetEnabled(!IsEnabled,"Target","GuiTitle")  ;      Set the opposite state
  }                                                      ;  End Switch block
}                                                        ;End Func block