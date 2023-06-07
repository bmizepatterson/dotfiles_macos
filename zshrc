# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export DOTFILES="$HOME/.dotfiles"


# Change ZSH Options


# Create Aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias pa='php artisan'

# Customize Prompts
PROMPT='
%~ %L %# '

RPROMPT='%*'


# Add Locations to the $PATH Variable

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Composer bin
export PATH="$PATH:$HOME/.composer/vendor/bin"


# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Ensure Brewfile is only created in ~/.dotfiles directory
function bbd() {

  local startingDirectory=$PWD;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Changing to $DOTFILES";
    cd $DOTFILES;
  fi

  echo "Dumping Brewfile";
  brew bundle dump --force --describe;

  if [[ $startingDirectory != $DOTFILES ]]; then
    echo "Returning to $startingDirectory";
    cd $startingDirectory;
  fi

}

function dotfiles() {
  bbd;

  echo "Refreshing VS Code extensions list";
  code --list-extensions > "$DOTFILES/vscode/vscode_extensions";
}


# Use ZSH plugins
