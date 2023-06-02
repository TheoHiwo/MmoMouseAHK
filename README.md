# MmoMouseAHK

Enhance a MmoMouse with even more shortcuts by combining two buttons based on active window context.
```
; 9 possible shortcuts with button1 in app1:

#IfWinActive, ahk_InApp1
  button1::
    SendInput A
  return

  button1 & fireButton::
    SendInput B
  return
  
  fireButton & button1::
    SendInput C
  return

  button1 & Mbutton::
    SendInput D
  return

  Mbutton & button1:: 
    SendInput E
  return

  button1 & LButton::
    SendInput F
  return

  button1 & Rbutton::
    SendInput G
  return

  button1 & Wheelup:: 
    SendInput H
  return

  button1 & Wheeldown:: 
    SendInput I
  return
  
; Repeat for the 11 overs mouse's side buttons (108 shortcuts, you will need an excel and some practice):
#IfWinActive, ahk_InApp1
  button1::
  ...
  button12::

; Repeat for as other apps as you want:
#IfWinActive, ahk_Chrome
  button1::
  ...
  button12::

#IfWinActive, ahk_VsCode
  button1::
  ...
  button12::
  
;It's good practice to have default shortcuts for all your apps:
In all your computer:

button1 & Wheeldown:: 
  SendInput Ctrl+C
return
  
button1 & Wheelup:: 
  SendInput Ctrl+V
return

  
  
 ```
![image](https://github.com/TheoHiwo/MmoMouseAHK/assets/35316996/0e5debb8-acc4-44e2-97af-aacb4115aa8f)
