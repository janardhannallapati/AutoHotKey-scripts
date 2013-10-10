#NoTrayIcon
#SingleInstance force
#InstallKeybdHook
#Persistent
#HotkeyInterval,100

*CapsLock::
  SetKeyDelay -1
  Send {Blind}{Ctrl DownTemp}{Alt DownTemp}{Shift DownTemp}
return

*CapsLock up::
  SetKeyDelay -1
  Send {Blind}{Ctrl Up}{Alt Up}{Shift Up}
return