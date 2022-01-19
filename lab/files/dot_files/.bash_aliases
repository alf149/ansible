# VPN if instaled
alias vpnstart='sudo systemctl start wg-quick@wg-client0.service'
alias vpnstop='sudo systemctl stop wg-quick@wg-client0.service'
alias vpnstatus='sudo systemctl status wg-quick@wg-client0.service'

alias vpnstart53='sudo systemctl start wg-quick@wg-client53.service'
alias vpnstop53='sudo systemctl stop wg-quick@wg-client53.service'
alias vpnstatus53='sudo systemctl status wg-quick@wg-client53.service'

alias vpnstart8080='sudo systemctl start wg-quick@wg-client8080.service'
alias vpnstop8080='sudo systemctl stop wg-quick@wg-client8080.service'
alias vpnstatus8080='sudo systemctl status wg-quick@wg-client8080.service'


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
alias locip='hostname -I'
alias pubip='echo $(curl -s ipinfo.io/ip)'

## ssh
alias sshstart='eval $(ssh-agent) && ssh-add'
alias sshpop='eval $(ssh-agent) && ssh-add ~/.ssh/hpg8_pop'

#system
alias meminfo='free -m -l -t'
alias runing-service='systemctl list-units --type=service --state=running'

# Filesystem diskspace usage
alias dus='df -h'

# Tid
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'


# GIT
# git add commit push default 
## usage
# gacpd
function gacpd() {
    echo "This will add, commit and push all the files to the master branch with the comment 'small fixes'"
    read -p "Do you want to proceed? y/n " -n 1 -r
    if [[ "$REPLY" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        git add .
        git commit -m "small fixes"
        git push origin main
    else
        echo -e "\n Quit."
    fi
}
alias alias2git='cp ~/.bash_aliases ~/Documents/git/myfiles/dotfiles/.bash_aliases'


##  Add User bin to path
export PATH="$HOME/bin:$PATH"

## Add date to history
HISTTIMEFORMAT="%d/%m/%y %T: "

### WLS
# WSL kun på windows
alias exp='explorer.exe .'
alias fcode='flatpak run com.visualstudio.code' 
alias winhome=' cd /mnt/c/Users/rolf'
