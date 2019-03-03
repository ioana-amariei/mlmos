# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


function configNet(){
	ifup enp0s3
	ifup enp0s8
	ip a
	ip addr show enp0s8 | grep 'inet ' | awk '{print $2}' | cut -f1 -d'/'
}
