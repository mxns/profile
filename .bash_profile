
# COMMAND LINE HISTORY
export HISTSIZE="INFINITE"
# Disable Bash Sessions on Mac
SHELL_SESSION_HISTORY=0
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


