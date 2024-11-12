#Requires AutoHotkey 2.0.18+
#SingleInstance Force
;                                                                             80
MNU:=CreateMenu()

F1::MNU.Show()

CreateMenu(){
  M00:=Menu()

  M01:=Menu()
  M00.Add("&1. Sub A",M01)

  M02:=Menu()
  M00.Add("&2. Sub B",M02)

  M03:=Menu()
  M00.Add("&3. Sub C",M03)

  M01.Add("&1. Aardvark",HND)
  M01.Add("&2. Alpaca",HND)
  M01.Add("&3. Anteater",HND)

  M02.Add("&1. Baboon",HND)
  M02.Add("&2. Bear",HND)
  M02.Add("&3. Boar",HND)

  M03.Add("&1. Cat",HND)
  M03.Add("&2. Chicken",HND)
  M03.Add("&3. Cockwomble",HND)

  Return M00

  HND(ITM,*){
    MsgBox('"' SubStr( ITM,5) '"')
;    ClipBAK:=ClipboardAll()
;    A_Clipboard:=SubStr(ITM,5)
;    SendEvent("^v")
;    A_Clipboard:=ClipBAK
  }
}

/*
MNU:=CreateMenu()
F1::MNU.Show()

CreateMenu(){
  M00:=Menu()
    M01:=Menu()
    M01.Add("&1. Aardvark",HND)
    M01.Add("&2. Alpaca",HND)
    M01.Add("&3. Anteater",HND)
  M00.Add("&1. Sub A",M01)
    M02:=Menu()
    M02.Add("&1. Baboon",HND)
    M02.Add("&2. Bear",HND)
    M02.Add("&3. Boar",HND)
  M00.Add("&2. Sub B",M02)
    M03:=Menu()
    M03.Add("&1. Cat",HND)
    M03.Add("&2. Chicken",HND)
    M03.Add("&3. Cockwomble",HND)
  M00.Add("&3. Sub C",M03)
  Return M00
  HND(ITM,*){
    ClipBAK:=ClipboardAll()
    A_Clipboard:=SubStr(ITM,5)
    SendEvent("^v")
    A_Clipboard:=ClipBAK
  }
}
*/