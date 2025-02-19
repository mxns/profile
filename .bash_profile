eval "$(/opt/homebrew/bin/brew shellenv)"

# COMMAND LINE HISTORY
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
# Disable Bash Sessions on Mac
SHELL_SESSION_HISTORY=0
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="history -a"
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# export PROMPT_COMMAND=

# CONVENIENCE
secun() {
    expr $(date -j $* '+%s') - $(date '+%s')
}

pick() {
    while read i; do
	printf %s "$i? (y/n) " >/dev/tty
	read response </dev/tty
	case $response in
    	    y) echo $i;;
	    q) break;;
	esac
    done
}

dzap() {
    docker ps -a | sed '1d' | docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}" | pick | cut -c1-12 | xargs -I % bash -c 'docker kill %; docker rm %'
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mxns/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mxns/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mxns/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mxns/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/mxns/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/mxns/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mxns/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mxns/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mxns/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mxns/google-cloud-sdk/completion.bash.inc'; fi
