######
# Author: Rick L.
# Date  : 20210509
# Info  : latest and greatest bashrc file
#
######

#source  ~/bin/tmux-completion/tmux
#source <(kubectl completion bash)

#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/rickl/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=0
export TERM=linux
#unset ${!DOCKER*}
# if [ "$( docker container inspect -f '{{.State.Running}}' "ubuntu-01" )" == "true" ]; then echo "ubuntu is running, execute your command..." ; fi
alias docker_ubuntu='docker run -it ubuntu /bin/bash'
alias docker_bashlatest='docker run -it --rm bash:4.4'
alias docker_nginx='docker run -d -p 80:80 --name webserver nginx'

# inserted for Mac Catalina update.  By default shell is now /bin/zsh and if you want another shell you get warning messages.  This removes those warnings.
export BASH_SILENCE_DEPRECATION_WARNING=1

# if not interactive just stop - helps with scp and TTY errors
[ -z "$PS1" ] && return

#LINE=$(tput smul)                         # turn on underline
#ULINE=$(tput rmul)                        # turn off underline
#BOLD=$(tput smso)                         # turn on bold
#UBOLD=$(tput rmso)                        # turn off bold
#GREENF=$(tput setaf 2)                    # green foreground
#LIGHT_REDF=$(tput setaf 1 ; tput bold )   # light red foreground
#NORM=$(tput sgr0)                         # reset to normal display
#YELLOWF=$(tput setaf 3)                   # yellow foreground
LOG=$HOME/daily.log                       # record events (experimenting with this)
stty erase '^H'
JAVA_VERSION="jdk-15.0.2.jdk"

HOST=$(uname -n | awk -F. '{print $1}')
HISTIGNORE="ls:exit"
HISTSIZE=50000
HISTCONTROL=ignoredups       
HISTFILE=~/.bhist
HISTTIMEFORMAT="#%Y-%m-%d %H:%M:%S# "
JAVA_VERSION=default
JAVA_HOME=/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home
JAVA_PATH=${JAVA_HOME}
JDK_HOME=/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home
#CATALINA_HOME=/usr/local/tomcat
#TL=/usr/local/tomcat/logs/catalina.out
EDITOR=vi
VIMHOME=$HOME/.vim
PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/bin:/sbin:/usr/sbin:$JAVA_HOME/bin:$HOME/Library/Python/2.7/bin:$PATH
PROMPT_COMMAND="history -a"
#LESS="--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET --quit-if-one-screen --QUIT-AT-EOF"
LESS="--LONG-PROMPT --ignore-case --QUIET -X"
#CDPATH=.:~:/usr/local/tomcat:/usr/local/tomcat/conf/Catalina
MYSQL_PS1="(\u@\h) \\R:\\m:\\s [\d]> "
#MYSQL_HOST=$(hostname -s)
#PYTHONPATH=/usr/local/lib/python2.7/site-packages/
SSLKEYLOGFILE=$HOME/Desktop/scratch/logfile.txt
#LOCATE_PATH="~/tmp/locatedb"
#DEPOT_TOOLS=$HOME/depot_tools/
HISTSIZE=100000
HISTFILESIZE=100000

shopt -s cdspell
shopt -s nocaseglob
shopt -s histappend
shopt -q -s checkwinsize
shopt -q -s cmdhist
shopt -s extglob
shopt -s dotglob
set -o notify
#set -o vi
set autolist                    # auto list possibilities after ambiguous completion
set dunique                     # removes duplicate entries in the dirstack

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A command    nohup exec eval trace gdb
complete -A command    command type which
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger
complete -A directory  mkdir rmdir
complete -A directory   -o default cd
complete -f -d -X '*.gz'  gzip
complete -f -d -X '*.bz2' bzip2
complete -f -o default -X '!*.gz'  gunzip
complete -f -o default -X '!*.bz2' bunzip2
complete -f -o default -X '!*.pl'  perl perl5

case $HOST
        in
                admin0[1-2]     )           ROLE="JUMP_POINT" ;;
                jt0[2-3]        )           ROLE="ANALYZER" ;;
                rick-mac        )           ROLE="LAPTOP" ;;
                rick-work-macbook.local )   ROLE="LAPTOP" ;;
                rick-work-macbook       )   ROLE="LAPTOP" ;;
                nlrl-laptop     )	        ROLE="LAPTOP" ;;
                nlrl-laptop.local       )   ROLE="LAPTOP" ;;
                *               )           ROLE="UNKNOWN" ;;
esac

