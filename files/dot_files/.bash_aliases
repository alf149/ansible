
# LS
alias ls='ls -l --color=auto'
alias ll='ls -ltrah --color=auto'
alias root='sudo -u root -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'


# Update
alias updateall='echo  && echo ---update/upgrade/certupdate/autoremove and flatpack -requeres sudo--- ; echo && echo  && sudo echo  echo ---update--- ; echo  && echo  && sudo apt update && sudo echo  && echo ---upgrade--- ; echo  && echo  && sudo apt upgrade -y && sudo echo  && echo ---update certificates--- ; echo  && echo  && sudo update-ca-certificates && sudo echo  && echo -- autoremove--- ; echo  && echo  && sudo apt autoremove -y && sudo echo  && echo ---update Flatpak--- ; echo  && echo  && sudo flatpak update -y  && echo  && echo  '
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'

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


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
