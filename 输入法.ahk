GroupAdd,sogouList,ahk_exe QQ.exe
GroupAdd,sogouList,ahk_exe WINWORD.EXE
GroupAdd,sogouList,ahk_exe dota2launcher.exe
GroupAdd,sogouList,ahk_exe dota2.exe
GroupAdd,sogouList,ahk_exe firefox.exe
GroupAdd,sogouList,ahk_exe notepad.exe
;Add your exe file to set Sogou IME.

#NoTrayIcon
#Persistent  
Gui +LastFound  
hWnd := WinExist()  
DllCall( "RegisterShellHookWindow", UInt,hWnd )  
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )  
OnMessage( MsgNum, "ShellMessage")  
Return  
ShellMessage( wParam,lParam ) {  
  If ( wParam = 1 ) 
  {
    WinGetclass, WinClass, ahk_id %lParam%
    Sleep, 1000
    WinActivate,ahk_class %WinClass%
    IfWinActive,ahk_group sogouList
    {
        winget,WinID,id,ahk_class %WinClass%  
        SetLayout("E0200804",WinID)
    }
  }
}
SetLayout(Layout,WinID){
DllCall("SendMessage", "UInt", WinID, "UInt", "80", "UInt", "1", "UInt", (DllCall("LoadKeyboardLayout", "Str", Layout, "UInt", "257")))
}