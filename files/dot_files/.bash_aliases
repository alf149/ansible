
# LS
alias ls='ls -l --color=auto'
alias ll='ls -ltrah --color=auto'
alias root='sudo -u root -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'


# Update
alias updateall='echo  && echo ---update/upgrade/certupdate/autoremove and flatpack -requeres sudo--- ; echo && echo  && sudo echo  echo ---update--- ; echo  && echo  && sudo apt update && sudo echo  && echo ---upgrade--- ; echo  && echo  && sudo apt upgrade -y && sudo echo  && echo ---update certificates--- ; echo  && echo  && sudo update-ca-certificates && sudo echo  && echo -- autoremove--- ; echo  && echo  && sudo apt autoremove -y && sudo echo  && echo ---update Flatpak--- ; echo  && echo  && sudo flatpak update -y  && echo  && echo  '
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias updatedist='sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y'
alias updatefull='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'

#screen 
alias cls='clear'

#dir
alias ..='cd ..'
alias home='cd ~'
alias cd..='cd ..'


#Grep
alias hg='history|grep'
alias h='history 100'     


#Network
##Ports
alias ports='sudo netstat -tulpn'
alias portss='sudo ss -tulpn'
alias locip='hostname -I'
alias pubip='echo $(curl -s ipinfo.io/ip)'


#system
alias meminfo='free -m -l -t'
alias runing-service='systemctl list-units --type=service --state=running'


# Filesystem diskspace usage
alias duh='df -h'


# Tid
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## Add date to history
HISTTIMEFORMAT="%d/%m/%y %T: "
