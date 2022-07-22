typeset -U path PATH
path=(
	/usr/local/bin(N-/)
	$HOME/.pyenv/bin(N-/)
	$HOME/.pyenv/shims(N-/)
	$HOME/go/bin(N-/)
	$HOME/google-cloud-sdk/bin/gcloud(N-/)
	$HOME/.cargo/env(N-/)
	$HOME/Library/pnpm
	$HOME/.pub-cache/bin(N-/)
	$HOME/fvm/versions/2.8.1/bin(N-/)
	$HOME/.deno/bin(N-/)
	$HOME/.rbenv/shims(N-/)
  $HOME/.nodenv/shims(N-/)
	$HOME/my-cli/bin(N-/)
	/usr/bin(N-/)
	/usr/bin/java(N-/)
	/opt/homebrew/bin(N-/)
	/opt/homebrew/opt/postgresql@12/bin(N-/)
	/opt/homebrew/opt/mysql@5.7/bin(N-/)
	$path
)
PGDATA=/opt/homebrew/bin/postgres
LDFLAGS=-L/opt/homebrew/opt/openssl@1.1/lib
CPPFLAGS=-I/opt/homebrew/opt/openssl@1.1/include
GOPATH=$HOME/go

setopt magic_equal_subst

eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(starship init zsh)"


if [[ "${(L)$( uname -s )}" == darwin ]] && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -arch x86_64 "$SHELL"'
	alias a64='exec arch -arch arm64e "$SHELL"'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch "$SHELL"ò
	}
fi

# alias
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias vs="code ."
alias ls="ls -a -l"
alias rosetta="arch -x86_64"
alias please="sudo"
alias sim="open -a Simulator.app"
alias nessie="deno run -A --unstable https://deno.land/x/nessie@2.0.2/cli.ts"
alias per="pipenv run"
alias yd="yarn dev"
alias yf="yarn format"
alias yb="yarn build"
alias ys="yarn start"
alias runts="npx ts-node -O '{\"module\":\"commonjs\"}'"
alias show-size="du -sh"
alias show-size-h="du -sh ./*"
alias amp="amplify"
alias dmp="docker-compose"
alias gh-w="gh repo view --web"
alias random="openssl rand -base64 32"

# nodenv の都合で global package のパスを通すのが面倒なので npx で呼ぶ
alias nest="npx nest"
alias wrangler="npx wrangler"
alias firebase="npx firebase"

# git short hands
alias gic="git commit"
alias gl="git log"
alias gaa="git add ."
alias gch="git checkout"
alias gs="git status"
alias gb="git branch"
alias gm="git merge"
alias gf="git fetch"
alias gb-m="git branch -M"
alias gc-b="git checkout -b"
alias gp-h="git push origin head"
alias gb-d="git branch -D"
alias gc-m="git commit -m"
alias gs-a="git stash apply stash@{0}"
alias gs-l="git stash list"
alias gl="git log -2"
alias gh-w="gh pr list --web"
alias gh-wc="gh pr view --web"
alias gh-wr="gh repo view --web"
alias gfo="git fetch origin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
