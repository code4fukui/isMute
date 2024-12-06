try
    -- 任意のシェルスクリプトを実行
    do shell script "exit 2"
on error errMsg number errNum
    -- シェルのエラーコードを反映
    error errMsg number errNum
end try

-- 正常終了の場合にゼロを設定
error "No error" number 0
