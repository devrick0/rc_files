export LANG=en_US.UTF-8

#bindkey '^I' complete-word            # tab             | complete
#bindkey '^[[Z]' autosuggest-accept    # shift + tab     | autosuggest
bindkey '^I^I'  autosuggest-accept
bindkey '^r'    history-search-backward
bindkey '^n'    history-search-forward

if [ -f "/Users/USERNAME/.config/fabric/fabric-bootstrap.inc" ]; then . "/Users/USERNAME/.config/fabric/fabric-bootstrap.inc"; fi
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/Users/USERNAME/.local/bin:/Users/USERNAME/bin:/Users/USERNAME/ACLI:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation - commented out 20240819
#export ZSH="$HOME/.oh-my-zsh"
#source ${ZSH}

# Zsh Options
setopt alwaystoend            # Move cursor to end of line when recalling history
setopt autocd                 # Change directories by typing the directory name
setopt autocontinue           # Continue multi-line commands automatically
setopt autonamedirs           # Automatically assigns names to directories
setopt autopushd              # Push current directory onto stack with cd
setopt chaselinks             # Resolve symbolic links when changing directories
setopt completealiases        # Enable completion for command aliases
setopt completeinword         # Enable completion in the middle of a word
setopt correct                # Correct spelling errors in commands
setopt extendedglob           # Enable extended globbing features
setopt extendedhistory        # Record timestamps in history
setopt noflowcontrol          # Disable terminal flow control (^S and ^Q)
setopt noglobalrcs            # Prevent sourcing of global initialization files
setopt globcomplete           # Enable completion for glob patterns
setopt globdots               # Include dotfiles in glob patterns
setopt histignorealldups      # Remove all duplicate entries from history
setopt histignoredups         # Prevent consecutive duplicate commands in history
setopt histexpiredupsfirst    # Expire duplicate entries first
setopt histreduceblanks       # Remove extra spaces from commands in history
setopt histsavenodups         # Prevent duplicate commands from being saved in history
setopt histverify             # Verify history substitution before execution
setopt nohup                  # Prevent shell from being terminated on logout
setopt incappendhistory       # Append commands to the history file as they are entered
setopt interactive            # Enable interactive shell features
setopt interactivecomments    # Allow comments in interactive shell sessions
setopt listpacked             # Display completion results in a packed format
setopt listrowsfirst          # List completion results by rows first
setopt login                  # Enable login shell features
setopt longlistjobs           # Display detailed information about jobs
setopt markdirs               # Mark directories with a `/` in completion
setopt monitor                # Enable job control
setopt promptsubst            # Enable command substitution in prompts
setopt pushdignoredups        # Prevent duplicate entries in directory stack
setopt pushdminus             # Reverse the meaning of `+` and `-` in pushd and popd
setopt pushdsilent            # Suppress output of pushd and popd commands
setopt pushdtohome            # Push home directory onto stack with pushd
setopt rcexpandparam          # Expand parameters in brace expansions
setopt transientrprompt       # Hide right prompt after pressing Enter
setopt zle                    # Enable Zsh Line Editor
setopt histfindnodups         # Skip duplicate entries when searching through history
setopt histnostore            # Prevent the last command from being stored in history
setopt no_beep                # Disable terminal bell/beep
setopt noclobber              # Prevent overwriting files with redirection
setopt cdablevars             # Allow cd to directory by using its named variable
setopt notify                 # Notify immediately when a background job finishes

export TERM="xterm-256color"
export BAT_THEME=tokyonight_night
export HISTTIMEFORMAT='%F %T '     # Display timestamps in YYYY-MM-DD HH:MM:SS format
export EDITOR=vi
export VIMHOME=$HOME/.vim
export PROMPT_COMMAND="history -a"
export LESS="--LONG-PROMPT --ignore-case --QUIET -X"
export COLUMNS="120"

HISTSIZE=10000                    # Number of history entries stored in memory
SAVEHIST=100000                    # Number of history entries stored on disk
HISTFILE=~/.zsh_history            # File where history is stored
#ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions 1password ansible azure brew colored-man-pages docker extract gnu-utils iterm2 jira kubectl nmap pip podman pyenv python rsync ssh sudo thefuck tmux vi-mode zoxide zsh-navigation-tools)