ps1_set(){
    local prompt_char='$'
    local separator="\n"
    
    if [[ ${UID} -eq 0 ]] ; then
        prompt_char='#'
    fi

    while [[ $# -gt 0 ]] ; do
        token="$1" ; shift
        
        case "${token}" in
            --trace)
                export PS4=`+[${BASH_SOURCE}] : ${LINENO} : ${FUNCNAME[0]:+${FUNCNAME[0]}{} $ }`
                set -o xtrace
                ;;
            --prompt)
                prompt_char="$1"
                shift
                ;;
            --separator)
                separator="$1"
                shift
                ;;
            *)
                true
                ;;
        esac
    done
    PS1="\D{%H:%M:%S}${separator}${prompt_char} "
}

shrug() { echo "¯\_(ツ)_/¯"; }

example() { echo "EXAMPLE:"; echo; echo " $@"; echo; echo "OUTPUT:"; echo ; eval "$@" | sed 's/^/ /'; }

fliptable() { echo "（╯°□°）╯ ┻━┻"; }

snow() {
        clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}

function URLEncode { 
    local dataLength="${#1}"; local index; for ((index = 0;index < dataLength;index++)); do local char="${1:index:1}"; case $char in [a-zA-Z0-9.~_-]) printf "$char"; ;; *) printf "%%%02X" "'$char"; ;; esac; done; 
}

blue() { tput setaf 4; echo "$@"; tput sgr0; }

display_clock() {
        LIGHT_BLUE="$(tput setaf 4; tput bold)"
        DEFAULT="$(tput sgr0)"

        CLOCK="[$LIGHT_BLUE$(date +%H:%M:%S)$DEFAULT]"

        # <columns in display> - len($CLOCK)
        let UPPER_RIGHT=$(tput cols)-10

        tput sc
        tput cup 0 ${UPPER_RIGHT}
        echo -n ${CLOCK}
        tput rc
}


[ $UID -eq 0 ] && PROMPT="#" || PROMPT="$"

# dumb terminal check put in place to deal with sftp connections failing 
if [ "$TERM" != "dumb" ] ; then
    # broken with Big Sur update for Mac
    PS1="\n/-={[\t]-[\d]-[jobs=\j]-[cmd \#]-[$(echo \$?)]}=-\n\-={\u@\h:${ROLE}\w} ${PROMPT} "
    #PS1="┌──\u@\h[\w]\n└─╼ "
    #PS1="> "
    display_clock
else
    PS1="> "
fi


export PATH JAVA_VERSION JAVA_HOME JAVA_PATH JDK_HOME CATALINA_HOME ANT_HOME HISTIGNORE HISTSIZE HISTCONTROL HISTFILE PROMPT_COMMAND LESS CDPATH MYSQL_PS1 MYSQL_HOST HISTTIMEFORMAT TL EDITOR VIMHOME LOCATE_PATH PYTHONPATH SSLKEYLOGFILE DEPOT_TOOLS

vi() {
    [ ! -d ~/.bak ] && mkdir ~/.bak

    for FILE in $* ; do
        if [ -f $FILE ] ; then
            NFILE=$FILE              # added to fix path errors
            FILE=$(basename $FILE)
            test -f ~/.bak/$FILE.8 && mv -f ~/.bak/$FILE.8  ~/.bak/$FILE.9
            test -f ~/.bak/$FILE.7 && mv -f ~/.bak/$FILE.7  ~/.bak/$FILE.8
            test -f ~/.bak/$FILE.6 && mv -f ~/.bak/$FILE.6  ~/.bak/$FILE.7
            test -f ~/.bak/$FILE.5 && mv -f ~/.bak/$FILE.5  ~/.bak/$FILE.6
            test -f ~/.bak/$FILE.4 && mv -f ~/.bak/$FILE.4  ~/.bak/$FILE.5
            test -f ~/.bak/$FILE.3 && mv -f ~/.bak/$FILE.3  ~/.bak/$FILE.4
            test -f ~/.bak/$FILE.2 && mv -f ~/.bak/$FILE.2  ~/.bak/$FILE.3
            test -f ~/.bak/$FILE.1 && mv -f ~/.bak/$FILE.1  ~/.bak/$FILE.2
            test -f ~/.bak/$FILE.0 && mv -f ~/.bak/$FILE.0  ~/.bak/$FILE.1
            cp $NFILE ~/.bak/$FILE.0
        fi
    done
    if [ -x /usr/local/bin/vim ] ; then
        /usr/local/bin/vim $*
    elif [ -x /usr/bin/vim ] ; then
        /usr/bin/vim $*
    else
        /bin/vi $*
   fi
}

