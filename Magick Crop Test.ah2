SetWorkingDir("E:\Downloads\The Looney\")
CoordMode("ToolTip")
CoordMode("Mouse")
CoordMode("Pixel")
;                                                                             80
SW:=A_ScreenWidth,SH:=A_ScreenHeight
AL:=546,AT:=154,AR:=2017,AB:=1397
PT:="The Looney ",PE:=".png"
Loop Files,"*.*","F"{
  FT:=A_LoopFileName
  RunWait('magick "' FT '" -crop 1471x1243+546+154 "E:\Downloads\TL\' FT '"',,"Hide")  ;Crop middle WxH+R+D
}
;RunWait('magick "' i '" -quality 85 -resize x' s ' "' d ' TMP\' tmp '"',,"Hide")  ;Resize to set width
