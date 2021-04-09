;will only work if on restarting the  app when an advertisement
;plays, the next track in the list is played instead of the advert.
;check this manually, this does not seem to work for everyone

;for tutorial on how to install AutoHotkey and run the script see
; https://www.youtube.com/watch?v=lxLNtBYjkjU    , the first 2 mins are sufficient
; tutorial + setup will take 3-4 minutes at max.

; STEPS-
;create a shortcut for spotify app, right click on it  => properties
;add --minimized tag in the target field
;C:\Users\DELL\AppData\Roaming\Spotify\Spotify.exe --minimized
;Shit + right click on the shortcut and copy path of the shortcut
;set the PATH variable accordingly, defined in ^q::

;to use, close spotify if it is open and press ctrl + q
;the script will stop when the spotify app is closed by the user

;sometimes the app sends notifications, the app will glow in orange color in the taskbar
;in the case the script will not play the song, you need to maximize the window once and
;and the script will play the song, then you can minimize # Will try to fix this

;in case of any other unexpected behaviour kill the AutoHotKey process from the task manager
;script might not work if some other media is running along with spotify # Will try to fix this

;kindly fill this form after using, https://docs.google.com/forms/d/e/1FAIpQLScg-PmfrnjOBguNHosf7NZdYcGAjLuqCHMgOHOfCg8ZDlLe2Q/viewform?usp=sf_link

;Author : Ramneek Singh

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
	
	Run, %PATH%
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
sendPlayPause()
Sleep, 2000
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
        openSpotify(PATH)
		sendPlayPause()
		Sleep, 2000
		;MsgBox, Stopped the ad and continued your song!:)
	}

}

Return

;;------------------------------------------------------------------------------------------------


