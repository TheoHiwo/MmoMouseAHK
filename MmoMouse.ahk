;_____________________________________________________________________________________________
;region ;;INIT

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#InstallKeybdHook
SetTitleMatchMode 2

if not (RegExMatch(DllCall("GetCommandLine", "str"), " /restart(?!\S)")) {
  Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%",, UseErrorLevel
  ExitApp
}

;Key list
;1 XButton1
;2 PgUp
;3 Home
;4 ScrollLock
;5 PgDn
;6 End
;7 Pause
;8 Browser_Stop
;9 Browser_Favorites
;10 Insert
;11 Browser_Refresh
;12 Delete
;13 XButton2

;endregion
;_____________________________________________________________________________________________
;region ;;GROUPS
;ADOBE
GroupAdd, Adobe, ahk_exe Photoshop.exe

;GROUPE NOT ACTIVE
;GroupAdd, MmoNotActive, ahk_exe VRChat.exe
GroupAdd, MmoNotActive, ahk_exe NewWorld.exe
GroupAdd, MmoNotActive, ahk_exe BLUEPROTOCOL-Win64-Shipping.exe
;GroupAdd, MmoNotActive, ahk_exe League of Legends.exe
GroupAdd, MmoNotActive, ahk_exe VALORANT-Win64-Shipping.exe
GroupAdd, MmoNotActive, ahk_exe Spellbreak.exe
GroupAdd, MmoNotActive, ahk_exe ffxiv_dx11.exe
GroupAdd, MmoNotActive, ahk_exe GenshinImpact.exe
GroupAdd, MmoNotActive, ahk_exe BlackDesert64.exe
GroupAdd, MmoNotActive, ahk_exe PureRef.exe
GroupAdd, MmoNotActive, ahk_exe LOSTARK.exe

;GROUPE SUSPEND
GroupAdd, MmoSuspend, ahk_exe League of Legends.exe

;KANJITOMO
GroupAdd, Kanjitomogame, ahk_class SunAwtFrame
GroupAdd, Kanjitomogame, ahk_exe MonsterHunterRise.exe
GroupAdd, Kanjitomogame, - Yomichan Search -

;CODE  #IfWinActive, ahk_group Code
GroupAdd, Code, scrimba.com

;CODE BASE VSCODE #IfWinActive, ahk_group VsCode
GroupAdd, VsCode, ahk_exe Code.exe
GroupAdd, VsCode, Babylon.js Playground

#IfWinActive, ahk_group MmoSuspend
  ;rbutton:: Suspend, On
  rbutton:: ExitApp
  return
;endregion
;_____________________________________________________________________________________________
;_____________________________________________________________________________________________
;region ;;DISABLE
#IfWinActive, ahk_group MmoNotActive
  ;_____________________________________________________________________________________
  ; key should have a while state to be for holding KeyDown
  ;"Browser_" Don't need it

  ;1
  XButton1::
    While GetKeyState("XButton1", "p")
    {
      SendInput {XButton1 down}
      Sleep 50
    }
    SendInput {XButton1 up}
  return

  ;2
  PgUp::
    While GetKeyState("PgUp", "p")
    {
      SendInput {PgUp down}
      Sleep 50
    }
    SendInput {PgUp up}
  return

  ;3
  Home::
    While GetKeyState("Home", "p")
    {
      SendInput {Home down}
      Sleep 50
    }
    SendInput {Home up}
  return

  ;4
  ScrollLock::
    While GetKeyState("ScrollLock", "p")
    {
      SendInput {ScrollLock down}
      Sleep 50
    }
    SendInput {ScrollLock up}
  return

  ;5
  PgDn::
    While GetKeyState("PgDn", "p")
    {
      SendInput {PgDn down}
      Sleep 50
    }
    SendInput {PgDn up}
  return

  ;6
  End::
    While GetKeyState("End", "p")
    {
      SendInput {End down}
      Sleep 50
    }
    SendInput {End up}
  return

  ;7
  Pause::
  While GetKeyState("Pause", "p")
  {
    SendInput {Pause down}
    Sleep 50
  }
  SendInput {Pause up}
  return

  ;8
  Browser_Stop::
    SendInput {NumpadDiv}
  return

  ;9
  Browser_Favorites::
    SendInput {NumpadMult}
  return

  ;10
  Insert::
    While GetKeyState("Insert", "p")
    {
      SendInput {Insert down}
      Sleep 50
    }
    SendInput {Insert up}
  return

  ;11
  Browser_Refresh::
    SendInput {NumpadSub}
  return

  ;12
  Delete::
    While GetKeyState("Delete", "p")
    {
      SendInput {Delete down}
      Sleep 50
    }
    SendInput {Delete up}
  return

  ;13
  XButton2::
    While GetKeyState("XButton2", "p")
    {
      SendInput {XButton2 down}
      Sleep 50
    }
    SendInput {XButton2 up}
  return

;endregion
;_____________________________________________________________________________________________
;region ;;PRIO-DEFAULT
;_____________________________________________________________________________________________
; OVERRIDE default CTRL+Y to CTRL+SHIFT+Z
#IfWinActive, Rive, ahk_exe blender.exe
  PgDn & XButton2:: send {Ctrl down}{Shift down}z{Ctrl up}{Shift up}
  return
;________________________________________________
; OVERRIDE default BACKSPACE to DELETE
#IfWinActive, Rive, ahk_exe blender.exe
  XButton1 & Wheeldown:: send {delete}
  return
;________________________________________________

;FL STUDIO
#If WinActive("ahk_exe FL64.exe") and (!A_CaretX)
  ;1&whdn Delete
  XButton1 & Wheeldown:: send {delete}
  return
#IfWinActive, ahk_exe FL64.exe
  PgDn & XButton2:: send ^z
  return
  PgDn:: send ^!z
  return
;________________________________________________
;BLENDER
#IfWinActive, ahk_exe blender.exe
  ; 10 &whdn Select All A
  ~Insert & Wheeldown:: send a
  return
  ; 4&mclick alt+mb
  ScrollLock & mbutton::
    Send {Lalt downtemp}{mbutton downtemp}
    loop
    {
      sleep, 10
      getkeystate, state, ScrollLock,mbutton, p
      getkeystate, state, mbutton, p
      if state = u
        break
    }

    send {Lalt up}{mbutton up}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;DEFAULT
