###################################
# Reference:
# https://github.com/mattmc3/zephyr
###################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###################################
# Base Config
###################################

for config_file ($ZDOTDIR/Base_configs/*.zsh) source $config_file

###################################
# Plugins
###################################

# Automatically install Antidote
[[ -d ${ZDOTDIR:-~}/antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/antidote

# Make plugin directories' names more friendly
zstyle ':antidote:bundle' use-friendly-names 'yes'

# source antidote
source ${ZDOTDIR:-~}/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

###################
# powerlevel10k
###################

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

###################
# fast-syntax-hightlight
###################

# Need to reset color for the completion menu because fast-syntax-highlight overrides this
[[ -n $LS_COLORS ]] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

###################
# fastfile
###################

source ${ZDOTDIR}/custom_plugins/fastfile.plugin.zsh
