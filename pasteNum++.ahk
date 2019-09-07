#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Small utility to automatically increment a starting number in the clipboard each time you paste it.
;

num := 9112  ; starting number
inc := 8     ; increment amount

; wait for paste shortcut (Ctrl+V)
^v::
	Send %num%  ; paste the number
	num += inc  ; increment the number for next time
