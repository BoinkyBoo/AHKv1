#Requires AutoHotkey 2.0+                                                          ;Needs AHK v2
#SingleInstance Force                                                              ;Run only one instance
CoordMode "Mouse"                                                                  ;Set mouse coords to Screen

GuiMap:=Map("Firefox","C:\Program Files\Mozilla Firefox\firefox.exe"               ;Store locations of apps and
           ,"Edge","C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"  ;directories as referenced by
           ,"Folder 1","C:\"                                                       ;thier button text:
           ,"Folder 2","C:\Users\" A_UserName "\")                                 ;Button Text->App/Dir location

GuiMenu:=Gui("+AlwaysOnTop +ToolWindow -Caption","GuiMenu")                        ;Make GuiMenu a Gui object
GuiMenu.AddButton("w80","Firefox").OnEvent("Click",GuiButtons)                     ;Add relevent buttons and make
GuiMenu.AddButton("w80","Edge").OnEvent("Click",GuiButtons)                        ;them call the GuiButtons func
GuiMenu.AddButton("w80","Folder 1").OnEvent("Click",GuiButtons)                    ;when clicked - passing the
GuiMenu.AddButton("w80","Folder 2").OnEvent("Click",GuiButtons)                    ;button's text along with it
GuiMenu.AddButton("w80","Close").OnEvent("Click",GuiButtons)                       ;...
Return                                                                             ;End of main script

F1::{                                                                              ;Hotkey to show/hide gui
  If !WinExist("GuiMenu"){                                                         ;  If the Gui is NOT showing
    MouseGetPos(&xPos,&yPos)                                                       ;    Get the mouse's position
    GuiMenu.Show("x" xPos " y" yPos)                                               ;    Show gui at that position
  }Else                                                                            ;  Or, if it's already showing
    GuiMenu.Hide()                                                                 ;    Hid it
}                                                                                  ;End Hotkey block

GuiButtons(BTN,*){                                                                 ;Button call Func
  If (BTN.Text!="Close")                                                            ;  If button is NOT Exit
    Run(GuiMap[BTN.Text])                                                          ;    Run App/Dir matching button text
  GuiMenu.Hide()                                                                   ;  Hide the gui
}                                                                                  ;End Func block
