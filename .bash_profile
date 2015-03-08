alias drop="cd ~/Dropbox"
alias ls="ls -Gfh"
alias ..="cd .."
alias ....="cd ../.."
alias home="cd ~"

func(){
	${git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'}
}

to_add_to_prompt() {
	branch=$(func)
	to_add=''
	if ["$branch" == '']; then 
		to_add='nothing'
        else 
		to_add='curr-git-branch: '
        fi
	echo "$to_add$branch"
}

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

#run first: brew install bash-git-prompt
#readme on https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

#PS1="$COLOR_GREEN[\w]$COLOR_RED\$(to_add_to_prompt)\n$COLOR_BLUE\u$COLOR_YELLOW-> $COLOR_RESET"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset' --abbrev-commit"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
