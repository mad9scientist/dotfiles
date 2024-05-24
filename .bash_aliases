alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Lazy

## APT
alias upd='sudo apt update && sudo apt upgrade'
alias apti='sudo apt install'
alias apts='apt search'
alias aptp='apt-cache policy'

# Service Control
alias bounce='sudo systemctl restart'
alias sysi='sudo systemctl status'

# nginx
alias ncr='nginx -t && sudo systemctl reload nginx'

# Git
alias gcam='git commit -am'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gco='git checkout'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias svim='sudo vim'
alias fuckit='sudo su -' # sudo -i

alias headers='curl -I'
alias wget='wget -c' # resume downlaods

alias dus='du -sh' # disk usage summary/human for location

alias findf='find . -type f -name'

alias vsyslogs='tail -f /var/log/syslog' 
alias vmailogs='tail -f /var/log/mail.log'