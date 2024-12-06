tell application "System Events"
    tell process "zoom.us"
        -- メニューバーの存在確認
        set menuBar to menu bar 1
        -- log menuBar

        -- メニューバーアイテム「ミーティング」を取得
        set meetingMenuItem to menu bar item "ミーティング" of menu bar 1
        
        -- メニューバーアイテムの中の「ミーティング」メニューを取得
        set meetingMenu to menu 1 of meetingMenuItem
        
        -- メニュー内の10番目の項目「オーディオのミュート」を取得
        set muteItem to menu item 10 of meetingMenu
        -- log "muteItem: " & name of muteItem

        if name of muteItem is "オーディオのミュート" then
          return 0
        else if name of muteItem is "オーディオのミュート解除" then
          return 0
        else
          -- エラー
          error "mute menu is not exists" number 1
        end if
    end tell
end tell
