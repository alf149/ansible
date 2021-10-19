# VPN if instaled
alias vpnstart='sudo systemctl start wg-quick@wg-client0.service'
alias vpnstart53='sudo systemctl start wg-quick@wg-client53.service'
alias vpnstop='sudo systemctl stop wg-quick@wg-client0.service'
alias vpnstop53='sudo systemctl stop wg-quick@wg-client53.service'
alias vpnstatus='sudo systemctl status wg-quick@wg-client0.service'
alias vpnstatus53='sudo systemctl status wg-quick@wg-client53.service'


# LS
alias ls='ls -l --color=auto'
alias ll='ls -ltrah --color=auto'
alias root='sudo -u root -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# Update
alias updateall='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh && sudo flatpak update -y'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'

#screen 
alias cls='clear'

#dir
alias ..='cd ..'
alias home='cd ~'
alias cd..='cd ..'

#Grep
alias gh='history|grep'
alias h='history 100'     

#Network
##Ports
alias ports='sudo netstat -tulpn'
alias locip='hostname -I'
alias pubip='echo $(curl -s ipinfo.io/ip)'

## ssh
alias sshstart='eval $(ssh-agent) && ssh-add'


#system
alias meminfo='free -m -l -t'
alias runing-service='systemctl list-units --type=service --state=running'

# Filesystem diskspace usage
alias dus='df -h'

# WSL kun på windows
alias exp='explorer.exe .'
alias fcode='flatpak run com.visualstudio.code' 

# Tid
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

HISTTIMEFORMAT="%d/%m/%y %T: "

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

##  Add User bin ton path
export PATH="$HOME/bin:$PATH"
