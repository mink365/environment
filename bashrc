
#-------------------------------
# PATH and Librory
#-------------------------------
ANDROID_ROOT=~/workspace/android/
export NDK_ROOT=$ANDROID_ROOT/android-ndk-r8d/

LLVM_ROOT=~/workspace/llvm/build/Release+Asserts/

QT5_ROOT=~/workspace/qt/qt5/

export PATH=~/bin:$QT5_ROOTqt/qt5/qtbase/bin/:$ANDROID_ROOT/sdk/platform-tools/:$LLVM_ROOT/bin:$PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LLVM_ROOT/lib/

export EDITOR=vim

shopt -s histappend
PROMPT_COMMAND='history -a'

#----------------------------
# Auto complete
#---------------------------
complete -cf sudo
complete -cf man

#---------------------------
# Alias
#--------------------------
alias ls='ls --color=auto'
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

#--------------------------------
# Extract
#------------------------------
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}

#----------------------
# Colored PS
#---------------------
PS1='\[\033[0;32m\]\u@\h \[\033[1;33m\]\w\n\[\033[0m\]> '
PS2='\\ '
