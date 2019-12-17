# load plugins
source <(antibody init)

# shortcut to this dotfiles path is $DOTFILES
export DOTLY=~/.config/dotly/
source $DOTLY/bin/startup.sh

source ~/.fzf.zsh

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.zshrc_local ]]
then
  source ~/.zshrc_local
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

# Vim mode (esc to enter)
bindkey -v
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

export EDITOR='nvim'
export VISUAL='nvim'
alias ls='ls -G'
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
