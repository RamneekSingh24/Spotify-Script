# Spotify-Script-To-Skip-Ads
Script to skip spotify ads using AHK.

Will only work if on restarting the app when an advertisement plays, the next track in the list is played instead of the advert.
Check this manually, this does not seem to work for everyone.

The script simply automates this process.

For a quick tutorial on how to install AutoHotkey and run scripts see https://www.youtube.com/watch?v=lxLNtBYjkjU 
The first 2 mins are sufficient, tutorial + setup will take 3-4 minutes at max.

STEPS-
1. Create a shortcut for spotify app, right click on it => properties
2. add --minimized tag in the target field, Eg: C:\Users\DELL\AppData\Roaming\Spotify\Spotify.exe --minimized
3. Now Shift + right click on the shortcut and copy path of the shortcut
4. Open the script ByeByeAds.ahk with any text editor, set the PATH variable accordingly, defined in ^q::

To use, run the script, close spotify if it is open and press ctrl + q, the script open the app and restart the app once to verify if it is working.
Enjoy!

The script will stop when the spotify app is closed by the user

Sometimes when the app sends notifications, the app will glow in orange color in the taskbar
in this case the script might not play the song, you need to maximize the window once and
and the script will play the song, then you can minimize # Will try to fix this

In case of any other unexpected behaviour kill the AutoHotKey process from the task manager
Script will might not play the track if someother media is running along with spotify. # Will try to fix this

After prolonged use the script may not restart the app / Play the next track when advert an advert comes. Maximizing the once will do the job.
