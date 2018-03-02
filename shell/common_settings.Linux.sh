#Use pbcopy and pbpaste on Linux systems
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Set PATH to include non-standard locations
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.powerline/scripts

# Source color schemes
source ${HOME}/.shellcolors/scripts/base16-monokai.sh

# Set for CUDA
CUDA=/usr/local/cuda
export PATH=$PATH:$CUDA/bin

# Matlab on linux
export MATLAB=/usr/local/MATLAB/R2013b
export PATH=$PATH:$MATLAB/bin

# Source Intel compilers
[ -e /opt/intel/parallel_studio_xe_2015/psxevars.sh ] && (source /opt/intel/parallel_studio_xe_2015/psxevars.sh 2>&1 > /dev/null)

# Source Rustup
if [ -d $HOME/.cargo/ ]
then
  source $HOME/.cargo/env
  export PATH="$HOME/.cargo/bin:$PATH"
fi
