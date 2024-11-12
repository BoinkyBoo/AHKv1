#Requires AutoHotkey 2.0+
#SingleInstance Force

RunWait('schtasks.exe /Run /tn "AutorunScripts"')
;                      ^    ^-Task Name
;                      +-Start a task immediately