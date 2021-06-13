## Personal configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export UPDATE_ZSH_DAYS=1
export LANG=en_US.UTF-8
export EDITOR=nano

HOSTNAME_COLOR=$(cat /root/.hostname_color)
CASE_SENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="+%d %b %H:%M"

plugins=(
	zsh-completions
	zsh-navigation-tools
#	zsh-syntax-highlighting
	zsh-autosuggestions
	command-not-found
)

## Base zsh script (after plugins)
source $ZSH/oh-my-zsh.sh


## Alias

	# Add verbose mode
	alias rm='rm -v'
	alias trash='trash -v'
	alias cp='cp -v'
	alias mv='mv -v'

	# Add color
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias diff='diff --color=auto'
	alias ip='ifconfig | ccze -A'

	# Custom
	alias l='ls --time-style="+%d-%b-%y %H:%M:%S" -hAl'
	alias lt='ls --time-style="+%d-%b-%y %H:%M:%S" -hAltr'
	alias netspeed='ethtool eth0 | grep Speed'
	alias emoji="cat ~/.emoji"
	alias c='ccze -A'
	alias ideapad='xfreerdp /u:lespink /v:ideapad /p:lespinkideapad +auto-reconnect /auto-reconnect-max-retries:10 -encryption +window-drag +aero /from-stdin:force /log-level:ERROR /f /cert-ignore'
	alias ulefone='xvncviewer -quality 0  192.168.1.21:5900'
	alias samsung='xvncviewer -quality 0  192.168.1.94:5900'

	# Man/less color
	export LESS_TERMCAP_mb=$'\E[1;31m'
	export LESS_TERMCAP_md=$'\E[1;36m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_so=$'\E[01;33m'
	export LESS_TERMCAP_se=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[1;32m'
	export LESS_TERMCAP_ue=$'\E[0m'

## Syntax highligthing configuration
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=fg

	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow,bold,underline
	ZSH_HIGHLIGHT_STYLES[comment]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[assign]=fg=cyan
	ZSH_HIGHLIGHT_STYLES[named-fd]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=yellow

	# Path
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=cyan
	ZSH_HIGHLIGHT_STYLES[path]=fg=grey,underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=grey,underline
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=fg=grey,underline
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold

	# Substitution
	ZSH_HIGHLIGHT_STYLES[command-substitution]=cyan
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[process-substitution]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=blue
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold

	# Hyphens
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=yellow,bold

	# Quotes
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=red,bold

	# Brackets
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout


if [[ ${SSH_CONNECTION} ]]
	then
		unset DISPLAY
	else
		export DISPLAY=:0.0
fi

PROMPT='%{$fg_bold[${HOSTNAME_COLOR}]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})%B#%b '
RPROMPT='%{$fg_bold[white]%}%*%{$reset_color%}'
