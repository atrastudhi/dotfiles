# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true

# This line obtains information from the vcs.
zstyle ':vcs_info:*' unstagedstr '|%F{red}*%f'
zstyle ':vcs_info:*' stagedstr '|%F{green}+%f'
zstyle ':vcs_info:git:*' formats       '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b%a%u|%c) '
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

#NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#PROMPT
PROMPT='[%*] %~ ${vcs_info_msg_0_}$ '
