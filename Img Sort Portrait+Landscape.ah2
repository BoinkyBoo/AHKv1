#Requires AutoHotkey 2.0+                   ;Needs AHK v2
#SingleInstance Force                       ;Run only one instance

PicSort("E:\Downloads\Imgur\")              ;Execute PicSort() with given path
Return                                      ;End execution here

PicSort(Dir){                               ;Main Function
  Static Ext:="i)(jpe?g|png|bmp|gif|webp)"  ;  Remember file types
  Static DirP:=Dir "Portrait\"              ;  Remember SubDirs
  Static DirL:=Dir "Landscape\"             ;  ...
  Static DirE:=Dir "Equal\"                 ;  ...
  If !DirExist(DirP)                        ;  If SubDirs don't exist
    DirCreate(DirP)                         ;    Create them
  If !DirExist(DirL)                        ;  ...
    DirCreate(DirL)                         ;    ...
  If !DirExist(DirE)                        ;  ...
    DirCreate(DirE)                         ;    ...
  Loop Files,Dir "*.*","F"                  ;  Loop through given Dir
    If (A_LoopFileExt~=Ext){                ;    If FileExt matches image type
      F:=A_LoopFileName                     ;      Store a short name
      Size:=PicSize(F,Dir)                  ;      Get image dimensions
      W:=Size.W,H:=Size.H                   ;      Split Width and Height
      If (W>H)                              ;      If Landscape
        FileMove(Dir F,DirL F)              ;        Move to Landscape dir
      Else If (W<H)                         ;      Or, If Portrait
        FileMove(Dir F,DirP F)              ;        Move to Portrait dir
      Else                                  ;      Otherwise
        FileMove(Dir F,DirE F)              ;        Move to Equal dir
    }                                       ;    End If block
}                                           ;End Func block

PicSize(File,Dir){                          ;Image Size Function
  Shell:=ComObject("Shell.Application")     ;  Create a Shell object
  Folder:=Shell.NameSpace(Dir)              ;  Get Folder from the Dir
  Item:=Folder.ParseName(File)              ;  Get File's Name
  Scale:=StrSplit(RegExReplace(Folder       ;  Retrieve the file's info 
    .GetDetailsOf(Item,31)                  ;    regarding file dimensions
    ,".(.+).","$1")," x ")                  ;    and parse to W and H
  Return {W:Scale[1],H:Scale[2]}            ;  Pass dimensions back
}                                           ;End Func block