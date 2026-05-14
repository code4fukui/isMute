# isMute

Zoomクライアントのミュート状態および通話状態を確認するためのmacOS用AppleScriptのセットです。

## 必要条件

*   ZoomクライアントがインストールされたmacOS。
*   **重要:** これらのスクリプトは**日本語のシステム言語環境**向けに設計されています。日本語のメニュー項目のテキスト（例: "オーディオのミュート解除"）の検索に依存しているため、他の言語に設定されたシステムでは動作しません。

## 使い方

スクリプトはシェルの終了コードを使用して状態を示します。条件が「真」（例: ミュートされている）の場合は `0` を返し、「偽」またはエラー（例: Zoomが通話中でない）の場合は0以外のコードを返します。

このため、シェルスクリプトでの使用に適しています。

### ミュート状態の確認

アクティブな通話中にミュートされている場合、`0`で終了します。

```sh
if osascript zoom-is-mute.applescript 2>/dev/null; then
  echo "You are MUTED."
else
  echo "You are UNMUTED or not in a call."
fi
```

### ミュート解除状態の確認

アクティブな通話中にミュート解除されている場合、`0`で終了します。

```sh
if osascript zoom-is-unmute.applescript 2>/dev/null; then
  echo "You are UNMUTED."
else
  echo "You are MUTED or not in a call."
fi
```

### 通話がアクティブかどうかの確認

Zoomの通話がアクティブな場合（ミュート状態に関係なく）、`0`で終了します。

```sh
if osascript zoom-is-active.applescript 2>/dev/null; then
  echo "Zoom call is ACTIVE."
else
  echo "Zoom call is INACTIVE."
fi
```

### シェルラッパー

利便性のため、AppleScriptのエラー出力を抑制するシンプルなシェルスクリプトラッパーが用意されています。

*   `./zoom-is-mute.sh`
*   `./zoom-is-active.sh`

```sh
# Example using the wrapper
if ./zoom-is-mute.sh; then
  echo "Muted"
fi
```

## 動作原理

スクリプトはAppleScriptのUIオートメーションを使用して、`zoom.us`プロセスのメニュー項目を調べます。「ミーティング」メニューにあるオーディオのミュート／ミュート解除オプションのテキストを確認することで、現在の状態を判定します。

## ライセンス

MIT License — 詳細は [LICENSE](LICENSE) を参照してください。
