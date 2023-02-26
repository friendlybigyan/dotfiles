export FZF_DEFAULT_OPTS="-m --cycle --border=rounded --border-label='ﲖ  ﲕ ' --color='gutter:-1,bg+:black,border:black,label:0,hl:9,hl+:9,fg+:6,pointer:1,prompt:3' --padding=5%,5% --margin=10%,10% --pointer=' ' --marker=' ' --prompt='  ' --info=inline:'  ' --separator='' "

# 
# autoexecute startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
    sh /home/chilly/.xinitrc
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep nomatch
setopt SHARE_HISTORY

# Bindings
bindkey -v
bindkey -a '^?' backward-delete-char
bindkey -v '^?' backward-delete-char
#
# MANUAL CONFIGURATION
#
export KEYTIMEOUT=1

# - Plugins

source ~/.config/zsh/plugins/typewritten/typewritten.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/auto-color-ls/auto-color-ls.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh

# - Aliases
alias n='nvim'
# alias nvim='sh ~/Scripts/nvim-kitty.sh'
alias ls='exa --color=auto'
alias ll='exa -l --color=auto'
alias la='exa -a --color=auto'
alias lla='exa -la --color=auto'
alias pac='sudo pacman -S --color=auto'
alias yay='yay --color=auto'
alias upd='sudo pacman -Syu --color=auto'
alias uni='sudo pacman -Rcns --color=auto'
alias zc='n ~/.config/zsh/.zshrc'
alias map='n ~/.config/sxhkd/sxhkdrc'
alias picrc='n ~/.config/picom/picom.conf'
alias bsprc='n ~/.config/bspwm/bspwmrc'
alias study='sudo ffocus -p study'
alias tree='exa icat'
alias op='sh ~/Scripts/launch'

function gt() {
    cd $( (cat ~/Scripts/data/dirpaths.txt ) | fzf --ansi )
}

function of() {
  
  launch $( (cat ~/Scripts/data/filepaths.txt )| fzf --ansi )
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# The following lines were added by compinstall

PS1='%B%F{yellow}%~%f%b > '
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
sudo dbus-daemon --system &> /dev/null

export LS_COLORS="*.png=1;33:*.jpg=1;33"
