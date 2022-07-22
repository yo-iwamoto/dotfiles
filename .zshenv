export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export RUSTC_WRAPPER="/opt/homebrew/bin/sccache"
. "$HOME/.cargo/env"
autoload -Uz compinit
compinit