#-----------------------------------------
# ALIASES
#-----------------------------------------
alias docker_ubuntu='docker run -it ubuntu /bin/bash'
alias docker_bashlatest='docker run -it --rm bash:4.4'
alias docker_nginx='docker run -d -p 80:80 --name webserver nginx'
alias ll='ls -ltr'
alias lt='ls -lt | head -10'
alias eza='eza --color=always --long'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias gpg='gpg --no-secmem-warning'
alias df='df -kh'
alias tree='tree -s'
alias userinfo='getent passwd | column -t -s: -n'
alias groupinfo='getent group | column -t -s: -n'
alias load='cat /proc/loadavg'
alias grep='LC_CTYPE=POSIX grep --color=auto'
alias egrep='LC_CTYPE=POSIX egrep --color=auto'
alias mount='mount | column -t'
alias hg='history | grep '
alias cdp='z $OLDPWD'
alias cd='z'
alias g='git'
alias gr='git rm -rf'
alias gs='git status'
alias ga='g add'
alias gc='git commit -m'
alias gp='git push origin master'
alias gl='git pull origin master'
alias gtl='git log'
alias gts='git status'
alias brewup='brew update && brew upgrade && brew cleanup'
alias lazyvimupdate="nvim --headless '+Lazy! sync' +qa"
alias current_ssid="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias list_ssids="airport -s"
alias current_ip="ipconfig getifaddr en0"
alias wifi_on="networksetup -setairportpower airport on"
alias wifi_off="networksetup -setairportpower airport off"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias rr="ranger"
alias card-status="gpg --card-status"
alias llama="ollama run llama3.1"
alias zsrc="source ~/.zshrc"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias yt="youtube-dl --restrict-filenames --no-overwrites --write-info-json --write-thumbnail --no-call-home --force-ipv4 --format 'best[height<=720]'"
alias yt_max="youtube-dl --restrict-filenames --no-overwrites --write-info-json --write-thumbnail --no-call-home --force-ipv4"
# these are 'tmuxinator' yml sessions under ~/.config/tmuxinator
alias tmuxm="tmuxinator start monitoring"
alias tmuxs="tmuxinator start scratchpad"

# Mac setup for pomodoro timer
alias work="timer 30m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -sound Crystal"

#-----------------------------------------
# FUNCTIONS
#-----------------------------------------
# Function to show history with timestamps
function historyt() {
  fc -li 1 | while read -r number date time command; do
    timestamp="$date $time"
    epoch=$(date -j -f "%Y-%m-%d %H:%M" "$timestamp" "+%s" 2>/dev/null)
    if [ $? -eq 0 ]; then
      formatted_date=$(date -r $epoch "+%Y-%m-%d %H:%M:%S")
      echo "$formatted_date $command"
    else
      echo "$timestamp $command"
    fi
  done
}

# Countdown function
function countdown() {
  date1=$((`date +%s` + $1));
  while [ "$date1" -ge `date +%s` ]; do
    echo -ne "$(date -u --date @$((date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
  done
}

# Stopwatch function
function stopwatch() {
  date1=`date +%s`;
  while true; do
    echo -ne "$(date -u --date @$((`date +%s` - date1)) +%H:%M:%S)\r";
    sleep 0.1
  done
}
function fliptable() { echo "（╯°□°）╯ ┻━┻"; }

function URLEncode {
    local dataLength="${#1}";
    local index;
    for ((index = 0; index < dataLength; index++)); do
        local char="${1:index:1}";
        case $char in
            [a-zA-Z0-9.~_-]) printf "$char";;
            *) printf "%%%02X" "'$char";;
        esac;
    done;
}

function curl_debug() {
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

function genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=20
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

function mdc(){
    mkdir -p "$1" && cd "$1"
}

function snow() {
        clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}

function up() {
    declare -i d=${@:-1}
    (( $d < 0 )) && (>&2 echo "up: Error: negative value provided") && return 1;
    cd "$(pwd | sed -E 's;(/[^/]*){0,'$d'}$;;')/";
}

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}

function days_until() {
  echo $(( ($(date -d "${1}" +%s) - $(date +%s)) / 86400 )) 
}

function download () {
  curl -O ${DOWNLOAD}/"${@}" 
}

function cert {
  cn="${1:-${ts}}"
  expire="${2:-8}"
  openssl req -new \
    -newkey rsa:4096 -nodes \
    -subj "/CN=${cn}" \
    -x509 -sha512 -days "${expire}" \
    -keyout "s.${cn}.pem" -out "s.${cn}.crt"
  openssl x509 -in "s.${cn}.crt" -noout \
    -subject -issuer -dates -serial
  for ft in \-sha1 \-sha256 \-sha512 ; do \
    openssl x509 -in "s.${cn}.crt" -noout \
    -fingerprint ${ft} | tr -d ":" ; done 
}

function cidr {
  whois -h "whois.arin.net" -- \
  "n + $(curl -s https://icanhazip.com/)" | \
    grep "CIDR:" 
}

