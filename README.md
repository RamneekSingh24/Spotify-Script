# Spotify-Script
Script to skip spotify ads using AHK.

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
;Shift + right click on the shortcut and copy path of the shortcut
;set the PATH variable accordingly, defined in ^q::

;to use, close spotify if it is open and press ctrl + q
;the script will stop when the spotify app is closed by the user

;sometimes the app sends notifications, the app will glow in orange color in the taskbar
;in the case the script will not play the song, you need to maximize the window once and
;and the script will play the song, then you can minimize # Will try to fix this

;in case of any other unexpected behaviour kill the AutoHotKey process from the task manager
;script might not work if some other media is running along with spotify # Will try to fix this