runme() {
        [ $# -lt 1 ] && echo 'Usage: runme "commands_to_run"' && return 1
        [ ! -f ~/hosts.ascii ] && echo "Error: Check to make sure the hosts.ascii file is in your home directory." && return 1
        for SERVER in $(cat ~/hosts.ascii) ; do ssh -t $SERVER "$1" ; done 2>/dev/null
}

curl_debug() {
	curl -w '\n	Lookup time:\t%{time_namelookup}
	Connect time:\t%{time_connect}
	PreXfer time:\t%{time_pretransfer}
	StartXfer time:\t%{time_starttransfer}
	Size Download:\t%{size_download}
	Size Upload:\t%{size_upload}
	Size Header:\t%{size_header}
	Size Request:\t%{size_request}
	Speed Download:\t%{speed_download}
	Speed Upload:\t%{speed_upload}
	Content Type:\t%{content_type}
	Num Connects:\t%{num_connects}
	Num Redirects:\t%{num_redirects}
	Total time:\t%{time_total}\n' \
	-o /dev/null -s "$1"
}

#randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-10};echo;}
#randpw(){perl -le 'print map { (a..z)[rand 26] } 1..8'}
#randpw() { 
#    pwgen -Bsyn 12 1
#}
#randpw(){
#    python -c "import string; import random;print(''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits + string.ascii_lowercase) for _ in range(16)))"
#}
randpw(){ 
    openssl rand -base64 12
    #dd if=/dev/urandom count=200 bs=1 2>/dev/null | tr -cd "[:graph:]" | cut -c-18
}

genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=20
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

ping_servlet() {
        lynx -dump "http://$1/$2/ping?status"
}

# Usage: hourglass X (x being seconds to run it for)
hourglass(){ trap 'tput cnorm' EXIT INT;local s=$(($SECONDS +$1));(tput civis;while [[ $SECONDS -lt $s ]];do for f in '|' '\' '-' '/';do echo -n "$f" && sleep .2s && echo -n $'\b';done;done;);tput cnorm;}

inorout() {
        set -i FLAG
        case $HOST in
                # FLAG=1 is is.htm flag
                # FLAG=2 is ping servlet page
                web01) FLAG=0 ;;
                web02) FLAG=0 ;;
        esac
        if [ $FLAG -eq 1 ] ; then
                # LOCAL TEST
                if [ -f /usr/jt/jt0/www/lb/is.htm ] ; then
                        printf "${LINE}\n$HOST in service.${ULINE}\n"
                else
                        printf "${BOLD}\n$HOST is out of service!${UBOLD}\n"
                fi
                # REMOTE TEST
                if [ ! -z $REMOTE1 ] ; then
                        ssh -ttt $REMOTE1 "if [ -f /usr/jt/jt0/www/lb/is.htm ] ; \
                        then printf '${LINE}$REMOTE1 in service.${ULINE}\n' ; \
                        else printf '${BOLD}$REMOTE1 is out of service!${UBOLD}\n' ; fi" 2>/dev/null
                        ssh -ttt $REMOTE2 "if [ -f /usr/jt/jt0/www/lb/is.htm ] ; \
                        then printf '${LINE}$REMOTE2 in service.${ULINE}\n\n' ; \
                        else printf '${BOLD}$REMOTE2 is out of service!${UBOLD}\n\n' ; fi" 2>/dev/null
                else
                        ssh -ttt $REMOTE "if [ -f /usr/jt/jt0/www/lb/is.htm ] ; \
                        then printf '${LINE}$REMOTE in service.${ULINE}\n\n' ; \
                        else printf '${BOLD}$REMOTE is out of service!${UBOLD}\n\n' ; fi" 2>/dev/null
                fi
        elif [ $FLAG -eq 0 ] ; then
                echo "This server is not in a pool."
        else
                case $HOST in
                        web07|web09|web10) for INSTANCE in la bo ; do
                                        echo "host: $HOST  instance: $INSTANCE"
                                        ping_servlet $HOST $INSTANCE
                                        echo "host: $REMOTE1  instance: $INSTANCE"
                                        ping_servlet $REMOTE1 $INSTANCE
                                        echo "host: $REMOTE2  instance: $INSTANCE"
                                        ping_servlet $REMOTE2 $INSTANCE
                                     done ;;
                        web1[1-2])   for INSTANCE in ci ; do
                                        echo "host: $HOST  instance: $INSTANCE"
                                        ping_servlet $HOST $INSTANCE
                                        echo "host: $REMOTE  instance: $INSTANCE"
                                        ping_servlet $REMOTE $INSTANCE
                                     done ;;
                        web2[0-2])   for INSTANCE in vg mo ; do
                                        echo "host: $HOST  instance: $INSTANCE"
                                        ping_servlet $HOST $INSTANCE
                                        echo "host: $REMOTE1  instance: $INSTANCE"
                                        ping_servlet $REMOTE1 $INSTANCE
                                        echo "host: $REMOTE2  instance: $INSTANCE"
                                        ping_servlet $REMOTE2 $INSTANCE
                                     done ;;
                        web2[5-6])   for INSTANCE in sl sw ; do
                                        echo "host: $HOST  instance: $INSTANCE"
                                        ping_servlet $HOST $INSTANCE
                                        echo "host: $REMOTE  instance: $INSTANCE"
                                        ping_servlet $REMOTE $INSTANCE
                                     done ;;
                        web6[1-9]|web70)   for NUM in {61..70} ; do printf "web${NUM}: " ; lynx -dump http://web${NUM}/a/ping | head -1 | awk '{print $1}' ; done ;;
                esac
        fi
}

