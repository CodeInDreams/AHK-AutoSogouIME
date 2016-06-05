GroupAdd,cn,ahk_exe QQ.exe
GroupAdd,cn,ahk_exe WINWORD.EXE
GroupAdd,cn,ahk_exe dota2launcher.exe
GroupAdd,cn,ahk_exe dota2.exe
GroupAdd,cn,ahk_exe firefox.exe
GroupAdd,cn,ahk_exe notepad.exe
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
    WinActivate,ahk_class %Winclass%
    ;MsgBox,%WinClass%
    IfWinActive,ahk_group cn
    {
        winget,WinID,id,ahk_class %WinClass%  
        SetLayout("E0200804",WinID)
    }
  }
}
SetLayout(Layout,WinID){
DllCall("SendMessage", "UInt", WinID, "UInt", "80", "UInt", "1", "UInt", (DllCall("LoadKeyboardLayout", "Str", Layout, "UInt", "257")))
}