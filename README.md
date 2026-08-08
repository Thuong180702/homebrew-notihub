# homebrew-notihub

Homebrew tap for [notihub](https://github.com/Thuong180702/notihub) — an all-in-one native macOS notification hub for web apps (Messenger, Zalo, Gmail, Telegram, Slack & custom web apps).

## Install

```bash
brew tap thuong180702/notihub
brew install --cask notihub
```

## Update

```bash
brew upgrade --cask notihub
```

## Uninstall

```bash
brew uninstall --cask notihub
```

notihub is signed ad-hoc, not notarized by Apple. If macOS Gatekeeper blocks the first launch with "notihub is damaged and can't be opened", run:

```bash
xattr -dr com.apple.quarantine /Applications/notihub.app
```