#IfWinNotActive, ahk_group MmoNotActive
  ;_____________________________________________________________________________________________
  ;1

  ; 1&lclick Echap
  XButton1 & LButton:: send {esc}
  return

  ;1&rclick Enter
  XButton1 & rbutton:: send {enter}
  return

  ;1&whup Space
  XButton1 & WheelUp:: send {space}
  return

  ;1&whdn Backspace
  XButton1 & Wheeldown:: send {backspace}
  return
  ;________________________________________________
  ; 3

  ; 3 Alt+Tab
  Home::
    Send, {ALTDOWN}{TAB}
    KeyWait, LCtrl
    KeyWait, LShift
    Send, {ALTUP}
  return

  ; 3 &13 Task View Win+Tab
  Home & XButton2::
    Send #{Tab}
  return

  ; 3 &mclick Create new virtual desktop Win+Ctrl+D
  Home & mbutton:: send #^d
  return

  ;mclick& 3 Close current virtual desktop Win+Ctrl+F4
  mbutton & Home:: send #^{f4}
  return

  ; 3 &lclick ShiftAltTab
  ;Home & LButton::ShiftAltTab
  ;return

  ; 3 &rclick AltTab
  ;Home & rbutton::AltTab
  ;return

  ;3 & whup Next Desktop
  Home & Wheelup:: send #^{right}
  return

  ; 3 &whdn Previous Desktop Win+Ctrl+Left
  Home & Wheeldown:: send #^{left}
  return

  ;________________________________________________
  ;4

  ;4 Alt hold
  ScrollLock::
    Send {Lalt downtemp}
    MouseMove, -2, 0, 0, R
    MouseMove, 1, 0, 0, R
    MouseMove, 1, 0, 0, R
    loop
    {
      sleep, 10
      getkeystate, state, ScrollLock, p
      if state = u
        break
    }
    send {Lalt up}
  return

  ; 4&mclick Ctrl x
  ScrollLock & mbutton:: send {Ctrl down}x{Ctrl up}
  return

  ;4 & whup Ctrl v
  ~ScrollLock & Wheelup:: send {Ctrl down}v{Ctrl up}
  return

  ; 4 &whdn Ctrl c
  ScrollLock & Wheeldown:: send {Ctrl down}c{Ctrl up}
  return
  ;________________________________________________
  ;5

  ;5Ctrl+Z
  PgDn:: send {Ctrl down}z{Ctrl up}
  return

  ;5Ctrl+Y
  PgDn & XButton2:: send {Ctrl down}y{Ctrl up}
  return

  ;5&lclick Left arrow
  PgDn & LButton:: send {left}
  return

  ;5&rclick Right arrow
  PgDn & rbutton:: send {right}
  return

  ;5&whup Up arrow
  PgDn & Wheelup:: send {up}
  return

  ;5&whdn Down arrow
  PgDn & Wheeldown:: send {down}
  return

  ;________________________________________________
  ; 7

  ;7 Ctrl Hold
  Pause::
  send {Lctrl downtemp}
  MouseMove, -1, 0, 0, R
  MouseMove, 1, 0, 0, R
  loop
  {
    sleep, 16
    getkeystate, state, Pause, p
    if state = u
      break
  }
  send {Lctrl up}
  return

  ; 7&mclick Media Play Pause
  ~Pause & ~mbutton:: send {Media_Play_Pause}
  return

  ;mclick& 7 Volume Mute
  ~mbutton & Pause:: send {Volume_Mute}
  return

  ;7& whup Volume Up
  Pause & Wheelup:: send {Volume_Up}
  return

  ; 7&whdn Volume Down
  Pause & Wheeldown:: send {Volume_Down}
  return
  ;________________________________________________
  ;8

  ; 8 &lclick General Color picker Ctrl+Shift+Alt+a
  Browser_Stop & LButton:: send ^+!a
  return

  ; 8 &rclick General screen capture Alt+Shift+T
  Browser_Stop & rbutton:: send !+t
  return

  ;8& whup Media Next
  Browser_Stop & Wheelup:: send {Media_Next}
  return

  ; 8&whdn Media Prev
  Browser_Stop & Wheeldown:: send {Media_Prev}
  return
  ;________________________________________________
  ;10 Shift hold
  Insert::
    send {Lshift downtemp}
    MouseMove, -2, 0, 0, R
    MouseMove, 1, 0, 0, R
    MouseMove, 1, 0, 0, R
    loop
    {
      sleep, 10
      getkeystate, state, Insert, p
      if state = u
        break
    }
    send {Lshift up}
  return

  ; 10 &whdn Ctrl+A
  ~Insert & Wheeldown:: send {Ctrl down}a{Ctrl up}
  return
  ;________________________________________________
  ; Mbutton
  ; 10 &whdn Ctrl+A
  Mbutton & Rbutton:: send #^t
  return

  ;_________________________________________________________________
  ;Keyboard

  LWin & sc028::sendinput [
  return
  LWin & *::sendinput ]
  return

  LWin & ^::sendinput (
  return
  LWin & $::sendinput )
  return

  LWin & sc034::sendinput {{}
    return
  LWin & !::sendinput {}}
  return

  LWin & <::sendinput <>{Left}
  return

  ;Moves your cursor to the end of the line
  LWin & Right::sendinput {End}
  return
  ;Moves your cursor to the start of the line
  LWin & Left::sendinput {Home}
  return

  ;Selects from current cursor position to end of line
  LWin & Up::sendinput +{End}
  return
  ;Selects from current cursor position to start of line
  LWin & Down::sendinput +{Home}
  return
  ;________________________________________________
  ;On-screen keyboard
  XButton2 & RButton:: send ^#o
  return
  ;________________________________________________
  ; 13 & LB OCR
  XButton2 & LButton:: send #+t
  return

#IfWinExist, ahk_exe osk.exe
  ;13 AltGr
  XButton2:: Send {Ralt down}
  XButton2 Up:: Send {Click Left}{Ralt up}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;CHROME SITES
;_____________________________________________________________________________________________

;________________________________________________
;LOCALHOST
#IfWinActive, local

  ; 12 refresh localhost
  Delete:: send ^r
  return

  ; 12 Console Ctrl+Maj+J
  Delete & Lbutton:: send ^+j
  return
;________________________________________________
;BABYLON JS
#IfWinActive, playground.babylonjs.com
  ;________________________________________________
  ; 12 Run
  Delete:: send !{Enter}
  return
