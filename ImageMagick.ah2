;Crop middle WxH+R+D
S:="In.jpg",D:="Out.webp"
RunWait('magick "' S '" -crop 1471x1243+546+154 "' D '"',,"Hide")

;Appending vertically (+ => hori)
S:="SC1.jpg SC2.jpg SC3.jpg SC4.jpg",D:="SC0.webp"
RunWait('magick ' S ' -append ' D,,"Hide")
;Or
RunWait('magick SC1.jpg SC2.jpg SC3.jpg SC4.jpg -append SC0.jpg')

;Convert to webp + Quality 85%
RunWait('magick "' S '" -quality 85 "' D '"',,"Hide")

;Resize to 1200 wide + Quality 85%
S:="In.jpg",D:="Out.webp",W:=1200
RunWait('magick "' S '" -quality 85 -resize x' W ' "' D '"',,"Hide")
