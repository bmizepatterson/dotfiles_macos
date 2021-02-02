# Set Variables


# Change ZSH Options


# Create Aliases
alias ls='ls -laFh'

# Customize Prompts
PROMPT='
%1~ %L %# '

RPROMPT='%*'


# Add Locations to the $PATH Variable


# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}


# Use ZSH plugins
