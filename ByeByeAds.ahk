; See README for instructions
; Made by RamneekSingh24

DetectHiddenWindows, On



getSpotifyTitle() {
	DetectHiddenWindows, On
	if not WinExist("ahk_exe Spotify.exe") {
		;MsgBox, Spotify Ins't Running66
		Return ""
	}

    WinGet, id, list, ahk_exe Spotify.exe
    Loop, %id%
    {
        this_ID := id%A_Index%
        WinGetTitle, title, ahk_id %this_ID%

        If (title = "") {
			Continue
		}
		Return title
    }
    Return ""
}

sleepFor(time_in_ms) {
	Sleep, %time_in_ms%
}

getSpotifyHwnd() {
	
	
	if not WinExist("ahk_exe Spotify.exe") {
		;MsgBox, Spotify Ins't Running66
		Return ""
	}

    WinGet, id, list, ahk_exe Spotify.exe
    Loop, %id%
    {
        this_ID := id%A_Index%
        WinGetTitle, title, ahk_id %this_ID%
        If (title = "") {
			Continue
		}
		;MsGBox %title% ID %this_ID%
		Return this_ID
    }
    Return ""
}



waitForSpotifyToRespond() {
	DetectHiddenWindows, On
	title := getSpotifyTitle()
	while(title != "Spotify Free"  ) {

		if(title == "Advertisement") {
			break
		}
		;MsgBox, %title%
		Sleep, 10
		title := getSpotifyTitle()
		Sleep, 10
	}
	Return
}

waitForSpotifyToClose() {
	DetectHiddenWindows, On
	title := getSpotifyTitle()
	while(!title) {
		Sleep, 10
	}
}


openSpotify(PATH) {
	
	Run, %PATH%,,,NewPID
	;MsgBox, pid is %NewPID%
	Process, Priority, %NewPID%, High
	Sleep, 10
	waitForSpotifyToRespond()
	
	Return
}
closeSpotify() {
	SpotifyID := getSpotifyHwnd()
	Sleep, 10

	if(!SpotifyID) {
		MsgBox, Spotify Not Running
		Return
	}
	WinClose, ahk_id %SpotifyID%
	waitForSpotifyToClose()
	Return
}

sendPlayPause() {
	DetectHiddenWindows, On
	waitForSpotifyToRespond()
	Sleep, 10
	Send, {Media_Play_Pause down}
	Sleep, 50
	Send, {Media_Play_Pause up}
	Sleep, 50
}

^q::

DetectHiddenWindows, On

PATH := "D:\Desktop\SpotifyWithoutAds.lnk"

openSpotify(PATH)
sendPlayPause()
title := getSpotifyTitle()
Sleep, 5000
closeSpotify()
openSpotify(PATH)
sleepFor(1000)
sendPlayPause()
Sleep, 3000
title := getSpotifyTitle()
MsgBox, Script Testing Sucessful, Currently Running: %title%
Sleep, 3000

Loop
{
	title := getSpotifyTitle()
	Sleep, 10

	if(!title) {
		MsgBox, Closing Script From Loop
		Return
	}

	if(title == "Advertisement") {

		Sleep, 10
		closeSpotify()
		Sleep, 50
		sleepFor(2000)
         	openSpotify(PATH)
		sleepFor(2000)
		sendPlayPause()
		Sleep, 2000
		;MsgBox, Stopped the ad and continued your song!:)
	}

}

Return

;;------------------------------------------------------------------------------------------------


