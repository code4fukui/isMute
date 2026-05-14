# isMute

> 日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

A set of AppleScripts for macOS to check the mute and call status of the Zoom client.

## Prerequisites

*   macOS with the Zoom client installed.
*   **Important:** These scripts are designed for a **Japanese system language environment**. They rely on finding Japanese menu item text (e.g., "オーディオのミュート解除") and will fail on systems set to other languages.

## Usage

The scripts use shell exit codes to indicate status: `0` for a "true" condition (e.g., is muted) and a non-zero code for a "false" condition or an error (e.g., Zoom is not in a call).

This makes them suitable for use in shell scripts.

### Check if Muted

Exits with `0` if you are muted in an active call.

```sh
if osascript zoom-is-mute.applescript 2>/dev/null; then
  echo "You are MUTED."
else
  echo "You are UNMUTED or not in a call."
fi
```

### Check if Unmuted

Exits with `0` if you are unmuted in an active call.

```sh
if osascript zoom-is-unmute.applescript 2>/dev/null; then
  echo "You are UNMUTED."
else
  echo "You are MUTED or not in a call."
fi
```

### Check if a Call is Active

Exits with `0` if a Zoom call is active (regardless of mute status).

```sh
if osascript zoom-is-active.applescript 2>/dev/null; then
  echo "Zoom call is ACTIVE."
else
  echo "Zoom call is INACTIVE."
fi
```

### Shell Wrappers

For convenience, simple shell script wrappers are provided to suppress AppleScript's error output:

*   `./zoom-is-mute.sh`
*   `./zoom-is-active.sh`

```sh
# Example using the wrapper
if ./zoom-is-mute.sh; then
  echo "Muted"
fi
```

## How It Works

The scripts use AppleScript's UI automation to inspect the menu items of the `zoom.us` process. They determine the current state by checking the text of the audio mute/unmute option under the "ミーティング" (Meeting) menu.

## License

MIT License — see [LICENSE](LICENSE).