;________________________________________________
;FIGMA
#IfWinActive, – Figma
  ;________________________________________________
  ; 1
  XButton1:: send p
  return

  ; Mbutton Pan
  MButton::
    Send {Space Down}{LButton Down}
    Keywait, MButton
    Send {LButton Up}{Space Up}
  Return

;________________________________________________
;SCRIMBA
#IfWinActive, scrimba.com
  ;________________________________________________
  ; 6 Comment selection
  End:: send ^:
  return
;________________________________________________
;ANIMELON
#IfWinActive, Animelon
  ;________________________________________________
  ; PlayBack
  rbutton:: send {Left}
  return
;________________________________________________
;ITAZURANEKOYOMI
#IfWinActive, 小説
  ;2 Alt hold
  PgUp::
    KeyDown := !KeyDown
    If KeyDown
      SendInput {Lalt down}
    Else
      SendInput {Lalt up}
  return
;________________________________________________
;ANIMEBOOK
#IfWinActive, Animebook
  ;________________________________________________

  ;Move upward
  Wheelup::
    GetKeyState, state, LAlt
    if state = D
      send {Lalt up}{Wheelup}{right}{Lalt down}
    Else
      send {Wheelup}{right}
  return

  ;Move backward
  Wheeldown::
    GetKeyState, state, LAlt
    if state = D
      send {Lalt up}{Wheeldown}{left}{Lalt down}
    Else
      send {Wheeldown}{left}
  return

  ;Move upward+ +
  RButton & Wheelup:: send !{up}
  return

  ;Move backward- -
  RButton & Wheeldown:: send !{down}
  return

  ; Skip next auto pause. Only applies in auto pause mode.
  RButton:: send \
  return

  ;auto pause mode
  End:: a
  return

  ;2 Alt hold
  PgUp::
    KeyDown := !KeyDown
    If KeyDown
      SendInput {Lalt down}
    Else
      SendInput {Lalt up}
  return

  ;13 Enter
  XButton2:: send {Enter}
  return

  MButton:: send {RButton}
  return

  !left:: send {left}
  return

  !right:: send {right}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;GOOGLE CHROME
#IfWinActive, ahk_exe chrome.exe
  ;_____________________________________________________________________________________________
  ; 1
  ; 1
  XButton1:: send {space}
  return

  ; 1 &13
  XButton1 & XButton2:: send ^+a
  return

  ; 1 & mclick Recherche
  XButton1 & mbutton:: send ^f
  return
  ;________________________________________________
  ; 2

  ; 2 Open a new tab, and jump to it
  PgUp:: send ^t
  return

  ; 2 & mclick Close the current tab
  PgUp & mbutton:: send ^w
  return

  ; 2&lclick Browser_Back
  PgUp & LButton:: send {Browser_Back}
  return

  ;2&rclick Browser_Forward
  PgUp & rbutton:: send {Browser_Forward}
  return

  ;2&whup Next Tab
  PgUp & WheelUp:: send ^{PgDn}
  return

  ;2&whdn Previous Tab
  PgUp & Wheeldown:: send ^{PgUp}
  return
  ;________________________________________________

  ; 4 &13 Jap Dictionary
  ScrollLock & XButton2:: send !s
  return
  /*
   ; 13 &4
   ;XButton2 & ScrollLock:: send #+t
   ;return
   */
  ;OCR obsolete
  ;XButton2 & ScrollLock:: send +!#q

  ;________________________________________________
  ; 6

  ; 6 Pronounce Alt+P
  ;End::

  ; 6&lclick Go to the top Home
  End & LButton:: send {Home}
  return

  ;6&rclick Go to the bottom End
  End & rbutton:: send {End}
  return

  ;6&whup Scroll up a webpage PgUp
  End & WheelUp:: send {PgUp}
  return

  ;6&whdn Scroll up a webpage PgDn
  End & Wheeldown:: send {PgDn}
  return
  ;________________________________________________
  ; 7

  ; 7 &13 English Dictionary
  Pause & XButton2:: send !a
  return

  ;________________________________________________
  ; 8

  ;8 Anki add to field 1  Ctrl + Maj + U
  Browser_Stop:: send ^+u
  return

  ;8 Anki add to field 2  Ctrl + Maj + I
  Browser_Stop & XButton2:: send ^+i
  return

  ;8 Anki send data  Ctrl + Maj + P
  Browser_Stop & Mbutton::send ^+p
  return

  ;________________________________________________
  ; 9

  ; 9 Turn full-screen mode on or off F11
  Browser_Favorites:: send {F11}
  return

  ; 9 & mclick Default zoom size Ctrl+0
  Browser_Favorites & mbutton:: send ^{Numpad0}
  return

  ; 9 & whup  Zoom +
  Browser_Favorites & Wheelup:: send ^{Wheelup}
  return

  ; 9 & whdn  Zoom -
  Browser_Favorites & Wheeldown:: send ^{Wheeldown}
  return

  ;________________________________________________
  ;11

  ;11 Anki active extension  Ctrl + Maj + L
  Browser_Refresh::send ^+l
  return
;endregion
;_____________________________________________________________________________________________
;region ;;NOTEPAD
#IfWinActive, ahk_exe notepad.exe
  ;_____________________________________________________________________________________________
  ; 1

  ; 1 Save
  XButton1:: send ^s
  return

  ; 1 & mclick Recherche Ctrl+F
  XButton1 & mbutton:: send ^f
  return
  ;________________________________________________
  ; 2

  ; 2 Reload
  PgUp::Reload
  return
  ;________________________________________________
  ; 9 & mclick Default zoom size Ctrl+0
  Browser_Favorites & mbutton:: send ^{Numpad0}
  return

  ; 9 & whup  Zoom +
  Browser_Favorites & Wheelup:: send ^{NumpadAdd}
  return

  ; 9 & whdn  Zoom -
  Browser_Favorites & Wheeldown:: send ^{NumpadSub}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;AFFINITY DESIGNER
