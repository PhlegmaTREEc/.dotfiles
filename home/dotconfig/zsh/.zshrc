# The following lines were added by compinstall
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '~/.config/zsh/.zshrc'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

TERM=xterm-256color

# man zshoptions - chect it for some options

## Shell config
if [ -f ~/.config/zsh/.shell_config ]; then
        source ~/.config/zsh/.shell_config
fi

## Alias
if [ -f ~/.config/zsh/.shell_aliases ]; then
	source ~/.config/zsh/.shell_aliases
fi

### Syntax highlighting
#if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fi
#
### Autosuggestions
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#fi
