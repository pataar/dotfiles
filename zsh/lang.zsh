# Rust
[[ -f "$HOME/.cargo/env" ]] && . $HOME/.cargo/env

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"

# Golang
# export PATH="$(go env GOPATH)/bin:$PATH"

# bun completions
source_if_exists "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# z
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

# java stuff
source_if_exists ~/.asdf/plugins/java/set-java-home.zsh

# pnpm
export PNPM_HOME="/Users/pieter/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# asdf
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

export PATH="/Users/pieter/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/pieter/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
