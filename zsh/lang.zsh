# asdf
. "$HOME/.asdf/asdf.sh"
# . ~/.asdf/plugins/java/set-java-home.zshs
# Rust
[[ -f "$HOME/.cargo/env" ]] && . $HOME/.cargo/env

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"

# Golang
# export PATH="$(go env GOPATH)/bin:$PATH"

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

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
export PATH="$PNPM_HOME:$PATH"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$VOLTA_HOME/tools/image/packages/corepack/bin/:$PATH"

# pnpm
export PNPM_HOME="/Users/pieter/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac