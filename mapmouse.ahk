; === === === ===
; === GLOBAL
; === === === ===

MButton::MButton
MButton & WheelDown::Send("!{Left}")	; go backward
MButton & WheelUp::Send("!{Right}")	; go forward 

RButton::RButton  
RButton & WheelDown::AltTab		; scroll through windows
RButton & WheelUp::Send("#{Up}") 	; maximize window
RButton & LButton::{			; single: close ;double: minimize
	ErrorLevel := !KeyWait("lbutton", "t0.2")
	if (errorlevel = 1){
		;MsgBox("hold")
		return
	}
	ErrorLevel := !KeyWait("lbutton", "d, t0.2")
	if (errorlevel = 0){
		Send("!{Space}n")
		return
	} else {
		Send("!{F4}")
		return
	}
	
}

; === === === ===
; === SOFTWARE
; === === === ===

; === Firefox
#HotIf (WinActive("ahk_class MozillaWindowClass") or WinActive("ahk_class IEFrame"))
	RButton::RButton 
	RButton & WheelUp::Send("^{Tab}")	; scroll through firefox tabs
	RButton & LButton::{			;; single: close ;double: minimize
		ErrorLevel := !KeyWait("lbutton", "t0.2")	; hold: empty
		if (errorlevel = 1){
			;MsgBox("hold")
			return
		}
		ErrorLevel := !KeyWait("lbutton", "d, t0.2")
		if (errorlevel = 0){
			Send("!{Space}n")
			return
		} else {
			Send("^w")
			return
		}
	
	}
#HotIf

; === === === ===
; === KILL
; === === === ===

^+k::ExitApp 

; === === === ===
