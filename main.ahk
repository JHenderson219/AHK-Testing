^+v::
	pasteFetch()
Return

Escape::
ExitApp
Return


^+0::
	
	Loop, 3 {
		pasteFetch()
		Sleep 10
	}
	Send {Tab}		;Tab to SAVE AND CONTINUE

	Sleep 10

	Send {Enter}

	Sleep 2000		;Wait for Page Load

	Send +{Tab 5}	;Tab to TITLE BOX
	pasteFetch()

	Send +{Tab 10}	;Tab to ADDRESS TAB
	Send {Enter}

	Sleep 10
	
	Send {Tab 7}	;Tab to NEW ADDRESS BUTTON
	Send {Enter}

	Sleep 10

	Send +{Tab 14}	;Tab to LABEL
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

	Send +{Tab 8}	;Tab to PHONE TAB
	Send {Enter}
	Sleep 10

	Send {Tab 6}	;Tab to MOBILE PHONE
	Loop, 4{
		pasteFetch()
	}
	
	Send {Enter}

	Sleep 25

	home()

return

^+9::
	
	Loop, 3 {
		pasteFetch()
		Sleep 10
	}

	Send +{Tab}

	pasteFetch()

	Send +{Tab 10}	;Tab to ADDRESS TAB
	Send {Enter}

	Sleep 10
	
	Send {Tab 7}	;Tab to EDIT ADDRESS BUTTON
	Send {Enter}

	Sleep 10

	Send +{Tab 14}	;Tab to LABEL
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

	Send +{Tab 8}	;Tab to PHONE TAB
	Send {Enter}
	Sleep 10

	Send {Tab 6}	;Tab to MOBILE PHONE
	Loop, 4{
		pasteFetch()
	}
	
	Send {Enter}

	Sleep 25

	home()

return

^+8::
    pauseLoad = 2000
    pauseLong = 500
    pauseShort = 250

    Send {Tab 5}			; Target PRICING
    Send %pauseShort%
    Send {Enter}			; Select PRICING
    Sleep %pauseShort%		; Wait for Load
    Send {Tab 6}			; Target BASIC PRICING
    Sleep %pauseShort%
    Send {Up}				; Change Radio to NO PRICING
    Sleep 750
    Send {Tab 2}			; Target SAVE
    Send {Enter}			; Select SAVE
    Sleep %pauseLoad%    
    Send +{Tab 14}			; target QUESTIONS AND ANSWERS
    Send {Enter}			; select QUESTIONS AND ANSWERS 
    Sleep  %pauseShort%		; Wait for Load
    Send {Tab 9}			; target ENTERING DESIRED QUALITY radial
    Send {Down}				; change target to SELECTING A QUANTITY radio
    Sleep %pauseLoad%		; wait 1s
    Send +{Tab 4}			; backtab to EDIT QUANTITY BREAKS
    Send {Enter}			; Open EDIT QUANTITY BREAKS
    Sleep %pauseLong%		; wait 0.25s
    Send +{Tab 12}			; backtab to QUANTITY
    
    i = 0
    while i < 10 {
        i++
        SendInput %i%
        SendInput {Tab}
    }

    Send {Tab}				; Tab to SAVE CHANGES
    Send {Enter}
    Sleep %pauseLoad%
    Send {Tab 4}			; Tab to SAVE
    Send {Enter}
    Sleep %pauseLoad%
    Send +{Tab}				; Tab to RETURN TO DOCUMENT LIST
    Send {Enter}
Return

^+7::
	title := "Input script"
    pauseLoad = 3000
    pauseLong = 500
    pauseShort = 250  ; prime by copying first column in row

    Loop, 2 {
    pasteFetch() ; paste name and description, fetch size
  	}

  	InputBox, category, %title%, "Input category name."
  	Send %category%
  	Send {Tab}
  	Sleep %pauseShort%
  	Send {Enter}
  	Sleep %pauseLoad%

    Send {Tab 4} ; tab to size
    Loop, 3 {
    pasteFetch() ; paste size to SIZE, get and paste paper and ink
    }

    Send {Tab 2} ; tab to SAVE
    Send {Enter} ; select SAVE
    Sleep %pauseLoad%

    Send {Tab 18} ; tab to QUESTIONS & ANSWERS
    Send {Enter}  ;
    Sleep %pauseLong% ;

    Send {Tab 9} ; tab to ENTERING THE DESIRED QTY
    Send {Down}  ; select SELECTING A QTY...
    Sleep %pauseLoad% ;

    Send +{Tab 4} ; backtap to EDIT QTY BREAKS
    Send {Enter} ; Select EDIT QTY BREAKS
    Sleep %pauseLong%

    Send +{Tab 5} ; Backtab to QTY
    
    i := 0
    While i < 100 {
    Sleep %pauseShort%	
    pasteFetchClipboard()
    modResult := Mod(i,2)
    ; MsgBox, i is %i%, mod result is %modResult%
    if (Mod(i,2) > 0) {
    
    	Send +{Tab}
    	MsgBox, 4,, Would you like to continue? (press Yes or No)
		IfMsgBox No
			Break
    	}
     i := i+1
     } 

    Send {Tab 2}
    Send {Enter 10} ; add QTY

    MsgBox, Please wait to continue.

    Send +{Tab 8} ; Backtab to CUSTOMERS
    Send {Enter}  ; Select CUSTOMERS
    Sleep %pauseLong% 

    Send {Tab 8} ; Tab to NOT VIEWABLE
    Send {Down}	; Down to VIEWABLE
    Sleep %pauseShort%

    Send {Tab} ; tab to ENTER A COMPANY
    
    InputBox, company, %title%, "Input company name."
  	SendInput %company%

    Send {Tab 2} ; Tab to Company
    Send {Down 2} ;  Select City of AG
    Send {Tab} ; Tab to ADD