#IfWinActive, ahk_exe Designer.exe
  ;_____________________________________________________________________________________________
  ; 1

  ; 1Node A
  XButton1:: send a
  return

  ; 1 &13Point Transform F
  XButton1 & XButton2:: send f
  return

  ;13& 1Corner C
  XButton2 & XButton1:: send c
  return
  ;________________________________________________
  ; 2

  ; 2Pen P
  PgUp:: send p
  return

  ; 2&13Pencil N
  PgUp & XButton2:: send n
  return

  ;13& 2 Vector Brush B
  XButton2 & PgUp:: send b
  return

  ;2 & whupIncrease Brush Size / Select Next Ctrl+Alt+Z
  PgUp & WheelUp:: send ^!z
  return

  ; 2 &whdnDecrease Brush Size / Select Previous Ctrl+Alt+A
  PgUp & WheelDown:: send ^!a
  return
  ;________________________________________________
  ; 4

  ; 4 &13 Duplicate Ctrl+J
  ScrollLock & Xbutton2:: send ^j
  return

  ;13& 4Flip Horizontal Ctrl+Alt+F
  Xbutton2 & ScrollLock:: send ^!f
  return
  ;________________________________________________
  ; 6

  ; 6 New Layer Ctrl+Alt+N
  End:: send ^!n
  return

  ; 6&13 Layer Group Ctrl+G
  End & XButton2:: send ^g
  return

  ;13& 6 Find in Layer Panel Ctrl+K
  XButton2 & End:: send ^k
  return

  ; 6&mclick Lock Ctrl+L
  End & mbutton:: send ^l
  return

  ;mclick& 6 Unlock All Ctrl+Alt+Shift+L
  ~mbutton & End:: send ^!+l
  return

  ; 6 &lclick Move to Back One Ctrl+Shift+Left
  End & LButton:: send ^+{left}
  return

  ; 6 &rclick Move to Forward One Ctrl+Shift+Right
  End & rbutton:: send ^+{right}
  return

  ;6 & whup Select Next Ctrl+Shift+Up
  End & Wheelup:: send ^+{up}
  return

  ; 6 &whdn Select Previous Ctrl+Shift+Down
  End & Wheeldown:: send ^+{Down}
  return
  ;________________________________________________
  ; 8

  ; 8 Shape M
  Browser_Stop:: send m
  return

  ; 8&13 Texte T
  Browser_Stop & XButton2:: send t
  return

  ;13& 6 Convert to Curve Ctrl+Return
  XButton2 & Browser_Stop:: send ^{enter}
  return
  ;________________________________________________
  ;9

  ;9Fill G
  Browser_Favorites:: send g
  return

  ;9&13Transparency Y
  Browser_Favorites & Xbutton2:: send y
  return
  ;________________________________________________
  ;11

  ;11Color Picker I
  Browser_Refresh:: send i
  return

  ;11&13Toggle Active Selector X
  Browser_Refresh & Xbutton2:: send x
  return

  ;13&11Set Fill / Stroke to None /
  Xbutton2 & Browser_Refresh:: send /
  return
  ;________________________________________________
  ;12

  ;12View to Fit Ctrl+0
  Delete:: send ^*
  return

  ;12&13Show Grid Ctrl+*
  Delete & Xbutton2:: send +*
  return

  ;13&12Show Guides Ctrl+;
  Xbutton2 & Delete:: send ^;
  return

  ;12&mclickGrid and Axis Manager Ctrl+Alt+E
  Delete & mbutton:: send ^!e
  return

  ;mclick&12 Guides Manager Ctrl+Alt+Shift+E
  mbutton & Delete:: send ^+!e
  return
  ;________________________________________________
  ; 13 Move V
  Xbutton2:: send v
  return
;endregion
;_____________________________________________________________________________________________
;region ;;ANKI
#IfWinActive, ahk_exe anki.exe
  ;_____________________________________________________________________________________________
  ; 1

  ; 1 Correct
  XButton1:: send {enter}
  return
  ;________________________________________________
  ; 2

  ; 2 Faux
  PgUp:: send {0}
  return

  ;________________________________________________
  ;5

  ;5Ctrl+Z
  PgDn:: send ^!z
  return

  ;________________________________________________
  ;6

  ;6 Facile
  End:: send {4}
  return
  ;________________________________________________
  ; 13

  ;13 Audio
  XButton2:: send {6}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;BLENDER
;not include shortcuts in "PRIO-DEFAULT"
#IfWinActive, ahk_exe blender.exe
  ;_____________________________________________________________________________________________
  ;6

  ; 6 & whup  Alt+WhUp
  End & Wheelup:: send !{Wheelup}
  return

  ; 6 & whdn  Alt+WhDn
  End & Wheeldown:: send !{Wheeldown}
  return
  ;________________________________________________
  ;9

  ; 9   Ctrl+Spacebar Full screen
  Browser_Favorites:: send ^{Space}
  return

  ; 9 & whup  Ctrl+WhUp
  Browser_Favorites & Wheelup:: send ^{Wheelup}
  return

  ; 9 & whdn  Ctrl+WhDn
  Browser_Favorites & Wheeldown:: send ^{Wheeldown}
  return
  ;________________________________________________
  ; 8

  ; 8 Shape Add
  Browser_Stop:: send +a
  return
  ;________________________________________________
  ;10

  ;10 Select none Alt+A
  Insert & Wheelup:: send !a

  ; 10 &13 Hide selection H
  Insert & XButton2:: send h
  return

  ;13& 10 Reveal hidden items Alt+H
  XButton2 & Insert:: send !h
  return

  ; 10 & mclick Inverse selection Ctrl+I
  ;Insert & mbutton:: send ^i
  ;return
  ;________________________________________________
  ;12

  ; 12 & whup  Shift+WhUp
  Delete & Wheelup:: send +{Wheelup}
  return

  ; 12 & whdn  Shift+WhDn
  Delete & Wheeldown:: send +{Wheeldown}
  return

  ; 12 & rclick  F1 Help documentation
  Delete & Rbutton:: send {f1}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;ILLUSTRATOR
