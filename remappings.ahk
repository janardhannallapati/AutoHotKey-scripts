#NoTrayIcon
#SingleInstance force
#InstallKeybdHook
#Persistent
#HotkeyInterval,100
/*
 Remapped Capslock to CTRL + ALT +SHIFT as all AHK hotkeys begin with that combination to reduce keystrokes.
*/
*CapsLock::
  SetKeyDelay -1
  Send {Blind}{Ctrl DownTemp}{Alt DownTemp}{Shift DownTemp}
return

*CapsLock up::
  SetKeyDelay -1
  Send {Blind}{Ctrl Up}{Alt Up}{Shift Up}
return
