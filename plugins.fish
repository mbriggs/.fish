if test -f /usr/local/Cellar/autojump/22.2.4/share/autojump/autojump.fish
  source /usr/local/Cellar/autojump/22.2.4/share/autojump/autojump.fish
end

if test -f $HOME/.aliases
  source $HOME/.aliases
end

if test -d $RBENV_ROOT
  source (rbenv init -|psub)
end

if test -d $NVM_DIR
  source ./nvm.fish
end

if test -f "/etc/profile.d/nuvango.sh"
  source /etc/profile.d/nuvango.sh
end
