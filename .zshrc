autoload -U promptinit && promptinit
prompt elite2 yellow 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export WORKON_HOME="$PYENV_ROOT/versions/"

export LS_COLORS="$LS_COLORS:di=0;36:ln=0;93:ex=0;35:"
alias ls='gls -alhF --group-directories-first --color=auto'
alias e='emacs'
# elpy thinks `py.test` even though it has been `pytest` for a while
alias py.test='pytest'

#export PATH="/Users/agc/Library/Android/sdk/platform-tools:$PATH"
#export PATH="/Users/agc/Library/Android/sdk/cmdline-tools/latest/bin:$PATH"
#export PATH="/Users/agc/Library/Android/sdk/emulator:$PATH"
