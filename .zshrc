# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="daveverwer"

# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='vim'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -f ~/.zshInsulter/zsh.command-not-found ]; then
    . ~/.zshInsulter/zsh.command-not-found
fi

export PATH=$PATH:/snap/bin:$HOME/.local/bin
export PATH=$PATH:/home/davram/.scripts

function vim_open()
{
	for i in $*
	do
		if [[ $i =~ ".sh$" && ! -f $i ]]
		then
			touch $i
			chmod +x $i
		fi
	done

	vim -O $*
}

alias vim="vim_open"