Return

^+6::
	Title := "Add Proofreading and Approval Questions" ; This script adds proofreading and approval questions to Questions and answers.
	; To prime, click on "Questions & Answers" after navigating to that tab
	; IF ANY NEW GLOBAL QUESTIONS ARE ADDED, THIS SCRIPT WILL BREAK!

	Send +{Tab 20} ; 20 backtabs to "Add a Question" 

	selectGlobalQuestions()

	Send {Down 16} ; move to "Preview Note"

	confirmGlobalQuestion()

	Send {Tab} ; Tab to "add a question"

	selectGlobalQuestions()

	Send {Down 17} ; down to "STOP"

	confirmGlobalQuestion()

	Send {Tab} ; Tab to "add a question"

	selectGlobalQuestions()

	Send {Down 14} ; down to "Final Proof Approval"

	confirmGlobalQuestion()

	Send {Tab} ; tab to "add a question"

	; next, need to add two divider lines
Return

^+b::
	pasteFetchClipboard()
Return

confirmGlobalQuestion () {
	Send {Tab 5} ; tab to "Use this global question"
	Send {Enter} ; select "Use this global question"
	Sleep %pauseLoad% ;
	Return	
}

selectGlobalQuestions () {
	Send {Enter} ; Select "Add a Question"
	Sleep %pauseLong%;

	Send +{Tab 2} ; 2 backtabs to "Select a Question Type"
	Send {Down} ; Move to "Use a global question or Element"

	Sleep %pauseLong% ; wait for youtube embed to load

	Send +{Tab 6} ; 6 backtabs to "Select a Global Question or Element"		

Return
}

pasteFetchClipboard(){
	clipboard := RegExReplace(clipboard, "\r\n$","")
	clipboard = %clipboard%
	SendInput %clipboard% 	; Paste primed value
	Sleep 25
	Send !{Tab} ; Switch windows to Excel
	Sleep 250
	Send {Tab}	; Goto next column
	Sleep 25
	clipboard =  ; clear clipboard
	Send ^c 	; Copy value
	ClipWait
	Sleep 25
	Send ^\		; Clear Formatting
	Sleep 25
	Send !{Tab}	; Switch to Application
	Sleep 250
	Send {Tab}  ; Next field
	Return
}

pasteFetch(){
	Send ^a
	Send ^v 	; Paste primed value
	Sleep 25
	Send !{Tab} ; Switch windows to Excel
	Sleep 250
	Send {Tab}	; Goto next column
	Sleep 25
	Send ^c 	; Copy value
	Sleep 25
	Send ^\		; Clear Formatting
	Sleep 25
	Send !{Tab}	; Switch to Application
	Sleep 250
	Send {Tab}
}


^+c::  ; for getting and pasting an individual price and quantity
    pauseLoad = 1000
    pauseLong = 250
    pauseShort = 100  ; prime by selecting first quantity in TO

    Send ^a ; select all
    Sleep %pauseShort%
    Send ^c ; copy QUANTITY QTY
    Sleep %pauseShort%
    Send {Tab 2} ; tab to PRICE
    Sleep %pauseShort%
    Send !{Tab} ; alt tab to excel
    Sleep %pauseLong%
    Send ^v ; paste value
    Sleep %pauseShort%
    Send {Tab} ; tab to next cell 

    Sleep %pauseShort%
    Send !{Tab} ; alt tab to application
    Sleep %pauseLong%
    Send ^c ; copy price
    Sleep %pauseShort%
    Send {Tab 5} ; select next quantity

    Sleep %pauseShort%

    Send !{Tab} ; alt tab to excel
    Sleep %pauseLong%
    Send ^v ; paste value
    Sleep %pauseShort%
    Send {Tab} ; tab to next cell
    Sleep %pauseShort%
    Send !{Tab} ; alt tab to application
Return



home(){
	Send !{Tab}
	Sleep 40
	Send {Home}
	Sleep 25
	Send {Down}
	Sleep 25
	Send ^c
}