calc() {
    awk 'BEGIN {print '"$*"'; exit }'
}

# Check for the existence of a screen session, attach if one already exists or create one if there isn't one
#if [[ $TERM != 'screen' ]] ; then
#    if [[ `screen -list | grep -v "No" | awk '$2 { print }' | wc -l` == 0 ]] ; then
#        screen
#    else
#        screen -dr
#    fi
#fi


log (){
    if [ $# == 0 ]; then
        grep --color $(date '+%D') $LOG;
    else
        echo "$(date '+%D %T') $HOSTNAME [$$] $*" >> $LOG;
        echo "${GREENF}$(date '+%D %T')${NORM} $HOSTNAME ${YELLOWF}[$$]${NORM} $*";
    fi
}

#ssh(){ ## Add window title set & history feature!!
#    case $# in
#        1) printf "\033]0;[$1]\007"
#            log "SSH: $1"
#            /usr/bin/ssh $1
#            echo $1 >~/.ssh/last.txt
#            ;;
#        2) printf "\033]0;[$1] $2\007"
#            log "SSH: $1 $2"
#            /usr/bin/ssh $1 $2
#            echo $1 $2 >~/.ssh/last.txt
#            ;;
#        0)  OPTS=$(cat ~/.ssh/last.txt)
#            printf "\033]0;[$OPTS]\007"
#            log "SSH: $OPTS"
#            /usr/bin/ssh $OPTS
#            ;;
#    esac
#}

xtitle(){ ## display string in window title
    printf "\033]0;$HOSTNAME: [$*] \007"
}

extract(){
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mdc(){ 
    mkdir -p "$1" && cd "$1"
}

define(){ local y="$@";curl -sA"Opera" "http://www.google.com/search?q=define:${y// /+}"|grep -Eo '<li>[^<]+'|sed 's/^<li>//g'|nl|/usr/bin/perl -MHTML::Entities -pe 'decode_entities($_)';}

ruler() { for s in '....^....|' '1234567890'; do w=${#s}; str=$( for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do echo -n $s; done ); str=$(echo $str | cut -c -$COLUMNS) ; echo $str; done; }

box(){ c=${2-=}; l=$c$c${1//?/$c}$c$c; echo -e "$l\n$c $1 $c\n$l"; unset c l;}

# translate <phrase> <source-language>
# ex. translate hello en es 
translate(){ curl -s "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$(echo "$1" | sed 's/ /%20/g')&langpair=$2%7C$3" | sed 's/{"responseData": {"translatedText":"\([^"]*\)"}, .*}/\1\n/'; }

#gofuckanalytics() { echo "DELETE FROM moz_cookies WHERE name LIKE '__utm%';" | sqlite3 $( find ~/.mozilla -name cookies.sqlite ) }

wr(){
    declare -a WEATHERARRAY
    #WEATHERARRAY=( `elinks -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${1}&btnG=Search" | grep -A 5 -m 1 "Weather for"`)
    WEATHERARRAY=( `lynx -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${1}&btnG=Search" | grep -A 5 -m 1 "Weather for"`)
    echo ${WEATHERARRAY[@]}
}

ipme(){
    if [ $# -ne 1 ] ; then
        echo "Usage: ipme [interface]"
    else
        TEMP=$(/sbin/ifconfig $1)
        TEMP=${TEMP#*"addr:"}
        IP=${TEMP%% *}
        echo ${IP}
   fi
}

age() {
        # print number of seconds since a file was last touched
        CURRENT=$( date +%s )
        FILEAGE=$( stat -t $1 -c %Z )
        calc $CURRENT - $FILEAGE
}


randomsong() {
   set -- directory_name/*                                                                                                 
   length=$#                                                                                                        
   random_num=$(( $RANDOM % $length + 1 ))                                                                          
   mplayer "${!random_num}"                                                                                         
}   

lsmac() { 
    ifconfig -a | sed '/eth\|wl/!d;s/   Link.*HWaddr//'
}

ext_ip() { 
        curl -s "http://api.duckduckgo.com/?q=ip&format=json" | jq '.Answer' | grep --color=auto -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
}

c() {
    printf "\33[2J"
}

ff() { local IFS='|'; grep -rinE "$*" . ; }

liner() {
    num_lines=${1:-42}
    echo
    printf %${num_lines}s|tr " " "#"
    echo
}


scan() {
  if [[ -z $1 || -z $2 ]]; then
    echo "Usage: $0 <host> <port, ports, or port-range>"
    return
  fi

  local host=$1
  local ports=()
  case $2 in
    *-*)
      IFS=- read start end <<< "$2"
      for ((port=start; port <= end; port++)); do
        ports+=($port)
      done
      ;;
    *,*)
      IFS=, read -ra ports <<< "$2"
      ;;
    *)
      ports+=($2)
      ;;
  esac


  for port in "${ports[@]}"; do
    #alarm 1 "echo >/dev/tcp/$host/$port &&
      echo "port $port is open" ||
      echo "port $port is closed"
  done
}

timeDNS() { parallel -j0 --tag dig @{} "$*" ::: 208.67.222.222 208.67.220.220 198.153.192.1 198.153.194.1 156.154.70.1 156.154.71.1 8.8.8.8 8.8.4.4 | grep Query | sort -nk5; }

weather() { curl -s "http://www.wunderground.com/q/zmw:$1.1.99999" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees F/'; }

#crt() { /Applications/SecureCRT.app/Contents/MacOS/SecureCRT /T /F /Users/rickl/Dropbox/Linux\ SecureCRT /S "CT/$1"; }

up() {
    # default parameter to 1 if non provided
    declare -i d=${@:-1}
    # ensure given parameter is non-negative. Print error and return if it is
    (( $d < 0 )) && (>&2 echo "up: Error: negative value provided") && return 1;
    # remove last d directories from pwd, append "/" in case result is empty
    cd "$(pwd | sed -E 's;(/[^/]*){0,'$d'}$;;')/";
}


#-----------------------------------------
# ALIASES
#-----------------------------------------
#alias textmate='/Users/rickl/build/TextMate/Applications/TextMate/TextMate.app/Contents/MacOS/TextMate'
alias editor='ssh editor.jt.com'
alias cdp='cd $OLDPWD'
alias lsd='ls -l | grep ^d'
alias ll='ls -ltr'
alias lt='ls -lt | head -10'
#alias ls='ls --color --time-style=full-iso'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias gpg='gpg --no-secmem-warning'
alias df='df -kh'
alias tree='tree -s' 
alias userinfo='getent passwd | column  -t -s: -n'
alias groupinfo='getent group | column  -t -s: -n'
alias load='cat /proc/loadavg'
alias vzip='unzip -lvM'
alias diff='colordiff'
alias jdiff='diff --side-by-side --ignore-case --ignore-blank-lines --ignore-all-spaces --suppress-common-lines'
alias cvsst='cvs -qn update'
# after adding in some .screenrc checks this is no longer necessary
#alias e='([ "$TERM" = screen ] && echo "YOU ARE IN A SCREEN SESSION - ALT-D to exit if you really want to.") || exit'
#alias exit='([ "$TERM" = screen ] && echo "YOU ARE IN A SCREEN SESSION - ALT-D to exit if you really want to.") || exit'
alias e='exit'
alias vnew='vim `ls -t | head -1 `' 
alias rm='rm -i'
alias rz='rz -y'
alias sz='sz -y'
alias lastedit='cat <($(tail -1 $HISTFILE)) | vim - '
alias wget='wget --no-check-certificate -c'
alias g='git'
alias gr='git rm -rf'
alias gs='git status'
alias ga='g add'
alias gc='git commit -m'
alias gp='git push origin master'
alias gl='git pull origin master'
alias gtl='git log'
alias gts='git status'
alias .p='pushd .'
alias p.='popd'
alias bigfiles='find . -type f 2>/dev/null | xargs du -a 2>/dev/null | awk "{ if ( $1 > 5000) print $0 }"'
alias verybigfiles='find . -type f 2>/dev/null | xargs du -a 2>/dev/null | awk "{ if ( $1 > 500000) print $0 }"'
# By default, grep will decode incoming text files in encoding set in environment variables. This will take CPU cycles. If you are searching plain ASCII match, like with programming language source code files, you can gain much speed by disabling the decoding. 
alias grep='LC_CTYPE=POSIX grep --color=auto' 
alias egrep='LC_CTYPE=POSIX egrep --color=auto'
alias fgrep='LC_CTYPE=POSIX fgrep --color=auto'
alias mount='mount | column -t'
alias lsmount='mount | sort | column -t | ccze -A'
alias hg='history | grep '
alias cisco_status='sc query cvpnd'
alias sdf_proxy='ssh -D 9999 -i ~/Dropbox/ssh/id_rsa -q -f -C -N devrick0@otaku.freeshell.org -p 443'
# debian/ubuntu specific aliases
alias ap='sudo aptitude'
alias apu='sudo aptitude update'
alias apsu='sudo aptitude safe-upgrade'
alias apfu='sudo aptitude full-upgrade'
alias aps='aptitude search'
alias apss='aptitude show'
alias api='sudo aptitude install'
alias apurge='sudo aptitude purge'
alias html='vim -f +"syn on" +"run! syntax/2html.vim" +"wq" +"q"'
alias nocomment='grep -Ev '\''^(#|$)'\'''
alias ipe='curl ipinfo.io/ip'
alias clean='sudo apt-get autoremove'
alias cleandeb='sudo apt-get remove -y $(deborphan)'
alias install='sudo apt-get install -y'
alias remove='sudo apt-get remove'
alias search='sudo apt-cache search'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias yinfo='sudo apt-cache show'

#------------------------------------------
# Mac aliases
# sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
# change banner time from 5 seconds to 1 second
# defaults write com.apple.notificationcenterui bannerTime -int 1
alias current_ssid="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias list_ssids="airport -s"
alias current_ip="ipconfig getifaddr en0"
alias wifi_history="defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep LastConnected -A 7"
#alias show_wifi_passwords="security find-generic-password -D "AirPort network password" -a "SSID" -gw"
#alias wifi_on="networksetup -setairportpower en0 on"
#alias wifi_off="networksetup -setairportpower en0 off"
alias wifi_on="networksetup -setairportpower airport on"
alias wifi_off="networksetup -setairportpower airport off"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias lock_10="defaults write com.apple.screensaver askForPasswordDelay -int 10"
alias jconsole='/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home/bin/jconsole'
alias java='/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home/bin/java'
alias javac='/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home/bin/java'
alias brewup='brew update && brew upgrade && brew cleanup'
alias screensaver="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &"
alias cdf='cd "$(osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)")"'
#alias updatedb="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist"
#alias updatedb="sudo /usr/libexec/locate.updatedb"
# replaced the two aliases above with this:
# $ cd /usr/local/bin
# $ ln -s /usr/libexec/locate.updatedb updatedb
alias software_updates="sudo softwareupdate -ia"
alias software_show_updates="sudo softwareupdate -l"
alias repair_permissions="sudo diskutil repairPermissions /"
alias renew_dhcp_lease="sudo ipconfig set en0 DHCP"
alias show_dhcp_info="ipconfig getpacket en0"
alias clear_dns_cache="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
#alias set_static_ip="networksetup -setmanual "Ethernet" 192.168.2.100 255.255.255.0 192.168.2.1"
alias enable_sshd="sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
#alias disable_sshd="sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist"
#alias join_wifi_network="networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD"
alias macmenubar_restart="killall -KILL SystemUIServer"
# git clone https://github.com/vlsi/ksar.git
alias ksar='java -jar ~/src/ksar/build/libs/ksar-5.2.4-SNAPSHOT-all.jar'
# kubernetes specific
alias kubectl="kubecolor"
alias k="kubectl"
alias kpa="kubectl get pod --all-namespaces"
alias ktp="kubectl top pod --all-namespaces"
alias hue_info="curl https://discovery.meethue.com"
# autocomplete for kubecolor
complete -o default -F __start_kubectl kubecolor
complete -o default -F __start_kubectl k
