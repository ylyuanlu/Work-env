##################################################################
# Aliases setting of Common command 
##################################################################
alias lj='jobs -l'
alias la='ls -a'
alias lla='ls -la'
alias vd='vimdiff'
alias vi='vim'
alias cr='clear'

alias nf='find -name'
alias sadb='sudo adb'
alias sfb='sudo fastboot'
alias sbr='source ~/.bashrc'

##################################################################
# Alias setting of Openning files
##################################################################
alias avi='vi ~/.bash_aliases'
alias bvi='vi ~/.bashrc'
alias pvi='vi ~/.bash_aliases_project'
alias gvi='vi ~/.gitconfig'
alias vvi='vi ~/.vimrc'
alias cvi='vi ~/.ssh/config'

alias Avi='vi Android.mk'
alias Mvi='vi Makefile'

##################################################################
# Alias setting of compile
##################################################################
alias mkcache='~/Workspace/Code/mrd8-ww43-high/prebuilts/misc/linux-x86/ccache -M 50G'

alias zmm='mm -j8 2>&1 | tee ~/Debuglog/zmm_compile.log'
alias bmm='mm -B -j8 2>&1 | tee ~/Debuglog/bmm_compile.log'
alias zmk='make -j8 2>&1 | tee ~/Debuglog/zmk_compile.log'
alias bmk='make -B -j8 2>&1 | tee ~/Debuglog/bmk_compile.log'

alias kmpmk='make mrproper'
alias kcfgmk='make menuconfig'

##################################################################
# alias setting of cd 
##################################################################
alias bcd='cd ~/bin'

alias vcd='cd ~/.vim'
alias vpcd='cd ~/.vim/plugin'

alias wcd='cd ~/Workspace'
alias dcd='cd ~/database_code'
alias ccd='cd ~/Code'
alias sshcd='cd ~/.ssh'

alias wccd='cd ~/Workspace/Code'
alias wicd='cd ~/Workspace/Install-packages'
alias cgcd='cd ~/Code/gitolite-admin'
alias wwcd='cd ~/Workspace/Work-env'
alias wwscd='cd ~/Workspace/Work-env/scripts'
alias wwccd='cd ~/Workspace/Work-env/config'

##################################################################
# Alias setting of writing images
##################################################################
alias bsl='sfb flash boot'
alias ssl='sfb flash system'
alias bssl='sadb reboot bootloader && bsl boot.img && ssl system.img && sfb reboot'
alias lbssl='licd && sadb reboot bootloader && bsl boot.img && ssl system.img && sfb reboot'
alias hbssl='hicd && sadb reboot bootloader && bsl boot.img && ssl system.img && sfb reboot'

##################################################################
# Aliases setting of adb debug
##################################################################
alias klog='adb shell cat /proc/kmsg 2>&1 | tee ~/Debuglog/kernel_logcat.log'
alias alog='adb logcat -c && adb logcat -v time 2>&1 | tee ~/Debuglog/android_logcat.log'

alias klvi='vi ~/Debuglog/kernel_logcat.log'
alias alvi='vi ~/Debuglog/android_logcat.log'

##################################################################
# Aliases setting of open wifi project
##################################################################
WIFI_P2P_SETTINGS=/home/yuanlu/Workspace/Code/mrd8-ww43-high/packages/apps/Settings/src/com/android/settings/wifi
WIFI_P2P_FRAMEWORKS=/home/yuanlu/Workspace/Code/mrd8-ww43-high/frameworks/base
WIFI_P2P_WPA_SUPPLICANT=/home/yuanlu/Workspace/Code/mrd8-ww43-high/external/wpa_supplicant_8

alias wjvi=
alias wcvi=

alias pjvi=
alias pcvi=
