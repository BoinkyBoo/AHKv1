#Requires AutoHotkey 2.0+
#SingleInstance Force
SetWorkingDir("E:\Coding\AHK\Resources\")
TraySetIcon("Norm.ico")            ;Set Default icon

#SuspendExempt                     ;Don't block these hotkeys
F1::Suspend(-1),SetIcon()          ;Toggle Sus'd + set icon
F2::Pause(-1),SetIcon()            ;Toggle Pause + set icon
#SuspendExempt False               ;Don't affect other hotkeys

SetIcon(){
  If A_IsPaused	&& A_IsSuspended   ;Both are active
    TraySetIcon("Both.ico",,True)  ;  Set icon for Both
  Else If A_IsPaused               ;Pause only
    TraySetIcon("Paus.ico",,True)  ;  Set icon for Pause
  Else If A_IsSuspended            ;Suspend only
    TraySetIcon("Susp.ico",,True)  ;  Set icon for Suspend
  Else                             ;Running normally
    TraySetIcon("Norm.ico",,True)  ;  Set Default icon
}