#Requires AutoHotkey 2.0+

MyGui:=Gui()
MyGui.AddLink("",'Open <a>Test</a>?').OnEvent("Click",(*) => Run("E:\Downloads\Test.txt"))
MyGui.AddText("","Open Test").OnEvent("Click",(*) => Run("E:\Downloads\Test.txt"))
MyGui.Show()