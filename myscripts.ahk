;TODO if both anki and VLC are open it is clashing as they share the same frame.
#SingleInstance force
#InstallKeybdHook
#Persistent
#HotkeyInterval,100
SetKeyDelay, -1


/*
 common function use to change slide in powerpoint or scroll  in broswers etc

*/

SendToOtherWindow(command)
{
    
    winActivate
    ;msgbox command
    ;msgbox %command%
	Send %command%
	Send, !{Esc}
	return
	
}


/*
 To scroll through slides in power point

*/

#IfWinExist ahk_class PP12FrameClass

^+!PgDn::

    ;ApplyCommand(0)	
    SendToOtherWindow("{PgDn}")
	return

^+!PgUp::

	
	SendToOtherWindow("{PgUp}")
	return

#IfWinExist


/*
 To open Google search from clipboard text
 TODO parse text, if it contains http -open the link in a browser rather than searching for it.
  if the search contains Git ,clone the project into a default folder
 */

^+c::
{


Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}



/*
 To pause/play all media players with one shortcut.
*/


;For windows media player
#IfWinExist ahk_class WMP Skin Host
;#!End::
^+!End::
 SendToOtherWindow("^p")
 ;winmedia
 return 
#IfWinExist

;For VLC media player. TODO change class to include title as well 
;as QWidget class is same for Anki as well
#IfWinExist ahk_class QWidget
^+!End::
  SendToOtherWindow("{Space}")
  ;vlc 
  return
#IfWinExist


/*
Common command to open a particular program or activate it if it is already open.
*/
runprogram(myclass,command)
{
	IfWinExist ahk_class myclass
	{
	 WinActivate
	}
	else
	{
	 Run %command%
	}
	;return

}

/*
Global hotkeys for frequently used programs.
*/

^+!N::
runprogram(SunAwtFrame,"C:\Program Files\NetBeans 7.4 RC1\bin\netbeans64.exe")
return

/*
 opem Firefox 
*/
^+!F:: 
runprogram(MozillaWindowClass,"C:\Program Files (x86)\Mozilla Firefox\firefox.exe" )
return

/*
  open sublime
*/
^+!S::
runprogram(PX_WINDOW_CLASS,"C:\Program Files\Sublime Text 3\sublime_text.exe") 
return
/*
  open Chrome
*/
^+!C:: 
runprogram(Chrome_WidgetWin_1,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return
/*
  Open Anki
*/

;Anki QWidget, fix the shared class problem with vlc
^+!A:: 
runprogram(QWidget,"C:\Program Files (x86)\Anki\anki.exe")
return 

/*
  Open Ever Note
*/
^+!E:: 
runprogram(ENMainFrame,"C:\Program Files (x86)\Evernote\Evernote\Evernote.exe")
 ;Evernoteahk_class 
return
/*
  Open commandline
*/
^+!K:: 
runprogram(ConsoleWindowClass,"%windir%\system32\cmd.exe")
return
;^+!Z:: Run "C:\Windows\SysWOW64\cscript.exe "C:\Program Files (x86)\Zimbra\Zimbra Desktop\win32\zdrun.vbs"

/*
  open windows word
*/
^+!W:: 
runprogram(OpusApp,"winword")
return

/*
  open windows Excel
*/
;
^+!X:: 

runprogram(PP12FrameClass,"Excel")
return


;explorer Startup ahk_class CabinetWClass
;Computer ahk_class CabinetWClass

;^+!:: Run ""
;^+!:: Run ""
;^+!:: Run ""
;^+!:: Run ""
;^+!:: Run ""

/*
 End - Global hotkeys for frequently used programs.
*/

/*
Scroll window on browsers 
*/


^+!Up::
	IfWinExist ahk_class Chrome_WidgetWin_1
	{

         SendToOtherWindow("{Up}")		 
		 return
	}	
	return

^+!Down:: 
	IfWinExist ahk_class Chrome_WidgetWin_1
	{

	   SendToOtherWindow("{Down}")		 
		return
	 
	}
	return

/*
TODO     

Try to control otherwindow without activating it. currently it does not work .
 1. PDF scroll up/down
 2. Browser scroll up/down 
 3. Caret browsing in chrome and single command between FF,Chrome
 4. split window with one command
 5. Open commandline from current directory
 6. display off
 7.shutdown
 8.clear history
 9. shortcuts to open browsers, evernote,anki,zimbra,netbeans,dashlane
 10.universal search
 11. pause/play - flash video,quicktime,HTML5 video,Real video
 12. Node js execution and testing shortcuts.
 13. Git shortcuts/ Direct check in from editor
 14. Database startup
 15. login into EC2 etc
 16. play/pause music in one click
 17.google search across its portals (images,recipes,maps,blogs,videos etc)
 18.Elimate any thing which is repetitive and involve multiple steps from any editors
 19. Rapidly Find documentation for JavaScript,CSS, Java,NodeJS etc
 20. Directly open somesites Facebook,Gmail etc with one click
 21. Try to create a template website with different layout/colors/images with a shortcut
 22. Volume up, down with shortcuts
 23. Focus mode in one click (blocks email, allows only whitelist sites)
 24. shortcut to add to pocket
 25. close all windows

*/

/*
;WinGet, original, ID, A
;WinActivate, Windows Media Player

;WinActivate, ahk_id %original%

sendinput {Media_Play_Pause}
sleep 300000
sendinput {Media_Play_Pause}
YEOMAN

*/

/*
Close All windows and shutdown
*/

^+!q::

GroupAdd, AllWindows 

WinClose, ahk_group AllWindows

Return


ToggleWinMinimize(TheWindowTitle)
{
	SetTitleMatchMode,2
	DetectHiddenWindows, Off
	IfWinActive, %TheWindowTitle%
	{
		WinMinimize, %TheWindowTitle%
	}
	Else
	{
				IfWinExist, %TheWindowTitle%
		{
			WinGet, winid, ID, %TheWindowTitle%
			DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
		}
	}
	
	Return
}

/*
WinGet, SavedWinId, ID, A     ;Save our current active window
WinActivate ahk_id %SavedWinId%  ;Restore original window

*/