function convert_epoch {
  date -d "@${1}" 
}

function convert_secs {
  ((h=${1}/3600)) ; ((m=(${1}%3600)/60)) ; ((s=${1}%60))
  printf "%02d:%02d:%02d\n" ${h} ${m} ${s} 
}

function encrypt {  # list preferred id last
  output="${HOME}/$(basename ${1}).${today}.enc"
  gpg --armor --encrypt \
    --output ${output} \
    -r 0xFF00000000000000 \
    -r EMAIL@ADDRESS.COM \
    "${1}" && echo "${1} -> ${output}" 
}

function reveal {
  output=$(echo "${1}" | rev | cut -c16- | rev)
  gpg --decrypt --output ${output} "${1}" \
    && echo "${1} -> ${output}" 
}

function rand_pass {
  LC_ALL=C tr -dc 'A-Z1-9' < /dev/urandom | \
    tr -d "1IOS5U" | fold -w 30 | head -n10 | \
    sed "-es/./ /"{1..26..5} | cut -c2- | tr " " "-" 
}

function secret {
  output="${HOME}/$(basename ${1}).${today}.enc"
  gpg --armor --symmetric \
      --output ${output} \
      "${1}" && echo "${1} -> ${output}" 
}

function username () {  # "username 8" - generate 8 usernames
  for i in {1..${1}} ; do
  printf "%s%s\n" \
    "$(awk 'length > 2 && length < 12 {print(tolower($0))}' \
    /usr/share/dict/words | grep -v "'" | sort -R | head -n2 | \
    tr "\n" "_" | iconv -f utf-8 -t ascii//TRANSLIT)" \
    "$(tr -dc "[:digit:]" < /dev/urandom | fold -w 4 | head -1)"
  done 
}

# Function to run Tesseract OCR and output to stdout by default
tess_extract() {
    if [ -z "$1" ]; then
        echo "Usage: tess_extract <image_file>"
    else
        # Run tesseract with stdout option
        tesseract "$1" stdout
    fi
}

# Function to get the full working directory, not abbreviated with ~
function prompt_dir {
  print -P "%/"
}

# Function to get formatted date
function prompt_date {
  print -P "%D{%A, %b. %d, %Y %H:%M:%S}"
}

# Precommand function for handling the first line prompt
precmd() {
  left=$(prompt_dir)
  right=$(prompt_date)

  # Calculate space for dots ensuring it's always perfectly aligned
  filler_width=$((COLUMNS - ${#left} - ${#right} - 2))
  
  # If filler_width goes negative, reset it to 0 to avoid issues
  if [[ $filler_width -lt 0 ]]; then
    filler_width=0
  fi

  # Use printf for more precise filler control and ensure alignment
  filler=$(printf "%${filler_width}s" | tr ' ' '.')

  # Print the first line with full directory and right-aligned date
  print -P "%F{green}${left}%f${filler}%F{yellow}${right}%f"
}

# Set up a simple two-line prompt with the second line just being the command prompt
PROMPT='%F{blue}>%f '

#-----------------------------------------
# k8s
#-----------------------------------------
export KUBECONFIG=~/.kube/config
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias podname=''

#-----------------------------------------
# Security
#-----------------------------------------
alias gobust="gobuster dir -w ~/src/SecLists/Discovery/Web-Content/combined_words.txt -x php,php3,html -u"
alias gobustdns="gobuster dns -w ~/src/SecLists/Discovery/DNS/subdomains-top1million-110000.txt -d"
alias gobustvhost="gobuster vhost -v -w ~/src/SecLists/DiscoveryDNS/subdomains-top1million-110000.txt -u"
alias gobusts3="gobuster s3 -w ~/src/SecLists/Dicsovery/DNS/subdomains-top5000.txt"

#-----------------------------------------
# Jira
#-----------------------------------------
alias jirahist="jira PROJECT list --history"

zstyle ":completion:*" auto-description "specify %d"
zstyle ":completion:*" cache-path "${HOME}/.zsh_cache"
zstyle ":completion:*" completer _expand _complete _correct _approximate
zstyle ":completion:*" file-sort modification reverse
zstyle ":completion:*" format "completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" hosts off
zstyle ":completion:*" list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ":completion:*" menu select=long-list select=0
zstyle ":completion:*" use-cache on
zstyle ":completion:*" verbose yes
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*:kill:*" command "ps -u ${USER} -o pid,%cpu,tty,cputime,cmd"

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"
#eval "$(starship init zsh)"

source /Users/USERNAME/.config/op/plugins.sh
