tell application "System Events"
    tell process "zoom.us"
        -- メニューバーの存在確認
        set menuBar to menu bar 1
        log menuBar

        -- メニューバーアイテム「ミーティング」を取得
        set meetingMenuItem to menu bar item "ミーティング" of menu bar 1
        
        -- メニューバーアイテムの中の「ミーティング」メニューを取得
        set meetingMenu to menu 1 of meetingMenuItem
        
        -- メニュー内のすべての項目を取得
        (*
        set menuItems to menu items of meetingMenu
        log(menuItems)
        repeat with item in menuItems -- err
            --set end of menuItemNames to item name of item
            --log (item)
        end repeat
        *)

        set muteItem to menu item 10 of meetingMenu
        log "muteItem: " & name of muteItem

        if name of muteItem is "オーディオのミュート" then
          return false
        end if
        return true
        
        -- 各メニュー項目の名前をリストに格納
        (*
        set menuItemNames to {}
        repeat with item in menuItems
            --set end of menuItemNames to item name of item
            --log (item)
        end repeat
        *)

        (*
        -- 結果を返す
        return menuItemNames
        *)

        (*
        -- メニューバーアイテム「ミーティング」の存在確認
        set meetingItem to menu bar item "ミーティング" of menuBar
        log meetingItem

        log "attributes of meetingItem"
        set attributesList to attributes of meetingItem
        repeat with attr in attributesList
            log (name of attr)
        end repeat

        log "attributes of menu"
        set meetingMenu to menu "ミーティング" of menu bar item "ミーティング" of menu bar 1
        set menuItems to menu items of meetingMenu
        repeat with item in menuItems
            log (name of item)
        end repeat
        *)

        (*
        -- 属性「オーディオのミュート」の存在確認
        -- AXTitle = ミーティング
        -- AXPosition 173, 0
        set muteAttribute to value of attribute "AXChildren" of meetingItem
        log muteAttribute
        *)
    end tell
end tell