#IfWinActive, ahk_exe Illustrator.exe
  ;________________________________________________
  ; 1

  ; 1Curvature ;
  XButton1:: send {;}
  return

  ; 1 &13 Pen P
  XButton1 & XButton2:: send p
  return

  ;13 & 1 Eraser Shift+E
  XButton2 & XButton1::Send {Lshift down}e
  return
  XButton2 & XButton1 UP::Send {Lshift up}
  return

  ; 1 &mclick Pencil N
  XButton1 & mbutton:: send n
  return
  ;________________________________________________
  ; 2

  ; 2 Selection A
  PgUp:: send a
  return

  ; 2&13 Lasso Q
  PgUp & XButton2:: send q
  return

  ;13& 2 Vector Brush B
  XButton2 & PgUp:: send b
  return

  ; 2 &mclick Smooth Shift+N
  PgUp & mbutton:: send {Lshift down}n
  return
  PgUp & mbutton UP::Send {Lshift up}
  return

  ; 2 &lclick Color Fill
  PgUp & LButton::
    CoordMode, Mouse , Screen
    MouseGetPos, xpos, ypos
    Click, 9 655, 2
    MouseMove, %xpos%, %ypos%
  return

  ; 2 &rclick Color Stroke
  PgUp & Rbutton::
    CoordMode, Mouse , Screen
    MouseGetPos, xpos, ypos
    Click, 30 673, 2
    MouseMove, %xpos%, %ypos%
  return

  ;2 & whup Increase Brush Size )
  PgUp & WheelUp:: send )
  return

  ; 2 &whdn Decrease Brush Size (
  PgUp & WheelDown:: send (
  return
  ;________________________________________________
  ;3

  ; 13 & 3 Shape Builder Shift+M
  XButton2 & Home:: send {Lshift down}m
  return
  XButton2 & Home UP::Send {Lshift up}
  return
  ;________________________________________________
  ; 4

  ; 4 &13 Past in Front Ctrl+F
  ScrollLock & Xbutton2:: send {Ctrl down}f{Ctrl up}
  return

  ; 13 &4 Repeat Ctrl+D
  Xbutton2 & ScrollLock:: send ^d
  return

  ;________________________________________________
  ;5

  ; 13 & 5 Artboard
  XButton2 & PgDn:: Send {Lshift down}o
  return
  XButton2 & PgDn UP:: Send {Lshift up}
  return

  ; 5 &mclick Outline
  PgDn & mbutton:: send +^u
  return

  ;________________________________________________
  ; 6

  ; 6 New Layer Alt+Ctrl+l
  End:: send !^l
  return

  ; 6 &13 Lock Ctrl+2
  End & XButton2:: send ^{Numpad2}
  return

  ;13 & 6 UnLock Alt+Ctrl+2
  XButton2 & End:: send !^{Numpad2}
  return

  ; 6 &mclick Layer Group Ctrl+G
  End & mbutton:: send ^g
  return

  ; 6 &lclick Select object below Alt+Ctrl+(
  End & LButton:: send +^(
  return

  ; 6 &rclick Select object above Alt+Ctrl+-
  End & rbutton:: send +^-
  return

  ;6 & whup Move Forward Ctrl+-
  End & Wheelup:: send ^-
  return

  ; 6 &whdn Move Backward Ctrl+(
  End & Wheeldown:: send ^(
  return
  ;________________________________________________
  ; 7

  ; 7 &13 texte
  ~Pause & XButton2:: send t
  return
  ;________________________________________________
  ; 8

  ; 8 Shape square M
  Browser_Stop:: send m
  return

  ; 8&13 Shape ellipse L
  Browser_Stop & XButton2:: send l
  return

  ;13& 8 Shape polygon Shift+%
  XButton2 & Browser_Stop::Send {Lshift down}{sc028}
  return
  XButton2 & Browser_Stop UP::Send {Lshift up}
  return

  ; 8 &mclick Shape segment Alt gr+\
  Browser_Stop & mbutton:: send \
  return
  ;________________________________________________
  ;9
  ;________________________________________________
  ;10

  ; 10 &13 Hide selection Ctrl+3
  Insert & XButton2:: send ^{Numpad3}
  return

  ;13& 10 Show all Alt+Ctrl+3
  XButton2 & Insert:: send !^{Numpad3}
  return

  ; 10 & mclick Inverse selection Shift+Ctrl+6
  Insert & mbutton:: send +^{Numpad6}
  return

  ;10 & whup Deselect Shift+Ctrl+A
  Insert & Wheelup:: send +^a
  return
  ;________________________________________________
  ;11

  ;11Color Picker I
  Browser_Refresh:: send i
  return

  ;11&13Toggle Active Selector X
  Browser_Refresh & Xbutton2:: send x
  return

  ;13&11Set Fill / Stroke to None /
  Xbutton2 & Browser_Refresh:: send /
  return
  ;________________________________________________
  ;12

  ;12View to Fit Ctrl+0
  Delete:: send ^{Numpad0}
  return

  ;12&13Show Grid Ctrl+*
  Delete & Xbutton2:: send +^{sc037}
  return

  ;13&12Show Guides Ctrl+;
  Xbutton2 & Delete:: send ^;
  return

  ;12&mclick Smart Guide Ctrl+U
  Delete & mbutton:: send ^u
  return

  ;mclick&12 Guides Manager Ctrl+Alt+Shift+E
  mbutton & Delete:: send ^+!e
  return
  ;________________________________________________
  ; 13 Move V
  Xbutton2:: send v
  return
  ;endregion
  /*
  ;_____________________________________________________________________________________________
  ;region ;;Photoshop
  #IfWinActive, ahk_exe Photoshop.exe
    ;_____________________________________________________________________________________________

    ; Mbutton Pan
    MButton::
      Send {Space Down}{LButton Down}
      Keywait, MButton
      Send {LButton Up}{Space Up}
    Return
    ;________________________________________________
    ; 1

    ; 1 Brush B
    XButton1:: send b
    return

    ; 1 &13 Mixer H
    XButton1 & XButton2:: send h
    return

    ;13& 1 Erase E
    XButton2 & XButton1:: send e
    return

    ; 1 &mclick Fill G
    XButton1 & mbutton:: send g
    return
    ;________________________________________________
    ; 2

    ; 2 Lasso L
    PgUp:: send l
    return

    ; 2 &13 Selection shape M
    PgUp & XButton2:: send m
    return

    ;13& 2 Quick Selection W
    XButton2 & PgUp:: send w
    return

    ; 2 &mclick Color Range Alt+Shift+Ctrl+U
    PgUp & mbutton:: send !+^u
    return

    ; 2 &lclick Decrease hardness è
    PgUp & LButton:: send è
    return

    ; 2 &rclick Increase hardness à
    PgUp & rbutton:: send à
    return

    ;2 & whup Increase size )
    PgUp & Wheelup:: send )
    return

    ; 2 &whdn Decrease size (
    PgUp & Wheeldown:: send (
    return
    ;________________________________________________
    ; 4

    ;13 & 4 Duplicate
    Xbutton2 & ScrollLock:: send ^j
    return
    ;________________________________________________
    ; 6

    ; 6 New Layer Shift+Ctrl+N
    End:: send +^n
    return

    ; 6 &13 Merge Layers Ctrl+E
    End & XButton2:: send ^e
    return

    ;13& 6 Layer Group Ctrl+G
    XButton2 & End:: send ^g
    return

    ; 6 &mclick Hide Layer Ctrl+,
    End & mbutton:: send ^,
    return

    ; 6 &lclick
    ;End & LButton:: send {}
    ;return

    ; 6 &rclick
    ;End & rbutton:: send {}
    ;return

    ;6 & whup Move Forward Ctrl+)
    End & Wheelup:: send ^)
    return

    ; 6 &whdn Move Layer Backward Ctrl+(
    End & Wheeldown:: send ^(
    return
    ;________________________________________________
    ;10

    ; 10 &13 Hide selection Ctrl+H
    Insert & XButton2:: send ^h
    return

    ;13& 10 Quick Mask Q
    XButton2 & Insert:: send q
    return

    ; 10 &mclick Inverse selection Shift+Ctrl+I
    Insert & mbutton:: send +^i
    return

    ;10 & whup Deselect Ctrl+D
    Insert & Wheelup:: send ^d
    return
    ;________________________________________________
    ; 13

    ; 13 Mouv
    XButton2:: send v
    return
   ;endregion
   */
  /*
  ;_____________________________________________________________________________________________
  ;region ;;Photoshop Pen

  #If WinActive("ahk_exe Photoshop.exe") and (!A_CaretX)

    ;On-Screen Keyboard
    <:: send ^#o
    return

  ;__________________
  #IfWinActive, ahk_class PSFilter_WindowClass
    ; Z Size Liquify
    z::
      send, {shift down}
      send, {alt down}
      send, {Rbutton down}
      Keywait, z
      sleep, 50
      send, {Rbutton up}
      send, {alt up}
      send, {shift up}
      sleep, 50
    return
  #IfWinActive, ahk_exe Photoshop.exe

    x & <::Suspend
    return
    ;__________________
    ; F1 Deselect Ctrl+D
    F1:: send ^d
    return

    ; X & F1  Reselect Shift+Ctrl+D
    x & F1:: send +^d
    return

    ; F2 Inverse selection Shift+Ctrl+I
    F2:: send +^i
    return

    ; F3 Hide selection Ctrl+H
    F3:: send ^h
    return

    ; F4 Quick Mask
    F4:: send q
    return
    ;__________________
    ; ² Enter
    ²:: send {Enter}
    return

    ; X & ² Backspace
    x & ²:: send {backspace}
    return
  ;__________________
  #If WinActive("ahk_exe Photoshop.exe") and (!A_CaretX)

    ; 1 New Layer Shift+Ctrl+N
    &::
      send +^n
      send {Enter}
    return

    ; X & 1 Move Layer Backward Ctrl+(
    x & &:: send ^(
    return

    ; 2 Merge Layers Ctrl+E
    é:: send ^e
    return

    ; X & 2 Move Layer Forward Ctrl+)
    x & é:: send ^)
    return

    ; 3 Erase brush
    "::
      send +!r
      Keywait, "
      sleep, 50
      send +!n
      sleep, 50
    return

    ; X & 3 Erase
    x & ":: send e
    return

    ;4 Toggle brush pressure size
    ':: send *
    return

    ;X & 4 Toggle brush opacity size
    x & ':: send ù
    return

     ;  ; 5 Preserve transparency /
     ;  (:: send /
     ;  ;return

     ; X & 5 Clipping Mask
     x & (:: send ^!g
     return

    ; 6 Hide Layer Ctrl+,
    -:: send ^,
    return

    ; X & 6 Layer Group Ctrl+G
    x & -:: send ^g
    return

    ;__________________

    ; A Brush B
    a::
      send b
    return

    ; X & A Previous Brush ,
    x & a::
      send {,}
    return

    ; Z Size
    z::
      send, {ctrl down}
      send, {alt down}
      send, {Rbutton down}
      Keywait, z
      sleep, 50
      send, {Rbutton up}
      send, {alt up}
      send, {ctrl up}
      sleep, 50
    return

    ; X & Z Next Brush ,
    x & z::
      send {;}
    return

    ; E Decrease size (
    e:: send (
    return

    ; E Decrease hardness è
    x & e:: send è
    return

    ; R Increase size )
    r:: send )
    return

    ; R Increase hardness à
    x & r:: send à
    return

    ; T Smudge Z
    t:: send z
    return

    ; Y Rotate
    y:: send r
    return

    ;__________________

    ; Q Color Range Alt+Shift+Ctrl+U
    q:: send !+^u
    return

    ;X & Q HUE Ctrl+U
    x & q:: send ^u
    return

    ; S Liquify Shift+Ctrl+X
    s:: send +^x
    return

    ; X & S Curve Shift+Ctrl+M
    x & s:: send ^m
    return

    ; D Mouv V
    d:: v
    return

    ; X & D Shape Selection M
    x & d:: m
    return

    ;F  HSLuv
    f::
      WinActivate, HSLuv - Human-friendly HSL
    return
    ;__________________

    ; W Flip Horizontal
    w:: send ^*
    return

    ; X Lasso
    x:: send l
    return

    c:: send {Ctrl down}z{Ctrl up}
    return

    v:: send {Ctrl down}y{Ctrl up}
    return

    ;B Switch foreground / background colors X
    b:: send x
    return

    ; X & B Fill G
    x & b:: g
    return

  #IfWinActive, HSLuv - Human-friendly HSL
    f::
      sleep 100
      send ^c
      sleep 100
      WinActivate, ahk_exe Photoshop.exe
      WinWaitActive, ahk_exe Photoshop.exe
      send {!}
      send ^v
      sleep 20
      send {Enter}
    return
     ;endregion
     */

;_____________________________________________________________________________________________
;region ;;VS CODE
#IfWinActive, ahk_group VsCode
  ;______________________________________________________________________________________

  ;keyboard:

  ;console.log()
  !c:: sendinput console.log(){Left}
  return

  ; dot
  LWin:: sendinput .
  return
  ;_______________________
  ;1

  ; 1 Completion Ctrl+Space
  XButton1:: send ^{space}
  return

  ; 1 Find Over Shift+F12
  XButton1 & XButton2:: send +{F12}
  return

  ; 1 Find Over Shift+F12
  XButton2 & XButton1:: ^+l
  return

  ; 1 & mclick Recherche Ctrl+H
  XButton1 & mbutton:: send ^h
  return

  ; 1 & mclick Rename Symbol F2
  mbutton & XButton1:: send {f2}
  return
  ;________________________________________________

  ; 2 Delete line Ctrl+Shift+K
  PgUp:: send ^+k
  return

  ; 2 Loop Problems
  PgUp & XButton2:: send {F8}
  return

  ; 2 Insert line above Ctrl+Shift+Enter
  PgUp & lbutton:: send ^+{Enter}
  return

  ; 2 Insert line below Ctrl+Enter
  PgUp & rbutton:: send ^{Enter}
  return

  ;2&whup tab
  PgUp & WheelUp:: send {Tab}
  return

  ;2&whdn shift tab
  PgUp & Wheeldown:: send +{Tab}
  return
  ;________________________________________________
  ; 4 &13  Column selection Alt+Shift+Insert
  ScrollLock & Xbutton2:: send !+{Insert}
  return
  ;________________________________________________

  ;5 Undo Cursor Action Ctrl+U
  Xbutton2 & PgDn:: send ^u
  return
  ;________________________________________________

  ; 6 Comment selection ctrl+:
  End:: send ^:
  return

  ; 6 Block comment Shift+Alt+A
  End & Xbutton2:: send +!a
  ;return

  ; 6&lclick Code Mode
  End & LButton:: send !+{left}
  return

  ;6&rclick Design Mode
  End & rbutton:: send !+{right}
  return

  ;6&whup Move line up Alt+up
  End & Wheelup:: send !{up}
  return

  ;6&whup Move line down Alt+down
  End & Wheeldown:: send !{down}
  return
  ;________________________________________________
  ;8 Go to line
  Browser_Stop:: send ^g
  return

  ;________________________________________________
  ;9 Turbo console log Fast Ctrl + alt + L
  Browser_Favorites:: send {click, 2}^!l
  return

  ;9 Turbo console log Ctrl + alt + L
  Browser_Favorites & mbutton:: send ^!l
  return

  ;9 Comment  all turbo logs Alt + shift + c
  Browser_Favorites & lbutton:: send !+c
  return

  ;9 Uncomment all turbo logs Alt + shift + u
  Browser_Favorites & rbutton:: send !+u
  return

  ;9&whup Move line up Alt+up
  Browser_Favorites & Wheelup:: send !+{up}
  return

  ;9&whup Move line down Alt+down
  Browser_Favorites & Wheeldown:: send !+{down}
  return
  ;________________________________________________
  ;10 Select in file
  Insert & mbutton:: send !{Enter}
  return

  ;10 Select Line
  Insert & Wheelup:: send ^l
  return
  ;________________________________________________
  ;11 Quick fix Ctrl+;
  Browser_Refresh:: send {Lbutton}^;
  return
  /*
    ;11+whup Collapse
    Browser_Refresh & Wheelup:: send ^+[
    return

    ;11+whdn Expand
    Browser_Refresh & Wheeldown:: send ^+]
    return
   */
  ;________________________________________________
  ; 12 Save Ctrl+S
  Delete:: send ^s
  return

  ; 12&lclick reformat Shift+Alt+F
  Delete & lbutton:: send +!f
  return

  ; 12&rclick organize imports Alt+Shift+O
  Delete & rbutton:: send !+o
  return
  ;________________________________________________
  ; 13 Documentation Ctrl+Shift+Space
  XButton2:: send {click}^+{Space}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;CODE
#IfWinActive, ahk_group Code

  ;Create function
  !f:: sendinput function{space}(){space}{{}{enter}+{Tab}{Left}{Left}{Left}{Left}{Left}}
  return

  ;Create html elements open/close
  !e::
    send <></>{Left}
    send {Left}{Left}{Left}
  return

  ;console.log()
  !c:: sendinput console.log(){Left}
  return

  ; dot
  LWin:: sendinput .
  return

  ;1

  ; 1 Completion Ctrl+Space
  XButton1:: send ^{space}
  return

  ; 1 & mclick Recherche Ctrl+F
  XButton1 & mbutton:: send ^f
  return
  ;________________________________________________
  ;2&whup tab
  PgUp & WheelUp:: send {Tab}
  return

  ;2&whdn shift tab
  PgUp & Wheeldown:: send +{Tab}
  return
  ;________________________________________________
  ; 4 &13  Column selection Alt+Shift+Insert
  ScrollLock & Xbutton2:: send !+{Insert}
  return
  ;________________________________________________
  ; 6 Comment selection
  End:: send ^{NumpadDiv}
  return

  ; 6&lclick Code Mode
  End & LButton:: send !+{left}
  return

  ;6&rclick Design Mode
  End & rbutton:: send !+{right}
  return
  ;________________________________________________
  ;Go to line
  Browser_Stop:: send ^g
  ;________________________________________________
  ; 12 Save Ctrl+S
  Delete:: send ^s
  return

  ;________________________________________________
  ; 13 Documentation
  XButton2:: send {Click}^q
  return
;_____________________________________________________________________________________________

;_____________________________________________________________________________________________
;ANDROID STUDIO
#IfWinActive, ahk_exe studio64.exe
  ;_____________________________________________________________________________________________
  ;1

  ; 1 Completion Ctrl+Space
  XButton1:: send ^{space}
  return

  ; 1 Find in files Ctrl+Shift+F
  XButton1 & XButton2:: send ^+f
  return

  ; 1 & mclick Recherche Ctrl+F
  XButton1 & mbutton:: send ^f
  return
  ;________________________________________________
  ; 2 Project
  PgUp:: send !&
  return

  ;2&whup tab
  PgUp & WheelUp:: send {Tab}
  return

  ;2&whdn shift tab
  PgUp & Wheeldown:: send +{Tab}
  return
  ;________________________________________________
  ; 6&lclick Code Mode
  End & LButton:: send !+{left}
  return

  ;6&rclick Design Mode
  End & rbutton:: send !+{right}
  return

  ;________________________________________________
  ; 13 Documentation
  XButton2:: send {Click}^q
  return

;_____________________________________________________________________________________________
;WEBSTORM
#IfWinActive, ahk_exe webstorm64.exe
  ;_____________________________________________________________________________________________
  ;1

  ; 1 Completion Ctrl+Space
  XButton1:: send ^{space}
  return

  ; 1 Find in files Ctrl+Shift+F
  XButton1 & XButton2:: send ^+f
  return

  ; 1 & mclick Recherche Ctrl+F
  XButton1 & mbutton:: send ^f
  return
  ;________________________________________________
  ; 2 Project
  PgUp:: send !&
  return

  ;2&whup tab
  PgUp & WheelUp:: send {Tab}
  return

  ;2&whdn shift tab
  PgUp & Wheeldown:: send +{Tab}
  return
  ;________________________________________________
  ; 4 &13  Column selection Alt+Shift+Insert
  ScrollLock & Xbutton2:: send !+{Insert}
  return
  ;________________________________________________
  ; 6 Comment selection
  End:: send ^{NumpadDiv}
  return

  ; 6&lclick Code Mode
  End & LButton:: send !+{left}
  return

  ;6&rclick Design Mode
  End & rbutton:: send !+{right}
  return
  ;________________________________________________
  ;8 Go to line
  Browser_Stop:: send ^g
  ;________________________________________________
  ; 12 Save Ctrl+S
  Delete:: send ^s
  return

  ;________________________________________________
  ; 13 Documentation
  XButton2:: send {Click}^q
  return
;endregion
;_____________________________________________________________________________________________
;region ;;KANJITOMO
#IfWinActive, ahk_group Kanjitomogame
  ;_____________________________________________________________________________________________
  ; 1 Sets target character color from pixel under mouse cursor.
  XButton1:: send !é
  return

  ;Between "black on white" and "white on black"
  XButton1 & XButton2:: send !s
  return

  ;1&whup tab Increase the character color range
  ;XButton1 & WheelUp:: send {NumpadAdd}
  return

  ;1&whdn Decrease the character color range
  XButton1 & Wheeldown:: send {NumpadSub}
  return

  ; 2 Resets the character color back to automatic detection
  PgUp:: send !-
  return

  ;2 Between automatic and manual OCR mode
  PgUp & XButton2:: send !x
  return

  ;13& 4 Clipboard
  XButton2 & ScrollLock:: send !z
  return

  ;OCR box select
  Xbutton2:: send +!#q
  return

  ;OCR line select
  MButton:: send #w
  return
;endregion
;_____________________________________________________________________________________________
;region ;;BLUESTACKS

#IfWinActive, ahk_exe HD-Player.exe
  ;_____________________________________________________________________________________________
  ;1

  ; 1 Hide cursor F1
  XButton1:: send {F1}
  return

  ; 9 Full Screen
  Browser_Favorites:: send {F11}
  return
;endregion
;_____________________________________________________________________________________________
;region ;;FL STUDIO

#IfWinActive, ahk_exe FL64.exe
  ;_____________________________________________________________________________________________

  ;1 Draw P
  XButton1:: send p
  return

  ; 1 &13 Slice C
  XButton1 & XButton2:: send c
  return

  ;13& 1 Paint B
  XButton2 & XButton1:: send b
  return
  ;________________________________________________
  ; 2

  ; 2 Play
  PgUp:: send {Space}
  return

  ; 2 &13 Record
  ;PgUp & XButton2:: send r
  ;return

  ;________________________________________________
  ; 4

  ;13& 4 Repeat Ctrl+B
  XButton2 & ScrollLock:: send ^b
  return
  ;________________________________________________
  ; 6

  ; 6 Ctrl+Shift+Lclick
  End::
    send {Lctrl downtemp}{Lshift downtemp}{LButton downtemp}
    loop
    {
      sleep, 10
      getkeystate, state, End, p
      if state = u
        break
    }
    send {Lctrl up}{Lshift up}{LButton up}
  return
  ;________________________________________________
  ; 8

  ; 8 Piano Roll F7
  Browser_Stop:: send {F7}
  return

  ; 8 &13 Swap song/pattern L
  Browser_Stop & XButton2:: send l
  return
  ;________________________________________________
  ; 9

  ; 9 Playlist F5
  Browser_Favorites:: send {F5}
  return

  ; 9 &13 New Pattern F4
  Browser_Favorites & XButton2:: send {F4}
  return

  ; 9 &lclick Zoom - Horizontally Ctrl+Whdown
  Browser_Favorites & LButton:: send ^{Wheeldown}
  return

  ; 9 &rclick Zoom + Horizontally Ctrl+Whup
  Browser_Favorites & rbutton:: send ^{Wheelup}
  return

  ; 9 & whup Playlist Zoom + vertically Alt+Whup
  Browser_Favorites & Wheelup:: send !{Wheelup}
  return

  ; 9 &whdn Playlist Zoom - vertically Alt+Whdown
  Browser_Favorites & Wheeldown:: send !{Wheeldown}
  return
  ;________________________________________________
  ;10

  ; 10 & whup Deselect Ctrl+D
  Insert & Wheelup:: send ^d
  return
  ;________________________________________________
  ; 11

  ; 11Channel Rack F6
  Browser_Refresh:: send {F6}
  return

  ; 11 &lclick  Mouv steps left Ctrl+Shift+Left
  Browser_Refresh & LButton:: send ^+{Left}
  return

  ; 11 &rclick Mouv steps right Ctrl+Shift+Right
  Browser_Refresh & rbutton:: send ^+{Right}
  return

  ; 11 & whup Mouv channel up Alt+whup
  Browser_Refresh & Wheelup:: send !{Wheelup}
  return

  ; 11 &whdn Mouv channel down Alt+whdown
  Browser_Refresh & Wheeldown:: send !{Wheeldown}
  return
  ;________________________________________________
  ; 12

  ; 12Mixer F9
  Delete:: send {F9}
  return

  ; 12 &13 Waveform view Alt+W
  Delete & XButton2:: send !w
  return

  ; 12 &mclick Highlight in channel rack/ Swap pattern song  Alt+L
  Delete & mbutton:: send !l
  return

  ;mclick& 12 Name from channel rack Ctrl+L
  mbutton & Delete:: send ^l
  return

  ; 12 &lclick  Mouv insert left Alt+Left
  Delete & LButton:: send !{Left}
  return

  ; 12 &rclick Mouv insert right Alt+Right
  Delete & rbutton:: send !{Right}
  return
  ;________________________________________________
  ;13

  ;13 Record
  XButton2:: send r
  return
;endregion
;_____________________________________________________________________________________________
;region ;;RIVE

#IfWinActive, ahk_exe Rive.exe
  ;_____________________________________________________________________________________________
  ;13 Record
  XButton2:: send p
  return

;endregion
;_____________________________________________________________________________________________
#IfWinActive