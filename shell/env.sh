# Vim all the way
export VISUAL=nvim
export EDITOR=nvim
export USE_EDITOR=nvim
export SVN_EDITOR=nvim

# My scripts
export PATH=$PATH:$HOME/.bin

# Python startup settings
export PYTHONSTARTUP="$HOME/.pyrc"

# Source Rustup
if [ -d $HOME/.cargo/ ]
then
  source $HOME/.cargo/env
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Setup NPM binaries
export PATH=$HOME/.npm/bin:$PATH

# Setup aliases
source $HOME/.config/aliases.sh

