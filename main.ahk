Escape::
ExitApp
Return

^+v::
	pasteFetch()
Return

delayedBackTab(){
	Sleep 5
	Send +{Tab}
	Return
}

delayedTab(){
	Sleep 5
	Send {Tab}
	Return
}

^+0::
	Loop, 3 {
		pasteFetch()
		Sleep 100
	}
	Send {Tab}		;Tab to SAVE AND CONTINUE

	Send {Enter}

	Sleep 2500		;Wait for Page Load			

	Loop, 5 {
	delayedBackTab()
	}	            ;Tab to TITLE BOX
	pasteFetch()

	Loop, 10 {
	delayedBackTab()
	}				;Tab to ADDRESS TAB
	Send {Enter}

	Sleep 250
	
	Loop, 7 {
	delayedTab()
	}				;Tab to NEW ADDRESS BUTTON
	Send {Enter}

	Sleep 250

	Loop, 14 {
	delayedBackTab()
	}				;Tab to LABEL
	pasteFetch()

	Send {Tab 2}	;Tab to PRIMARY PHONE
	pasteFetch()

	Send {Tab 2}	;Tab to ADDRESS
	pasteFetch()


	Send {Tab}		;Tab to CITY
	Loop, 4{
		pasteFetch()
	}

	Send {Enter}	;SAVE ADDRESS

	Sleep 2000

	Loop, 8 {
	delayedBackTab()
	}               ;Tab to PHONE TAB
	Send {Enter}
	Sleep 250

	Loop, 6 {
	delayedTab()
	}      			;Tab to MOBILE PHONE
	Loop, 4{
		pasteFetch()
	}
	
	Send {Enter}

	home()
Return


^+9::
	
	Loop, 3 {
		pasteFetch()
		Sleep 25
	}

	Send +{Tab}

	pasteFetch()

	Send +{Tab 10}	;Tab to ADDRESS TAB
	Send {Enter}

	Sleep 50
	
	Send {Tab 7}	;Tab to EDIT ADDRESS BUTTON
	Send {Enter}

	Sleep 50

	Send +{Tab 14}	;Tab to LABEL
	pasteFetch()

	Sleep 50

	Send {Tab 2}	;Tab to PRIMARY PHONE
	pasteFetch()

	Sleep 50

	Send {Tab 2}	;Tab to ADDRESS
	pasteFetch()

	Sleep 50

	Send {Tab}		;Tab to CITY
	Loop, 4{
		pasteFetch()
	}

	Send {Enter}	;SAVE ADDRESS

	Sleep 2500

	Send +{Tab 8}	;Tab to PHONE TAB
	Send {Enter}
	Sleep 50

	Send {Tab 6}	;Tab to MOBILE PHONE
	Loop, 4{
		pasteFetch()
	}
	
	Send {Enter}


Return





pasteFetch(){
	Send ^a
	Send ^v 	;Paste primed value
	Sleep 50
	Send !{Tab} ;Switch windows to Excel
	Sleep 100
	Send {Tab}	;Goto next column
	Sleep 50
	Send ^c 	;Copy value
	Sleep 50
	Send ^\		;Clear Formatting
	Sleep 50
	Send !{Tab}	;Switch to Application
	Sleep 100
	Send {Tab}		
}

home(){
	Sleep 200
	Send !{Tab}
	Sleep 200
	Send {Home}
	Sleep 50
	Send {Up}
	Sleep 50
	Send ^c
}