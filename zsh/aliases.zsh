# Filesystem
alias postgresql="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"
alias diff='colordiff'              # requires colordiff package
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias find='find . -name'
alias readonly_vim='vim -R -M'
alias grep='grep --color=auto'

## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias l='ls -lah'           # Long view, show hidden
alias la='ls -AF'           # Compact view, show hidden
alias ll='ls -lFh'          # Long view, no hidden

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias j='jobs -l'
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited

## pass options to free ## 
alias meminfo='free -m -l -t'

alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Mac Helpers
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
alias pycclean='find . -name "*.pyc" -exec rm {} \;'

# curl for useragents
alias iecurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)\""
alias ffcurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.0 (.NET CLR 3.5.30729)\""

# vim aliases
alias v='vim -S -u ~/projects/environment/dotfiles/vim/vimrc.ide'
