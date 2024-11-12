#Requires AutoHotkey 2.0+
#SingleInstance Force

g:=[860510,1281590,1194630,1567020,2478970,2186680]
l:="https://store.steampowered.com/app/"
For i in g
  Run(l i)