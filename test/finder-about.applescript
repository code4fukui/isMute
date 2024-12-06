tell application "System Events"
    tell application process "Finder"
        set frontmost to true
        click menu item "Finderについて" of menu "Finder" of menu bar 1
    end tell
    display dialog 3
    -- ここに命令を書く
end tell

(*
tell application "System Events"
    tell application process "zoom.us"
        set muteMenuItem to (menu bar 1's menu bar item "Meeting" whose exists is true)
        if muteMenuItem exists then
            set muteStatus to (value of attribute "AXTitle" of menu item "Mute Audio" of menu "Meeting" of muteMenuItem)
            return muteStatus
        else
            return "Zoom is not running or inaccessible"
        end if
    end tell
end tell
*)